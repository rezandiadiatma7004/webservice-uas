<?php
/*******************************************************
 * SIPDASH - Front End Reader (Single File)
 * Dropdown tabel + DB view (relasi) + API view + Add Record via API + Export CSV (DB)
 *******************************************************/

/* ====== KONFIGURASI DATABASE ====== */
$DB_DRIVER = 'mysql';
$DB_HOST   = 'sql313.infinityfree.com';
$DB_PORT   = '3306';
$DB_NAME   = 'if0_40291120_sipdash';
$DB_USER   = 'if0_40291120';
$DB_PASS   = 'Semarangkota12';
$CHARSET   = 'utf8mb4';

/* ====== DAFTAR TABEL (WHITELIST) ====== */
$ALLOWED_TABLES = [
  'opd',
  'data_catalog',
  'requests',
  'documents',
  'approvals',
];

/* ====== API ====== */
$API_BASE = 'https://uas-rezandi.free.nf/Api.php';

/* ====== DROPDOWN RELASI UNTUK ADD RECORD ====== */
$FK_DROPDOWNS = [
  'requests' => [
    'requester_user_id' => ['table' => 'users',          'value' => 'id', 'label' => 'name'],
    'opd_id_owner'      => ['table' => 'opd',            'value' => 'id', 'label' => 'name'],
    'data_catalog_id'   => ['table' => 'data_catalog',   'value' => 'id', 'label' => 'title'],
    'status_id'         => ['table' => 'request_status', 'value' => 'id', 'label' => 'label'],
  ],
  'documents' => [
    'request_id'        => ['table' => 'requests',     'value' => 'id', 'label' => 'subject'],
    'data_catalog_id'   => ['table' => 'data_catalog', 'value' => 'id', 'label' => 'title'],
    'uploader_user_id'  => ['table' => 'users',        'value' => 'id', 'label' => 'name'],
    'opd_id'            => ['table' => 'opd',          'value' => 'id', 'label' => 'name'],
  ],
  'approvals' => [
    'request_id'        => ['table' => 'requests', 'value' => 'id', 'label' => 'subject'],
    'approver_user_id'  => ['table' => 'users',    'value' => 'id', 'label' => 'name'],
  ],
  'data_catalog' => [
    'opd_id'             => ['table' => 'opd',   'value' => 'id', 'label' => 'name'],
    'created_by_user_id' => ['table' => 'users', 'value' => 'id', 'label' => 'name'],
  ],
];

/* ====== HELPER: KONEKSI PDO ====== */
function pdo_connect($DB_DRIVER, $DB_HOST, $DB_PORT, $DB_NAME, $DB_USER, $DB_PASS, $CHARSET) {
    $dsn = "{$DB_DRIVER}:host={$DB_HOST};port={$DB_PORT};dbname={$DB_NAME};charset={$CHARSET}";
    $opt = [
        PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
        PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
        PDO::MYSQL_ATTR_USE_BUFFERED_QUERY => true,
    ];
    return new PDO($dsn, $DB_USER, $DB_PASS, $opt);
}

/* ====== HELPER: AMANKAN NAMA TABEL ====== */
function pick_table(array $allowed, ?string $input): string {
    if (!$input) return $allowed[0];
    return in_array($input, $allowed, true) ? $input : $allowed[0];
}

/* ====== HELPER: AMBIL SEMUA BARIS (DB MODE, DENGAN RELASI) ====== */
function fetch_all(PDO $pdo, string $table): PDOStatement {
    switch ($table) {
        case 'requests':
            return $pdo->query("
                SELECT
                    r.*,
                    u.name   AS requester_user_id,
                    o.name   AS opd_id_owner,
                    dc.title AS data_catalog_id,
                    rs.code  AS status_id
                FROM requests r
                LEFT JOIN users u            ON r.requester_user_id = u.id
                LEFT JOIN opd o              ON r.opd_id_owner      = o.id
                LEFT JOIN data_catalog dc    ON r.data_catalog_id   = dc.id
                LEFT JOIN request_status rs  ON r.status_id         = rs.id
            ");

        case 'documents':
            return $pdo->query("
                SELECT
                    d.*,
                    r.subject AS request_id,
                    dc.title  AS data_catalog_id,
                    u.name    AS uploader_user_id,
                    o.name    AS opd_id
                FROM documents d
                LEFT JOIN requests r       ON d.request_id       = r.id
                LEFT JOIN data_catalog dc  ON d.data_catalog_id  = dc.id
                LEFT JOIN users u          ON d.uploader_user_id = u.id
                LEFT JOIN opd o            ON d.opd_id           = o.id
            ");

        case 'approvals':
            return $pdo->query("
                SELECT
                    a.*,
                    r.subject AS request_id,
                    u.name    AS approver_user_id
                FROM approvals a
                LEFT JOIN requests r  ON a.request_id       = r.id
                LEFT JOIN users u     ON a.approver_user_id = u.id
            ");

        case 'data_catalog':
            return $pdo->query("
                SELECT
                    dc.*,
                    o.name AS opd_id,
                    u.name AS created_by_user_id
                FROM data_catalog dc
                LEFT JOIN opd o    ON dc.opd_id             = o.id
                LEFT JOIN users u  ON dc.created_by_user_id = u.id
            ");

        default:
            return $pdo->query("SELECT * FROM `{$table}`");
    }
}

/* ====== HELPER: AMBIL NAMA KOLOM DARI HASIL QUERY ====== */
function result_columns(PDOStatement $stmt): array {
    $cols = [];
    for ($i = 0; $i < $stmt->columnCount(); $i++) {
        $meta = $stmt->getColumnMeta($i);
        $cols[] = $meta['name'];
    }
    return $cols;
}

/* ====== HELPER: EXPORT CSV (DB MODE) ====== */
function export_csv(PDO $pdo, string $table): void {
    $stmt = fetch_all($pdo, $table);
    $cols = result_columns($stmt);

    header('Content-Type: text/csv; charset=utf-8');
    header("Content-Disposition: attachment; filename={$table}.csv");

    $out = fopen('php://output', 'w');
    fputcsv($out, $cols);

    while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
        $line = [];
        foreach ($cols as $c) {
            $val = $row[$c] ?? '';
            if (is_array($val)) $val = json_encode($val, JSON_UNESCAPED_UNICODE);
            $line[] = $val;
        }
        fputcsv($out, $line);
    }
    fclose($out);
    exit;
}

/* ====== HELPER: API FETCH (GET) ====== */
function api_fetch_records(string $baseUrl, string $table): array {
    $url = rtrim($baseUrl, '/') . '/records/' . rawurlencode($table);

    $ch = curl_init($url);
    curl_setopt_array($ch, [
        CURLOPT_RETURNTRANSFER => true,
        CURLOPT_TIMEOUT => 15,
    ]);
    $res = curl_exec($ch);

    if ($res === false) {
        $err = curl_error($ch);
        curl_close($ch);
        throw new RuntimeException("API cURL error: {$err}");
    }

    $http = curl_getinfo($ch, CURLINFO_HTTP_CODE);
    curl_close($ch);

    if ($http !== 200) {
        throw new RuntimeException("API HTTP {$http}: {$res}");
    }

    $data = json_decode($res, true);
    if (!is_array($data) || !isset($data['records']) || !is_array($data['records'])) {
        throw new RuntimeException("Format API tidak sesuai");
    }

    return $data['records'];
}

/* ====== HELPER: API CREATE (POST) ====== */
function api_create_record(string $baseUrl, string $table, array $data): array {
    $url = rtrim($baseUrl, '/') . '/records/' . rawurlencode($table);

    $ch = curl_init($url);
    curl_setopt_array($ch, [
        CURLOPT_RETURNTRANSFER => true,
        CURLOPT_TIMEOUT => 15,
        CURLOPT_CUSTOMREQUEST => 'POST',
        CURLOPT_HTTPHEADER => ['Content-Type: application/json'],
        CURLOPT_POSTFIELDS => json_encode($data, JSON_UNESCAPED_UNICODE),
    ]);

    $res = curl_exec($ch);
    if ($res === false) {
        $err = curl_error($ch);
        curl_close($ch);
        throw new RuntimeException("API cURL error: {$err}");
    }

    $http = curl_getinfo($ch, CURLINFO_HTTP_CODE);
    curl_close($ch);

    $decoded = json_decode($res, true);
    if ($http < 200 || $http >= 300) {
        throw new RuntimeException("API HTTP {$http}: {$res}");
    }
    return is_array($decoded) ? $decoded : ['raw' => $res];
}

/* ====== HELPER: UNION KEY UNTUK KOLOM API MODE ====== */
function array_keys_union(array $rows): array {
    $keys = [];
    foreach ($rows as $r) {
        if (!is_array($r)) continue;
        foreach ($r as $k => $_) $keys[$k] = true;
    }
    return array_keys($keys);
}

/* ====== HELPER: KOLOM TABEL (UNTUK FORM ADD) ====== */
function db_columns(PDO $pdo, string $dbName, string $table): array {
    $stmt = $pdo->prepare("
        SELECT COLUMN_NAME
        FROM INFORMATION_SCHEMA.COLUMNS
        WHERE TABLE_SCHEMA = :db AND TABLE_NAME = :tbl
        ORDER BY ORDINAL_POSITION
    ");
    $stmt->execute([':db' => $dbName, ':tbl' => $table]);
    return array_map(fn($r) => $r['COLUMN_NAME'], $stmt->fetchAll(PDO::FETCH_ASSOC));
}

/* ====== HELPER: OPTIONS DROPDOWN (UNTUK FORM ADD) ====== */
function db_select_options(PDO $pdo, string $table, string $valueCol, string $labelCol): array {
    $sql = "SELECT `{$valueCol}` AS v, `{$labelCol}` AS t FROM `{$table}` ORDER BY `{$labelCol}` ASC";
    return $pdo->query($sql)->fetchAll(PDO::FETCH_ASSOC);
}

/* ====== HELPER: RENDER CELL ====== */
function render_cell($val): string {
    if (is_null($val)) {
        return "<em style='color:#94a3b8'>(NULL)</em>";
    }
    if (is_string($val) && $val !== '' && ($val[0] === '{' || $val[0] === '[')) {
        $pretty = $val;
        $decoded = json_decode($val, true);
        if (json_last_error() === JSON_ERROR_NONE) {
            $pretty = json_encode($decoded, JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT);
        }
        return "<code class='json'>" . htmlspecialchars($pretty, ENT_QUOTES, 'UTF-8') . "</code>";
    }
    return htmlspecialchars((string)$val, ENT_QUOTES, 'UTF-8');
}

/* ====== MAIN ====== */
try {
    $pdo = pdo_connect($DB_DRIVER, $DB_HOST, $DB_PORT, $DB_NAME, $DB_USER, $DB_PASS, $CHARSET);
} catch (Throwable $e) {
    http_response_code(500);
    echo "<h2>Koneksi database gagal.</h2>";
    echo "<pre>" . htmlspecialchars($e->getMessage(), ENT_QUOTES, 'UTF-8') . "</pre>";
    exit;
}

$selected = pick_table($ALLOWED_TABLES, $_GET['table'] ?? null);
$useApi   = (isset($_GET['api']) && $_GET['api'] === '1');
$addMode  = (isset($_GET['add']) && $_GET['add'] === '1');

/* ADD RECORD (POST) */
if ($_SERVER['REQUEST_METHOD'] === 'POST' && ($_POST['_action'] ?? '') === 'add') {
    $postTable = pick_table($ALLOWED_TABLES, $_POST['_table'] ?? null);

    $cols = db_columns($pdo, $DB_NAME, $postTable);
    $skip = ['id', 'created_at', 'updated_at'];
    $cols = array_values(array_diff($cols, $skip));

    $payload = [];
    foreach ($cols as $c) {
        if (isset($_POST[$c]) && $_POST[$c] !== '') {
            $payload[$c] = $_POST[$c];
        }
    }

    api_create_record($API_BASE, $postTable, $payload);
    header('Location: ?table=' . urlencode($postTable) . '&api=1');
    exit;
}

/* EXPORT CSV (DB MODE) */
if (isset($_GET['export']) && $_GET['export'] === '1') {
    export_csv($pdo, $selected);
}

/* LOAD DATA */
try {
    if ($useApi) {
        $apiUrl  = rtrim($API_BASE, '/') . '/records/' . rawurlencode($selected);
        $rows    = api_fetch_records($API_BASE, $selected);
        $columns = array_keys_union($rows);
    } else {
        $stmt    = fetch_all($pdo, $selected);
        $columns = result_columns($stmt);
        $rows    = $stmt->fetchAll();
    }
} catch (Throwable $e) {
    http_response_code(500);
    echo "<h2>Query gagal untuk tabel: " . htmlspecialchars($selected, ENT_QUOTES, 'UTF-8') . "</h2>";
    echo "<pre>" . htmlspecialchars($e->getMessage(), ENT_QUOTES, 'UTF-8') . "</pre>";
    exit;
}

$dropdowns = $FK_DROPDOWNS[$selected] ?? [];
?>
<!doctype html>
<html lang="id">
<head>
  <meta charset="utf-8"/>
  <meta name="viewport" content="width=device-width,initial-scale=1"/>
  <title>SIPDASH - Viewer</title>
  <style>
    :root { --bg:#0f172a; --card:#111827; --muted:#94a3b8; --text:#e5e7eb; --accent:#22c55e; --accent-2:#06b6d4; --border:#1f2937; }
    *{box-sizing:border-box;}
    body{margin:0;padding:24px;font-family:ui-sans-serif,system-ui,-apple-system,Segoe UI,Roboto,Helvetica,Arial;background:linear-gradient(180deg,#0b1220,#0f172a);color:var(--text);}
    .container{max-width:1200px;margin:0 auto;}
    .card{background:radial-gradient(1200px 200px at 10% -10%, rgba(34,197,94,0.12), transparent),
                 radial-gradient(1000px 160px at 90% -10%, rgba(6,182,212,0.12), transparent),
                 var(--card);
          border:1px solid var(--border);border-radius:16px;padding:20px;box-shadow:0 10px 30px rgba(0,0,0,.35);}
    h1{font-size:24px;margin:0 0 12px 0;letter-spacing:.3px;}
    .subtitle{color:var(--muted);margin-bottom:16px;}
    .controls{display:flex;gap:12px;align-items:center;flex-wrap:wrap;margin-bottom:16px;}
    select,button,a.button{background:#0b1220;color:var(--text);border:1px solid var(--border);border-radius:10px;padding:10px 12px;font-size:14px;outline:none;transition:transform .06s ease,border-color .15s ease;}
    select:hover,button:hover,a.button:hover{border-color:var(--accent);}
    button:active,a.button:active{transform:scale(0.98);}
    a.button{text-decoration:none;display:inline-block;}
    .pill{display:inline-flex;align-items:center;gap:8px;border:1px dashed var(--border);padding:8px 10px;border-radius:9999px;color:var(--muted);font-size:12px;}
    .table-wrap{width:100%;overflow:auto;border:1px solid var(--border);border-radius:12px;background:#0b1220;}
    table{border-collapse:separate;border-spacing:0;width:100%;}
    thead th{position:sticky;top:0;z-index:1;background:#0e1627;color:#cbd5e1;text-align:left;font-weight:600;font-size:13px;border-bottom:1px solid var(--border);padding:10px 12px;white-space:nowrap;}
    tbody td{border-bottom:1px solid #0f213a;padding:10px 12px;font-size:13px;vertical-align:top;}
    tbody tr:nth-child(even) td{background:rgba(255,255,255,0.01);}
    code.json{font-family:ui-monospace,SFMono-Regular,Menlo,Monaco,Consolas,"Liberation Mono",monospace;font-size:12px;color:#a7f3d0;white-space:pre-wrap;word-break:break-word;}
    .footer{display:flex;justify-content:space-between;align-items:center;gap:12px;color:var(--muted);font-size:12px;margin-top:12px;}
    .kbd{font-family:ui-monospace,monospace;padding:0 6px;background:#0e1627;border:1px solid var(--border);border-radius:6px;}
  </style>
</head>
<body>
  <div class="container">
    <div class="card">
      <h1>SIPDASH — Sistem Informasi Pelayanan Data & Arsip Semarang Hebat</h1>
      <div class="subtitle">Rezandi Adiatma | 24.01.53.7004</div>

      <!-- CONTROLS (GET) -->
      <form class="controls" method="get">
        <?php if ($useApi): ?>
          <input type="hidden" name="api" value="1">
        <?php endif; ?>

        <label for="table" class="pill">Pilih tabel</label>
        <select name="table" id="table" onchange="this.form.submit()">
          <?php foreach ($ALLOWED_TABLES as $tbl): ?>
            <option value="<?= htmlspecialchars($tbl, ENT_QUOTES, 'UTF-8'); ?>" <?= $selected === $tbl ? 'selected' : '' ?>>
              <?= htmlspecialchars($tbl, ENT_QUOTES, 'UTF-8'); ?>
            </option>
          <?php endforeach; ?>
        </select>

        <a class="button" href="?table=<?= urlencode($selected) ?>&export=1" title="Export CSV">Export CSV</a>
        <a class="button" href="?table=<?= urlencode($selected) ?>&api=1" title="View table by API">View table by API</a>
        <a class="button" href="?table=<?= urlencode($selected) ?>" title="View table by DB">View table by DB</a>
        <a class="button" href="?table=<?= urlencode($selected) ?>&add=1<?= $useApi ? '&api=1' : '' ?>" title="Add Record">Add Record</a>

        <?php if ($useApi && isset($apiUrl)): ?>
          <span class="pill">API source: <strong><?= htmlspecialchars($apiUrl, ENT_QUOTES, 'UTF-8'); ?></strong></span>
        <?php endif; ?>

        <span class="pill">Tabel aktif: <strong><?= htmlspecialchars($selected, ENT_QUOTES, 'UTF-8'); ?></strong></span>
      </form>

      <!-- ADD RECORD (POST) -->
      <?php if ($addMode): ?>
        <?php
          $cols = db_columns($pdo, $DB_NAME, $selected);
          $skip = ['id','created_at','updated_at'];
          $cols = array_values(array_diff($cols, $skip));
        ?>
        <div class="card" style="margin-top:12px; padding:12px; background:#0b1220;">
          <div class="subtitle" style="margin:0 0 8px 0;">
            Add record (<?= htmlspecialchars($selected, ENT_QUOTES, 'UTF-8'); ?>) via Api.php
          </div>

          <form method="post">
            <input type="hidden" name="_action" value="add">
            <input type="hidden" name="_table" value="<?= htmlspecialchars($selected, ENT_QUOTES, 'UTF-8'); ?>">

            <div style="display:grid; grid-template-columns: repeat(2, minmax(0, 1fr)); gap:10px;">
              <?php foreach ($cols as $c): ?>
                <div>
                  <div style="font-size:12px; color:#94a3b8; margin-bottom:4px;">
                    <?= htmlspecialchars($c, ENT_QUOTES, 'UTF-8'); ?>
                  </div>

                  <?php if (isset($dropdowns[$c])): ?>
                    <?php
                      $cfg  = $dropdowns[$c];
                      $opts = db_select_options($pdo, $cfg['table'], $cfg['value'], $cfg['label']);
                    ?>
                    <select name="<?= htmlspecialchars($c, ENT_QUOTES, 'UTF-8'); ?>"
                            style="width:100%; padding:10px; border-radius:10px; border:1px solid var(--border); background:#0e1627; color:var(--text);">
                      <option value="">-- pilih --</option>
                      <?php foreach ($opts as $o): ?>
                        <option value="<?= htmlspecialchars((string)$o['v'], ENT_QUOTES, 'UTF-8'); ?>">
                          <?= htmlspecialchars((string)$o['t'], ENT_QUOTES, 'UTF-8'); ?>
                        </option>
                      <?php endforeach; ?>
                    </select>
                  <?php else: ?>
                    <input name="<?= htmlspecialchars($c, ENT_QUOTES, 'UTF-8'); ?>"
                           style="width:100%; padding:10px; border-radius:10px; border:1px solid var(--border); background:#0e1627; color:var(--text);" />
                  <?php endif; ?>
                </div>
              <?php endforeach; ?>
            </div>

            <div style="margin-top:10px; display:flex; gap:10px;">
              <button type="submit">Submit</button>
              <a class="button" href="?table=<?= urlencode($selected); ?><?= $useApi ? '&api=1' : '' ?>">Cancel</a>
            </div>
          </form>
        </div>
      <?php endif; ?>

      <div class="table-wrap">
        <table>
          <thead>
            <tr>
              <?php foreach ($columns as $c): ?>
                <th><?= htmlspecialchars($c, ENT_QUOTES, 'UTF-8'); ?></th>
              <?php endforeach; ?>
            </tr>
          </thead>
          <tbody>
            <?php if (count($rows) === 0): ?>
              <tr><td colspan="<?= count($columns) ?>">(Tidak ada data)</td></tr>
            <?php else: ?>
              <?php foreach ($rows as $r): ?>
                <tr>
                  <?php foreach ($columns as $c): ?>
                    <td><?= render_cell($r[$c] ?? null); ?></td>
                  <?php endforeach; ?>
                </tr>
              <?php endforeach; ?>
            <?php endif; ?>
          </tbody>
        </table>
      </div>

      <div class="footer">
        <div>
          <span class="kbd">ESC</span> untuk batal export •
          <span class="kbd">CTRL/CMD + F</span> cari di tabel (native browser)
        </div>
      </div>
    </div>
  </div>
</body>
</html>
