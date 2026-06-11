#!/usr/bin/env bash
# verify-product.sh <slug> — pre-deploy gate for a Copper Bay Labs static product.
# Run from the copper-bay-labs root (or anywhere; pass an absolute path as $2 base).
# Exits 0 and prints DEPLOY-READY on success; exits 1 with NEEDS FIX otherwise.
set -u
slug="${1:-}"
base="${2:-$(cd "$(dirname "$0")/../.." && pwd)}"   # default: parent of forge/
dir="$base/$slug"
if [ -z "$slug" ] || [ ! -d "$dir" ]; then echo "usage: verify-product.sh <slug> [base-dir]"; exit 2; fi
cd "$dir" || exit 2

url="https://labs.copperbaytech.com/$slug/"
fail=0
note() { echo "  - $1"; fail=1; }

echo "== verify: $slug ($dir) =="

# 1. JS syntax
for js in *.js; do
  [ -e "$js" ] || continue
  node --check "$js" 2>/dev/null || note "node --check failed: $js"
done

# 2. Required files
for f in index.html app.js styles.css about.html 404.html README.md robots.txt sitemap.xml favicon.svg og-image.png apple-touch-icon.png; do
  [ -e "$f" ] || note "missing file: $f"
done

# 3/4. Correct slug in canonical/og/robots/sitemap (the #1 fork bug)
grep -q "rel=\"canonical\" href=\"$url\"" index.html || note "index.html canonical not -> $url"
grep -q "og:url\" content=\"$url\"" index.html || note "index.html og:url not -> $url"
grep -q "$url" robots.txt || note "robots.txt does not reference $url"
grep -q "$url" sitemap.xml || note "sitemap.xml does not reference $url"
# wrong-sibling-slug detector: any other tool's slug in canonical/og of index.html
for other in shipsafe leakcheck exposurecheck depcheck complykit hardencheck invoicequick bookdeposit creatorvault pactsign recoverflow; do
  [ "$other" = "$slug" ] && continue
  grep -Eq "(canonical|og:url)[^>]*labs.copperbaytech.com/$other/" index.html && note "index.html points at sibling slug: $other"
done

# 5. Slop
grep -REn "TODO|FIXME|Lorem ipsum|REPLACE_ME|XXX_PLACEHOLDER" --include=*.js --include=*.html . >/dev/null 2>&1 && note "slop markers found (TODO/FIXME/Lorem/REPLACE/placeholder)"
grep -REn "console\.log" --include=*.js . >/dev/null 2>&1 && note "stray console.log in app.js"

# 6. gitignore
{ [ -e .gitignore ] && grep -q "BUILD-NOTES.md" .gitignore; } || note ".gitignore missing or does not ignore BUILD-NOTES.md"

echo ""
if [ "$fail" -eq 0 ]; then echo "DEPLOY-READY: $slug"; exit 0; else echo "NEEDS FIX: $slug (see above)"; exit 1; fi
