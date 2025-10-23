#!/usr/bin/env bash
set -euo pipefail

mkdir -p public/logos

# Google Drive direct-download helper (handles confirm token)
gdrive_get () {
  FILE_ID="$1"
  OUT="$2"

  COOKIE_JAR="$(mktemp)"
  CONFIRM=$(curl -sc "$COOKIE_JAR" "https://drive.google.com/uc?export=download&id=${FILE_ID}" \
    | tr -d '\n' | sed -n 's/.*confirm=\([^&]*\).*/\1/p')

  if [[ -z "${CONFIRM}" ]]; then
    # small files usually don't need confirm
    curl -L --retry 3 --retry-all-errors \
      "https://drive.google.com/uc?export=download&id=${FILE_ID}" -o "$OUT"
  else
    curl -Lb "$COOKIE_JAR" -L --retry 3 --retry-all-errors \
      "https://drive.google.com/uc?export=download&confirm=${CONFIRM}&id=${FILE_ID}" -o "$OUT"
  fi

  file "$OUT" | grep -qi 'PNG image' || {
    echo "Downloaded $OUT but it doesn't look like a PNG. Check share perms / link." >&2
    exit 1
  }
}

echo "Fetching logos to public/logos/ ..."

# Immutability.Space (hero)
gdrive_get "1TTKVsRek7iSThC8qpBQE8iY40AyhBgpR" "public/logos/immutability.png"

# Human Atlas
gdrive_get "1y2_2iGligGFwrUDKxJr5tgVEwwgQD238" "public/logos/humanatlas.png"

# ELI5
gdrive_get "1gTKKnxKCuyjVqOZWdubj80H1KlNFazvd" "public/logos/eli5.png"

# LeanDeck
gdrive_get "1nItC_eMu5nZ-cZ3Pon-xKzpmXl-etlBK" "public/logos/leandeck.png"

echo "Done."