# Build/ship record — JSONSafe

- **Date:** 2026-06-13
- **Idea:** `json-formatter-private` (score 78) — top zero-secret backlog idea with a dev audience.
- **Live:** https://labs.copperbaytech.com/jsonsafe/ (HTTP 200 verified at deploy)
- **Repo:** https://github.com/Dukotah/jsonsafe (public, GitHub Pages, main/root)
- **Lane:** zero-secret / `needsOwner: []` — no keys, no backend, pure client-side.

## What shipped
A 4-in-1 JSON utility, everything in-browser via the native `JSON` parser:
1. **Format & validate** — beautify/minify, indent 2/4/tab, deep key-sort, syntax highlighting,
   copy/download, validate-on-type with **line:column** error location, stats (type/size/keys/depth).
2. **Tree explorer** — collapsible tree, expand/collapse all.
3. **Semantic diff** — object/key-aware (not text-line): added / removed / changed with dotted
   paths (`meta.port`, `tags[1]`). Key-order-only diffs report identical; type changes (`1` vs `"1"`)
   are caught. This is the feature gap vs it-tools and similar aggregators.
4. **Share link** — encodes both diff docs in the URL **fragment**, which browsers never transmit,
   so even a shared comparison never hits a server. Unicode-safe base64, 8 KB cap.

## Positioning / distribution hook
Anchored to the **2025 JSONFormatter.org leak** (80,000+ retained user files incl. secrets) — the
"Why JSONSafe exists" section and about page both reference it. The privacy-by-construction angle +
the semantic diff are the wedge. Dev audience = the agency-buyer audience (per the established rule:
only tools whose users can become Copper Bay Tech clients are worth distributing).

## QA
- `node --check` clean; `verify-product.sh` → DEPLOY-READY.
- Diff/sort logic unit-tested in Node (add/remove/change/array-resize, key-order-insensitivity,
  type-change detection, unicode base64 roundtrip — all pass).
- Visual QA via headless Chrome: Format tab (sample → beautify, highlighting, stats chips) and Diff
  tab (compare → color-coded rows with correct paths) both render correctly. XSS-safe: all user data
  via `textContent`/`createElement`, no `innerHTML` on user data.

## Reconciled
- `ideas.json`: `json-formatter-private` → status `shipped`, liveUrl + repo set. (shipped count → 12 in ideas.json)
- Hub: added to the "Web, SEO & media" group + hub `sitemap.xml`.

## Not done (pending, same as the rest of the portfolio)
- Lead-CTA: JSONSafe is a utility, not a detector — no findings-driven "get it fixed" hook by nature
  (like the other wedges). Footer demand-capture band is present via the template.
- Owner-gated distribution (launch posts, community answers) still the real constraint — funnel 0 leads.
- Optional future: a CLI/GitHub-Action twin if it gets traction (mirror the LeakCheck-action play).
