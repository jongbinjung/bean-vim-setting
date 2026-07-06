-- sqlfluff:dialect:`!p
import os
aliases = {
    'bq': 'bigquery',
    'pg': 'postgres',
    'presto': 'trino',
    'sf': 'snowflake',
    'spark': 'sparksql',
}
parts = os.path.basename(fn).split('.')
mid = parts[-2] if len(parts) >= 3 and parts[-1] == 'sql' else ''
snip.rv = aliases.get(mid, mid or 'ansi')`
$0
