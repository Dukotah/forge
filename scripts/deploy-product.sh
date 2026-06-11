#!/usr/bin/env bash
# deploy-product.sh <slug> "<repo description>" — ship a Copper Bay Labs static product to
# GitHub Pages at https://dukotah.github.io/<slug>/. Idempotent-ish: if the repo already exists
# it just pushes; if Pages is already on it skips. Requires gh authed as Dukotah.
set -u
slug="${1:-}"
desc="${2:-Free tool by Copper Bay Labs.}"
base="${3:-$(cd "$(dirname "$0")/../.." && pwd)}"
dir="$base/$slug"
if [ -z "$slug" ] || [ ! -d "$dir" ]; then echo "usage: deploy-product.sh <slug> \"<description>\" [base-dir]"; exit 2; fi
cd "$dir" || exit 2

# Gate on verification first (absolute path — we've already cd'd into the product dir).
"$base/forge/scripts/verify-product.sh" "$slug" "$base" || { echo "ABORT: verification failed."; exit 1; }

printf 'BUILD-NOTES.md\n' > .gitignore
if [ ! -d .git ]; then
  git init -b main -q
  git add -A
  git -c user.name="Dukotah" -c user.email="dukotah@gmail.com" \
      commit -q -m "$slug — initial public build (Copper Bay Labs)" \
      -m "Co-Authored-By: Claude Opus 4.8 (1M context) <noreply@anthropic.com>"
fi

if gh repo view "Dukotah/$slug" >/dev/null 2>&1; then
  echo "repo exists; pushing"
  git push -u origin main 2>&1 | tail -1
else
  gh repo create "Dukotah/$slug" --public --source=. --push --description "$desc" 2>&1 | tail -1
fi

# Enable Pages (ignore 'already exists')
gh api -X POST "repos/Dukotah/$slug/pages" -f "source[branch]=main" -f "source[path]=/" >/dev/null 2>&1 \
  || echo "(Pages already enabled or pending)"

# Poll until live (project pages inherit the user-site custom domain)
url="https://labs.copperbaytech.com/$slug/"
i=0
until [ "$(curl -s -o /dev/null -w '%{http_code}' "$url")" = "200" ] || [ $i -ge 40 ]; do sleep 3; i=$((i+1)); done
code="$(curl -s -o /dev/null -w '%{http_code}' "$url")"
echo "LIVE? $url -> $code (after ~$((i*3))s)"
[ "$code" = "200" ] || { echo "Pages still building; re-check in a minute."; exit 0; }
echo "SHIPPED: $url  — now reconcile ideas.json (status->shipped, liveUrl, repo) + builds/$slug.md"
