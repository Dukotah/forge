#!/usr/bin/env bash
# new-product.sh <slug> "<Brand>" "<Tagline>" "<Desc>" [date]
# Scaffolds a new Copper Bay Labs product from forge/templates/product/ with tokens filled.
# Creates ../<slug>/ next to forge/. Does NOT build the tool or render PNGs — that's the BUILD stage.
set -eu
slug="${1:-}"; brand="${2:-}"; tagline="${3:-}"; desc="${4:-}"; date="${5:-}"
if [ -z "$slug" ] || [ -z "$brand" ]; then
  echo 'usage: new-product.sh <slug> "<Brand>" "<Tagline>" "<Desc>" [YYYY-MM-DD]'; exit 2
fi
root="$(cd "$(dirname "$0")/../.." && pwd)"     # copper-bay-labs/
tpl="$root/forge/templates/product"
dest="$root/$slug"
[ -d "$dest" ] && { echo "ABORT: $dest already exists"; exit 1; }
[ -n "$date" ] || date="$(date +%F 2>/dev/null || echo 2026-01-01)"

mkdir -p "$dest"
cp "$tpl"/index.html "$tpl"/app.js "$tpl"/styles.css "$tpl"/about.html "$tpl"/404.html \
   "$tpl"/robots.txt "$tpl"/sitemap.xml "$tpl"/favicon.svg "$dest"/

# README for the product (public) — start from a one-liner
printf '# %s\n\n%s\n\nFree, no-signup, runs in your browser. Part of Copper Bay Labs.\n' "$brand" "$desc" > "$dest/README.md"
# BUILD-NOTES (internal, gitignored)
printf '# %s — build notes (internal)\n\n- Scaffolded %s from templates/product.\n- TODO: build the tool, render og/touch PNGs, run verify-product.sh.\n- needsOwner / paid tier: (none yet)\n' "$brand" "$date" > "$dest/BUILD-NOTES.md"
printf 'BUILD-NOTES.md\n' > "$dest/.gitignore"

# Token replacement across the scaffolded text files.
esc() { printf '%s' "$1" | sed -e 's/[\/&]/\\&/g'; }
for f in index.html app.js about.html 404.html robots.txt sitemap.xml; do
  sed -i \
    -e "s/{{SLUG}}/$(esc "$slug")/g" \
    -e "s/{{BRAND}}/$(esc "$brand")/g" \
    -e "s/{{TAGLINE}}/$(esc "$tagline")/g" \
    -e "s/{{DESC}}/$(esc "$desc")/g" \
    -e "s/{{DATE}}/$(esc "$date")/g" \
    "$dest/$f"
done

echo "Scaffolded $dest"
echo "Next: build the tool in index.html + app.js, render og-image.png (1200x630) + apple-touch-icon.png (180x180),"
echo "then: forge/scripts/verify-product.sh $slug   &&   forge/scripts/deploy-product.sh $slug \"<desc>\""
