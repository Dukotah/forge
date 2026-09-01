# ExposureCheck — Launch Kit

> **For the owner to post.** One-paste-ready copy for every channel below.
> Automated posting is against platform ToS — you fire these from your own accounts.
> No fabricated metrics, users, or testimonials — these are honest.
> Log what you posted and any results in `ops-log/metrics-ledger.md`.

**Tool URL:** https://labs.copperbaytech.com/exposurecheck/
**Guides:**
- https://labs.copperbaytech.com/exposurecheck/guides/how-to-check-website-exposed-files.html
- https://labs.copperbaytech.com/exposurecheck/guides/fix-exposed-env-file.html
- https://labs.copperbaytech.com/exposurecheck/guides/prevent-exposed-files-website.html
- https://labs.copperbaytech.com/exposurecheck/guides/pre-launch-exposed-files-audit.html

**Audience:** Developers, indie hackers, freelancers, and anyone who just deployed a site — especially people building with AI coding tools (Lovable, Bolt, Cursor, v0) where rushed deploys regularly ship `.env` files, `.git` folders, and API keys baked into the client bundle to production.
**Core promise:** Point ExposureCheck at your live URL and find what's already publicly accessible — exposed `.env` files, public `.git` folders, leaked source maps, hardcoded API keys in your bundle, and leaked internal endpoints — before someone else does.

---

## Posting order (highest leverage first)

1. **Show HN** — technically interesting implementation; the developer audience is exactly who needs this; weekdays 9–11 AM ET
2. **Product Hunt** — biggest discoverability window; Tuesday/Wednesday 12:01 AM PT; 1–2 days after Show HN
3. **r/SideProject** — welcoming to launches; post after PH to reach a different slice
4. **r/webdev** — Showoff Saturday thread or answer-where-asked in "pre-launch security" and "vibe coding security" threads
5. **r/indiehackers** — founder narrative about the rushed-deploy / vibe-coding exposure problem

---

## 1. Show HN

> Rule check: Show HN is for things you built. Weekdays 9–11 AM ET for best visibility.
> Stay in the thread for the first 2 hours to respond. HN rewards technical honesty — lead with the interesting implementation decision, not the marketing pitch.

**Title:**
> Show HN: ExposureCheck – enter your live URL to find exposed .env files, .git folders, and API keys baked into your bundle

**Body:**
> Built this after watching how often vibe-coded and quickly-deployed sites ship secrets that anyone with a browser can already access. The failure mode is different from what source code scanners catch: the source code was fine — the secret was in `.env` where it belongs — but then the deploy script copied it into the web root, or the bundler compiled `VITE_OPENAI_API_KEY` into the client JavaScript, or the server's default config left `.git` web-accessible. These are deploy-time mistakes that only appear when you look at the live site the way an attacker would.
>
> ExposureCheck probes the paths that come first on an attacker's list — `.env`, `.env.production`, `.env.local`, `/.git/config`, `/.git/HEAD`, common source map paths, and backup/config file variants — and scans the returned content for API keys baked into the bundle. Two modes:
>
> **URL mode:** Enter your live URL; the tool fetches public paths via a CORS proxy and the scanner runs in your browser tab against the returned bytes. The CORS proxy is a necessary concession to the same-origin policy — a browser tab can't directly fetch a third-party domain — and it's worth being honest about the tradeoff: the proxy sees the URL you're scanning, though it doesn't see the analysis results (those run locally).
>
> **Paste mode:** Drop in your built HTML or bundled JS and everything runs 100% locally. No CORS proxy, nothing leaves the tab. This is the right mode for staging URLs, internal sites, or when you want the zero-network guarantee.
>
> A few implementation questions I'd genuinely appreciate feedback on:
>
> **Path coverage vs. brute-forcing:** The tool probes a curated list of high-signal paths (the ones that appear in real security disclosures and pentest write-ups) rather than attempting path enumeration. An exposed `.env` at `/api/.env` instead of `/.env` won't be found. I'm not sure where the right balance is — or whether a heuristic "look for `.env` and `.git` URL variants referenced in `<link>` / `<script>` `src` attributes from the fetched HTML" would help without becoming a generic crawler.
>
> **API key detection in bundles:** Webpack and Vite inline environment variables into compiled JavaScript when you reference `process.env.SOMETHING` or a `VITE_`-prefixed variable — this is correct bundler behavior for client-side config. But it's also how production API keys end up in the client bundle. The scanner checks fetched JS against named provider patterns (AWS, Stripe, OpenAI, GitHub, Google, etc.). I'm interested in whether there's a useful distinction to surface between "key designed to be client-side" (Stripe publishable key, Google Maps embed key) and "key that definitely shouldn't be" (Stripe secret key, OpenAI API key) in the severity display.
>
> **Source map handling:** If the scanner finds a source map URL in response headers or inline script tags, it fetches and reports it. Source maps are often the more serious exposure — they hand an attacker your unminified original source, including server-side code paths and business logic that ended up in a shared module, not just a single credential.
>
> **The .git case:** Confirming `.git` is accessible takes one request (`/.git/HEAD`). Actually reconstructing the source history from a public `.git` takes many more requests — fetching object files and pack files. The tool confirms the exposure and flags it as critical but doesn't attempt reconstruction; that would be the attacker's next step, not a self-check.
>
> Four guides cover the fix and prevention workflow: what to do if you find an exposed `.env`; a systematic audit guide; a pre-launch checklist for catching exposures before go-live; and a prevention guide with the exact server configs (nginx, Apache, Netlify, Vercel, Cloudflare Pages) that block these paths permanently.
>
> https://labs.copperbaytech.com/exposurecheck/
>
> Runs on GitHub Pages. Vanilla JS, no dependencies. The CORS proxy dependency is a third-party service (acknowledged in the UI and FAQ).

**First comment (post immediately after it goes live):**
> Some things the tool can't do that I'd flag preemptively:
>
> **Authentication and private networks:** URL mode can only reach publicly accessible URLs — anything behind a login, VPN, or firewall is inaccessible to the CORS proxy. Paste mode works fine for build artifacts you have locally or on a staging server.
>
> **Non-standard paths:** If the `.env` file is at `/backend/.env` or `/api/.env` instead of the web root, it won't be found. The tool probes common paths, not every possible location. A proper internal audit needs a directory fuzzer (`ffuf`, `feroxbuster`) with a wordlist — this is a quick sanity check, not a comprehensive enumeration.
>
> **False positives in key scan:** Webpack and Vite sometimes inline base64-encoded assets, polyfill strings, and other high-entropy data that can trigger generic entropy patterns. Named provider patterns (AWS `AKIA`, Stripe `sk_live_`, OpenAI `sk-`, GitHub `ghp_`, etc.) have a low false-positive rate because those prefixes are provider-specific. The generic entropy patterns may fire on legitimate high-entropy-looking data. The tool shows which pattern triggered so you can decide.
>
> **The .git reconstruction scope:** The tool confirms whether `.git` is accessible and flags it critical. It doesn't attempt to reconstruct source history — that would involve fetching object files and pack files, which goes beyond a self-check into attacker-territory behavior. If you confirm the exposure, fix it with server config (block the path) and rotate any credentials that were in the history.
>
> I'm interested in the question of what the right balance is between "fast sanity check you actually run before every deploy" and "comprehensive crawl that takes minutes." Right now it's intentionally fast and bounded.

---

## 2. Product Hunt

**Tagline:**
> Scan your live site for exposed .env files, .git folders, and API keys in your bundle

**Description:**
> ExposureCheck points at your deployed URL and finds what's already publicly accessible: exposed `.env` files, public `.git` folders, leaked source maps, API keys baked into your client bundle, and leaked internal endpoints — the exposures that rushed deploys and AI-generated sites regularly ship to production.
>
> **Why this exists:** The failure mode it catches is different from what source code scanners find. The secret was in `.env` where it belongs — but then the deploy script copied it into the web root. Or the Vite build compiled `VITE_OPENAI_API_KEY` directly into the JavaScript bundle (correct Vite behavior — `VITE_` prefix variables are client-side by design) but it was a production API key that should never have been client-side. Or the `.git` folder ended up web-accessible because of a misconfigured server block. These are deploy-time configuration errors that don't show up in any source code scan — they only appear when you look at the live site the way a visitor (or an attacker) would.
>
> **Two scan modes:**
> - **URL mode:** Enter the live URL; ExposureCheck fetches public paths via a CORS proxy and scans in your browser. The proxy is necessary to cross the browser's same-origin boundary — acknowledged honestly in the UI and FAQ.
> - **Paste mode:** Paste your built HTML or JS; everything runs 100% locally with zero network calls. Right for staging URLs, internal sites, or when you want the privacy guarantee.
>
> **What it checks:**
> - Exposed `.env`, `.env.production`, `.env.local` — the exact files that expose database passwords and API keys
> - Public `.git` folder — a reachable `/.git/` lets anyone reconstruct your entire source history and unminified code
> - Source maps — `.map` files that hand your original, unminified source to the world
> - API keys in the client bundle — 40+ provider-specific patterns (AWS, Stripe, OpenAI, Anthropic, Google, GitHub, Slack, Twilio, and more) scanned in the fetched JavaScript
> - Internal endpoints — admin, staging, and internal URLs visible in front-end code
> - Security headers — a best-effort check for missing baseline response headers
>
> **Four in-depth guides** covering the complete response and prevention workflow:
> - What to do when you find an exposed `.env` file (credential rotation, server config fix, git history cleanup)
> - How to audit any site systematically for exposed files
> - Pre-launch checklist: catch exposures before the site goes live
> - Prevention: the server configs (nginx, Apache, Netlify, Vercel, Cloudflare Pages) that block these paths permanently
>
> Free, runs in browser, no signup.
>
> Built by Copper Bay Labs.

**Topics to select on PH:** Developer Tools, Security, No-Code/Low-Code, Open Source

**First comment (post this immediately after it goes live):**
> Happy to answer questions. The ones that usually come up:
>
> **Is this an attack tool?** No — it only requests paths a public visitor could already reach. There's no brute-forcing, no path enumeration beyond a curated list of known-exposure paths, and no crawling. It's a defensive self-check. Only scan sites you own or are authorized to test.
>
> **Does URL mode send my site's content to a server?** The CORS proxy sees the URL and returns the fetched bytes — that's its job, to cross the browser's same-origin boundary. The analysis (pattern matching, key detection) runs locally in your browser. If you want zero third-party involvement, paste mode scans your build output locally with no network calls.
>
> **What if my file is at a non-standard path?** The tool probes a curated set of common paths (the ones that appear in real security disclosures). If the exposed file is at `/api/.env` instead of `/.env`, it won't find it. For comprehensive enumeration, you'd need a directory fuzzer with a wordlist — this is the quick pre-deploy sanity check.
>
> **Are some API keys safe to have in the bundle?** Yes — Stripe publishable keys, Google Maps embed keys, and Firebase app configs are designed to be client-side. The tool tries to flag the clearly-wrong cases with higher severity. But "designed to be client-side" and "safe to expose" aren't identical — an over-permissioned key can still be misused. The fix guide covers what to do for each case.

---

## 3. r/SideProject

> Rule check: r/SideProject explicitly welcomes "I built this" posts. Self-posts and links are fine.
> Best on weekdays (Tue–Thu) between 9–11 AM ET.
> Don't post the same day as your PH launch — wait a day so it hits a different audience.

**Title:**
> I built a free browser tool that scans your live site for exposed .env files, public .git folders, and API keys baked into your bundle

**Body:**
> Hey r/SideProject — sharing something I built: **ExposureCheck**
>
> https://labs.copperbaytech.com/exposurecheck/
>
> **What it does:** Enter your live URL and it probes the paths attackers check first — exposed `.env` files, public `.git` folders, source maps, and API keys baked into your compiled JavaScript bundle. It checks what's actually accessible on your deployed site, not just what's in your source code.
>
> **Why I built it:** The failure mode that prompted it is different from what source code scanners find. Your source was fine — the API key was in `.env` where it belongs. But then the deploy script copied `.env` into the web root, or Vite compiled a production API key directly into the bundle (it was prefixed `VITE_` so the bundler treated it as client-side config), or the server's default block left `.git` web-accessible. These aren't source code mistakes — they're deploy-time configuration mistakes that only appear when you look at the live site the way anyone with a browser would.
>
> **Two modes:**
> - **URL mode** — enter your live URL; the tool fetches public paths via a CORS proxy and scans locally in your browser. (The proxy is necessary because browsers block cross-origin fetches — acknowledged honestly in the UI.)
> - **Paste mode** — paste your built HTML or JS; everything runs 100% locally with no network calls.
>
> **Four guides** covering what to do when you find something:
> - [What to do if you find an exposed .env file](https://labs.copperbaytech.com/exposurecheck/guides/fix-exposed-env-file.html)
> - [How to audit a website for exposed files](https://labs.copperbaytech.com/exposurecheck/guides/how-to-check-website-exposed-files.html)
> - [Pre-launch checklist for exposed files — run before you go live](https://labs.copperbaytech.com/exposurecheck/guides/pre-launch-exposed-files-audit.html)
> - [How to prevent exposed files permanently (server configs for nginx, Apache, Netlify, Vercel)](https://labs.copperbaytech.com/exposurecheck/guides/prevent-exposed-files-website.html)
>
> Free, no signup, runs in the browser.
>
> Happy to hear what paths or checks are missing.

---

## 4. r/webdev

> Rule check: r/webdev allows tool sharing on Showoff Saturday (weekly thread). Link posts outside the thread may be removed. Answer-where-asked is appropriate any time someone asks about pre-deploy checklists, site security, exposed environment files, or vibe-coding security issues.

**Showoff Saturday post (use in the weekly sticky thread):**
> Built ExposureCheck — enter your live URL and it checks what's publicly accessible: exposed `.env` files, public `.git` folders, source maps, and API keys baked into your compiled bundle. Scans in your browser via CORS proxy or paste-mode (fully local, zero network). Four guides for fix and prevention workflows including server configs for nginx, Apache, Netlify, and Vercel.
>
> https://labs.copperbaytech.com/exposurecheck/

**Answer-where-asked one-liner** (for threads about "pre-launch security checklist", "is my .env file exposed", "accidentally deployed .git folder", "vibe coding security", "Lovable/Bolt/Cursor security issues", "Vite environment variables in bundle"):
> ExposureCheck (https://labs.copperbaytech.com/exposurecheck/) scans your live URL for exactly that — it checks whether `.env`, `.git`, source maps, and API keys in your bundle are publicly accessible. Runs in your browser, no signup. Also has guides for the fix and prevention steps.

---

## 5. r/indiehackers

> Rule check: r/indiehackers (and indiehackers.com itself) welcome build stories and tool launches.
> The IH community skews toward solo developers and AI-assisted builders — a large portion deploying vibe-coded sites where these exposures are most common.
> Community is supportive of honest "here's what I built and why" posts.

**Title:**
> Built a free browser tool that scans your deployed site for exposed .env files, .git folders, and API keys — because source code scanners miss the deploy step

**Body:**
> I've been building a suite of free, browser-based security and compliance tools under Copper Bay Labs for indie developers — things you know you should check before shipping but skip because they require installing CLI tools or paying for a scanner. ExposureCheck is the one that scans your *live deployed* site:
>
> https://labs.copperbaytech.com/exposurecheck/
>
> **The problem I kept seeing:** There's a class of security incident that source code scanning doesn't catch, because the mistake happens at deploy time, not write time. A few examples of how it happens in practice:
>
> - The `.env` file is correctly in `.gitignore`. The deployment script runs `rsync ./ server:/var/www/site/` and copies `.env` into the web root because nobody excluded it from the sync.
> - Vite compiles `VITE_OPENAI_API_KEY=sk-prod-...` directly into the JavaScript bundle — correct Vite behavior, `VITE_` prefix means client-side config. But it was a production secret that should have stayed server-side.
> - The server's nginx config serves the whole project directory, including `/.git/`. Anyone can fetch `/.git/HEAD` and `/.git/config`, then reconstruct the full source history from the object files.
> - Source maps are enabled in the production webpack config (`devtool: 'source-map'`). The `.map` files are accessible from the deployed URL, handing anyone the original unminified source including business logic.
>
> All of these are invisible to a source code scan. They only appear when you look at the live site the way an attacker (or a monitoring bot) would.
>
> **What I built:** A scanner that probes your live URL for these exposures. Enter a URL and it fetches the paths a public visitor could already reach — `.env` variants, `.git`, source maps, bundle JavaScript — and scans them locally in your browser tab. The CORS proxy is a necessary concession to browser security (cross-origin fetches are blocked without one) and I'm upfront about the tradeoff in the UI and FAQ. If you want a zero-network result, paste-mode runs the same analysis on your local build output with nothing leaving the tab.
>
> **Four guides** covering what to do when you find something:
> - What to do immediately when you find an exposed `.env` file — rotation order, server config, git history cleanup
> - How to systematically audit any website for exposed files
> - Pre-launch checklist: catch exposures before go-live, while you still have the staging window
> - Prevention: the exact server configs (nginx, Apache, Netlify, Vercel, Cloudflare Pages) that block these paths permanently
>
> Free, runs in browser, no signup.
>
> Happy to hear what's missing — especially from anyone who's seen a vibe-coded or AI-assisted site get hit.

---

## Additional channels

### AlternativeTo / SaaSHub

- **AlternativeTo listing:** Submit as a free alternative to Detectify (for the exposed-file detection use case), ImmuniWeb SiteGuard (for the quick live-site check), and Nikto (for the audience who wants a no-install browser-based option)
- **Tags for SaaSHub:** security, exposed-files, env-scanner, secret-detection, developer-tools, free, client-side, website-security
- **AlternativeTo categories:** Security, Developer Tools

### Answer-where-asked threads (organic, not promotional)

Good threads to reference when you're genuinely answering a question:

- r/webdev, r/programming: "exposed .env file on my site", "accidentally deployed .git folder", "is my live site leaking secrets", "vibe coding security", "Lovable/Bolt/v0 deployment security", "Vite environment variables exposed in bundle"
- r/devops: "pre-deploy security checklist", "what to check before launching a site to production"
- r/netsec: reference the guides (not the tool homepage) in genuine discussions about exposed-file detection and web server misconfiguration. r/netsec rules require substantive contributions — link to the relevant guide.
- Stack Overflow: questions about "nginx block .git access", "Netlify prevent .env being served", "Vercel exclude files from deployment", "source maps disabled in production webpack" — the prevention guide has the exact configs.
- GitHub issues/discussions in AI coding tool repos (Lovable, Bolt, v0, Cursor, Copilot) where users ask about deployment security: the pre-launch checklist guide is the most relevant reference.

**The one-line answer-where-asked text:**
> ExposureCheck (https://labs.copperbaytech.com/exposurecheck/) scans your live URL for exactly that — enter the URL and it checks whether `.env`, `.git`, source maps, and API keys in your bundle are accessible to anyone. Runs in your browser, no signup.

### r/netsec note

r/netsec rules require substantial write-ups or published research — a direct tool link post will be removed. The four ExposureCheck guides are appropriate to share in relevant threads about web server misconfiguration, exposed `.env` files, or source map leakage. Link to the relevant guide, not the tool homepage.

---

## Timing notes

- **Show HN:** Weekday 9–11 AM ET. Write a substantive first comment immediately — HN rewards technical honesty about implementation decisions and known limitations. Stay in the thread for the first 2 hours.
- **Product Hunt:** 1–2 days after Show HN, Tuesday or Wednesday 12:01 AM PT. Post the first comment immediately after it goes live.
- **r/SideProject:** Same week as PH, different day (not the same day as either HN or PH).
- **r/webdev Showoff Saturday:** Any Saturday.
- **r/indiehackers:** After PH and HN, when you have some feedback or data to reference.

---

## What to log

After each post, record in `forge/ops-log/metrics-ledger.md`:
- Platform, date, post URL or thread link
- Upvotes / comments / traffic spike visible in analytics if available
- Any questions that reveal missing path coverage or common confusion (e.g., "does it check `/api/.env`?", "does it detect AWS secrets?")
- Paths or check types that came up repeatedly that should be added to the probe list
- Anything worth feeding back into the tool or guides
