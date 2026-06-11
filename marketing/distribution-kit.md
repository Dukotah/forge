# Copper Bay Labs — Distribution Kit (cold-domain warm-up)

> Goal: get traffic + warm the domain so the gated channels (HN, Reddit) stop auto-filtering us.
> Strategy: (A) submit to no-gatekeep directories for permanent backlinks, (B) answer-where-asked
> in live threads (comments don't get domain-filtered), (C) once warm, return to HN/Reddit.
> All hands-on by the owner — these are copy-paste ready. Log results in `ops-log/metrics-ledger.md`.

---

## PART A — Directory submissions (do these first; they warm the domain)

These have **no spam gate** and give real, indexable, mostly **dofollow** backlinks. Backlinks are
what teach Google + HN/Reddit that the domain is legit. Each takes ~5–10 min.

### Tier 1 — highest authority, do this week
| Directory | Why | How |
|-----------|-----|-----|
| **AlternativeTo** (alternativeto.net) | DR ~82, huge comparison traffic. **Best angle:** list each tool as a free alternative to a known paid one (see mapping below). | Sign up → "Add application" per tool. |
| **SaaSHub** (saashub.com) | Free, ~10 min, quick approval, dofollow. | "Submit a product" → one entry per tool (or one for the hub). |
| **SourceForge** (sourceforge.net) | DR ~90, accepts web tools. | Create project / submit listing. |
| **Indie Hackers** (indiehackers.com) | Founder audience + a "Products" directory. Post the hub + a short "I built 16 free tools" story. | Profile → add Product + one Post. |

### Tier 2 — indie/maker directories (fast, friendly, more backlinks)
- **Plug Your Build** (plugyourbuild.com) — all-build directory.
- **Altern** (altern.ai) — all-purpose tool directory.
- **Awesome Indie** (awesomeindie.com) — submit the hub.
- **Startup directories megalist** — https://startupproject.org/resources/places-to-launch/ (work down it over time).

### Tier 3 — GitHub "awesome" lists (dofollow, dev audience; submit via PR or issue)
- Security tools (LeakCheck, ExposureCheck, HardenCheck, CSP Builder, ComplyKit) → search GitHub for `awesome-security`, `awesome-web-security`, `awesome-appsec` → open a PR adding the tool.
- Privacy (EXIF Stripper) → `awesome-privacy`.
- Dev tools (all) → `awesome-devtools`, `free-for.dev`.
- *(PRs to awesome lists are normal + welcomed if the tool genuinely fits the list.)*

### AlternativeTo angle — list each tool as an alternative to a paid incumbent
This captures "free alternative to X" search traffic — high intent.
| Tool | List as an alternative to |
|------|---------------------------|
| Image Compressor | TinyPNG, Squoosh, Compressor.io |
| LeakCheck | GitGuardian, TruffleHog |
| EXIF Stripper | ImageOptim, online EXIF removers |
| CSP Builder | Report URI CSP generator |
| Schema Markup Generator | Merkle Schema Generator, RankRanger |
| OG Previewer | OpenGraph.xyz, metatags.io |
| InvoiceQuick | Invoice Simple, Zoho Invoice |
| ComplyKit | Termly, iubenda |
| DepCheck | Snyk, Dependabot |
| HardenCheck | securityheaders.com |

---

## PART B — Answer-where-asked (works TODAY; comments aren't domain-filtered)

Find a LIVE thread with the matching question, give a genuinely useful answer, link the tool only
where it actually helps. Use the owner's aged Reddit/HN/forum accounts. Never copy-paste identically
across threads — adapt to the specific question. Search these to find threads:
- Reddit search + Google: `site:reddit.com "how do I remove location from photo"`, etc.
- Subs to watch: r/webdev, r/devops, r/privacy, r/photography, r/SEO, r/web_design, r/indiehackers, r/SaaS.

### Draft 1 — LeakCheck (threads: "did I commit an API key", "check code for secrets")
> If you just need a quick gut-check before committing, you can paste the file (or your `.env`) into a
> client-side scanner — it pattern-matches for exposed keys/tokens and runs entirely in the browser, so
> nothing you paste gets uploaded (which matters when the input is literally secrets). I use this one:
> https://labs.copperbaytech.com/leakcheck/ . For ongoing protection also add a pre-commit hook like
> gitleaks so it can't happen again. And if a key was already pushed anywhere, rotate it — it's burned.

### Draft 2 — EXIF Stripper (threads: "remove GPS/location from photo", "does posting photos reveal where I live")
> Photos from phones/cameras often embed EXIF metadata, including the exact GPS coordinates where the
> shot was taken — so yes, posting a raw photo can leak your location. You can check and strip it without
> uploading the image anywhere: https://labs.copperbaytech.com/exifviewer/ shows you what's embedded
> (incl. GPS on a map) and lets you download a clean copy with all metadata removed. Re-saving/screenshotting
> also drops most metadata, but it's worth confirming rather than assuming.

### Draft 3 — Image Compressor (threads: "compress image without uploading", "reduce image size for web")
> If you'd rather not upload your images to a random server, a browser-based compressor does it all
> locally — resize + re-encode to JPG/WebP and you usually cut 60–80% off the file size. This one's free
> and no-signup: https://labs.copperbaytech.com/imagecompressor/ (drop in up to 30 at once, see the
> savings per image). For web specifically, WebP at ~80% quality and capping the longest edge to ~1920px
> is a good default.

---

## PART C — Once the domain is warm (≈1–2 weeks of A + B)
Return to the gated channels — they'll stop auto-killing you:
- **HN Show HN** (retry — by then the domain has reputation). One tool, the sharpest (LeakCheck).
- **Reddit self-posts** — now your link-posts pass. Use the per-tool → per-sub matching (DISTRIBUTION playbook).
- **Product Hunt** — a proper launch of the hub once there's some traction to show.

## Priority order (do this exact sequence)
1. AlternativeTo — 3 tools (Image Compressor, LeakCheck, EXIF Stripper) ← start here, biggest SEO.
2. SaaSHub + Indie Hackers (hub).
3. One answer-where-asked per day from Part B.
4. Tier 2/3 directories as you have time.
5. After ~2 weeks → retry HN + Reddit.
