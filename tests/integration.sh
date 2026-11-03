#!/usr/bin/env bash
set -euo pipefail
QUIDRA="${1:?usage: integration.sh /path/to/quidra}"
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
TMP="$(mktemp -d)"
trap 'rm -rf "$TMP"' EXIT
export HOME="$TMP"
export QUIDRA_CACHE_DIR="$TMP/cache"
"$QUIDRA" package validate "$ROOT"
"$QUIDRA" install "$ROOT"
"$QUIDRA" run "$ROOT/tests/smoke.qui" > "$TMP/output"
printf 'SGVsbG8=\nHello\n\nlength-error\npad-bit-error\nunaligned-error\n' > "$TMP/expected"
diff -u "$TMP/expected" "$TMP/output"
