# HardenCheck — Launch Kit

> **For the owner to post.** One-paste-ready copy for every channel below.
> Automated posting is against platform ToS — you fire these from your own accounts.
> No fabricated metrics, users, or testimonials — these are honest.
> Log what you posted and any results in `ops-log/metrics-ledger.md`.

**Tool URL:** https://labs.copperbaytech.com/hardencheck/  
**Guides:**
- https://labs.copperbaytech.com/hardencheck/guides/add-content-security-policy-header.html  
- https://labs.copperbaytech.com/hardencheck/guides/enable-hsts-header.html  
- https://labs.copperbaytech.com/hardencheck/guides/x-frame-options-vs-csp-frame-ancestors.html  
- https://labs.copperbaytech.com/hardencheck/guides/x-content-type-options-nosniff.html  
**Audience:** web developers, indie hackers, DevOps engineers, anyone deploying a site who wants to know if their security headers are set correctly.  
**Core promise:** Grade your HTTP security headers and cookie flags in 30 seconds — paste `curl -I` output and get an A–F report card with exact copy-paste fixes for your platform.

---

## Posting order (highest leverage first)

1. **Product Hunt** — biggest discoverability moment; Tuesday/Wednesday 12:01 AM PT
2. **Show HN** — strong fit for the technical audience; 9–11 AM ET on a weekday; paste mode and cookie grading are the technically interesting angles
3. **r/SideProject** — welcoming to launches; post a day or two after PH to hit a different audience
4. **r/webdev** — valid any Showoff Saturday; or drop the answer-where-asked one-liner in threads about security headers, CSP, or "checklist before I launch"
5. **r/indiehackers** — founder narrative; works any day

---

## 1. Product Hunt

**Tagline:**
> Grade your HTTP security headers — A–F report card, cookie flags, copy-paste fixes

**Description:**
> HardenCheck reads your site's HTTP response headers and cookie flags and grades them into an A–F report card — with plain-English explanations of what each header stops and exact fix snippets for your platform.
>
> **The problem it solves:** Most sites ship without security headers. Not because developers don't care, but because there's no feedback loop — you deploy, nothing breaks, and missing headers don't announce themselves until a penetration test, a security scanner report, or an incident.
>
> **What HardenCheck checks:**
> - **Content-Security-Policy** — the most commonly missing header; grades missing policies and unsafe-inline separately, since unsafe-inline eliminates most of CSP's XSS protection
> - **Strict-Transport-Security (HSTS)** — checks max-age and whether includeSubDomains is set
> - **X-Frame-Options / CSP frame-ancestors** — clickjacking protection; reads both headers and explains precedence (modern browsers prefer frame-ancestors; IE needs XFO as a fallback)
> - **X-Content-Type-Options** — checks for nosniff; explains what MIME sniffing attacks actually look like
> - **Referrer-Policy and Permissions-Policy** — what you leak in the Referer header and which browser features (camera, mic, geolocation) you're exposing unnecessarily
> - **Cross-origin isolation** — COOP/CORP headers that mitigate Spectre-class cross-origin leaks
> - **Every Set-Cookie header** — checks Secure, HttpOnly, and SameSite on each one; a session cookie missing HttpOnly is a trivial escalation from XSS to session takeover
> - **Info disclosure** — Server and X-Powered-By headers that advertise your stack to attackers for no benefit
>
> **Two input modes:**
> URL mode fetches headers via a public CORS proxy. Paste mode takes raw output from `curl -I your-site.com` or your browser's DevTools response panel and grades it entirely offline — nothing leaves the browser. Paste mode is more accurate because CORS proxies sometimes strip or rewrite the exact headers being graded (CSP especially).
>
> **Platform-specific copy-paste fixes:** nginx, Apache (.htaccess), Vercel (vercel.json), Next.js (next.config.js), Netlify (_headers), Cloudflare Pages (_headers).
>
> Four in-depth guides cover the most critical headers: CSP with safe nonces/hashes, HSTS with preload considerations, X-Frame-Options vs frame-ancestors (when to set both, why ALLOW-FROM is dead), and X-Content-Type-Options nosniff (what MIME sniffing actually enables an attacker to do).
>
> Runs 100% in your browser. Nothing is stored. No signup. Free.
>
> Built by Copper Bay Labs.

**Topics to select on PH:** Developer Tools, Security, Web Development, Open Source

**First comment (post this immediately after it goes live):**
> Happy to answer questions. A few that tend to come up:
>
> **How is this different from securityheaders.com?** securityheaders.com is good and I'd encourage people to use it. The main things HardenCheck adds: (1) paste mode — you can grade headers from `curl -I` output entirely offline, with no network call, which is useful if your staging environment isn't public or if you've seen CORS proxies produce misleading results; (2) cookie flag grading — HardenCheck parses every Set-Cookie header for Secure, HttpOnly, and SameSite, since a session cookie without HttpOnly is often more immediately exploitable than a missing response header; (3) Cloudflare Pages and Next.js fix snippets, which aren't covered everywhere.
>
> **Does an A grade mean my site is secure?** No, and the tool says so plainly. Security headers are an important and often-ignored layer, but a narrow one. An A means your headers and cookie flags are well-configured; it says nothing about your authentication, dependencies, input validation, or access controls. HardenCheck is a fast hardening check, not a security audit.
>
> **Is paste mode actually private?** Yes. In paste mode, there's no network call — you're running JS in the browser tab that parses the text you pasted. I'd verify this in DevTools network tab if you're skeptical. In URL mode, a public CORS proxy sees the URL you enter; that's disclosed in the UI.
>
> **Can it check sites that require auth?** Paste mode can. Run `curl -I -H "Cookie: session=..." https://your-app.com/dashboard` locally, paste the response headers, and grade whatever you get back — including any headers your authenticated endpoints set differently.

---

## 2. Show HN

> Rule check: Show HN is for things you built. Weekdays 9–11 AM ET for best visibility.
> Stay in the thread for the first 2 hours to respond. HN rewards technical honesty — lead with the interesting implementation detail, not the marketing pitch.

**Title:**
> Show HN: HardenCheck – grade HTTP security headers by pasting curl -I output

**Body:**
> Built to solve a problem I kept running into: grading a site's security headers in the browser is harder than it should be because of CORS.
>
> Browsers block reading another origin's response headers directly, so URL-based header scanners need a CORS proxy. The problem is CORS proxies frequently strip or rewrite the exact headers you're trying to grade — CSP especially, since it's a large header that some proxies drop to avoid their own policy issues. You get a grade saying "no CSP" on a site that has one.
>
> HardenCheck has two modes: URL mode (CORS proxy, with honest disclosure that it can produce misleading results) and paste mode (you run `curl -I your-site.com` locally and paste the raw response; the tab grades it entirely offline, no network call, guaranteed accurate). The UI prompts you to switch to paste mode when the URL result looks suspicious.
>
> What it grades:
> - CSP (presence, unsafe-inline, unsafe-eval)
> - HSTS (max-age, includeSubDomains)
> - X-Frame-Options and CSP frame-ancestors (with a precedence table — modern browsers prefer frame-ancestors; IE needs XFO as a fallback)
> - X-Content-Type-Options (nosniff)
> - Referrer-Policy, Permissions-Policy
> - COOP/CORP cross-origin isolation headers
> - Every Set-Cookie header: Secure, HttpOnly, SameSite per-cookie
> - Info disclosure: Server and X-Powered-By
>
> Output is an A–F report card with a finding per issue, severity label, plain-English explanation of what the missing header enables an attacker to do, and copy-paste fix for nginx, Apache, Vercel, Next.js, Netlify, and Cloudflare Pages.
>
> Four in-depth guides sit alongside the tool covering CSP (with report-only mode for testing), HSTS (preload gotchas), XFO vs frame-ancestors, and nosniff/MIME sniffing.
>
> https://labs.copperbaytech.com/hardencheck/
>
> Runs on GitHub Pages. Vanilla JS.

**First comment (post immediately after it goes live):**
> Two implementation decisions I'd be curious whether people find reasonable:
>
> **Cookie flag grading per-cookie rather than per-site:** Most security header scanners check response headers but don't parse individual Set-Cookie values. HardenCheck checks every Set-Cookie in the response for Secure, HttpOnly, and SameSite, because a session cookie missing HttpOnly is a direct escalation from XSS to session takeover — it's concretely more exploitable than most missing response headers. Not sure if this is the right level of granularity or whether it creates noise when sites have a mix of sensitive and non-sensitive cookies.
>
> **A–F grade instead of a checklist score:** The grade collapses a multi-dimension score (severity-weighted across all findings) into a single letter. The tradeoff: a site with one critical missing CSP and everything else correct gets a lower grade than a site with four minor issues but no critical gaps. I went with this because the single letter is immediately shareable ("my site got a D") in a way a multi-factor score isn't, but it oversimplifies. Thoughts on whether this framing is misleading welcome.
>
> For the CORS proxy disclosure: I'm using a public CORS proxy for URL mode and I considered not offering URL mode at all (paste-only, since it's more accurate). Decided against it because many people won't know how to run curl — but the proxy limitation means URL results can be wrong in a security grader, which is a meaningful failure mode. The current approach is: warn in the UI, recommend paste mode, fall back gracefully.

---

## 3. r/SideProject

> Rule check: r/SideProject explicitly welcomes "I built this" posts. Self-posts and links are fine.
> Best on weekdays (Tue–Thu) between 9–11 AM ET.
> Don't post the same day as your PH launch — wait a day so it hits a different audience.

**Title:**
> I built a free security header grader — paste curl -I output, get an A–F report card with copy-paste fixes

**Body:**
> Hey r/SideProject — sharing something I built: **HardenCheck**
>
> https://labs.copperbaytech.com/hardencheck/
>
> It grades your site's HTTP security headers and cookie flags into an A–F report card and gives you exact copy-paste fixes for nginx, Apache, Vercel, Next.js, Netlify, and Cloudflare Pages.
>
> Two input modes:
>
> - **URL mode** — enter your site and it fetches the headers through a CORS proxy
> - **Paste mode** — run `curl -I https://your-site.com` in a terminal and paste the raw output; grades it entirely offline with no network call, which is more accurate because CORS proxies sometimes strip or mangle headers
>
> What it checks: CSP (missing or weak), HSTS, X-Frame-Options / frame-ancestors, X-Content-Type-Options (nosniff), Referrer-Policy, Permissions-Policy, COOP/CORP isolation, and every Set-Cookie header for Secure / HttpOnly / SameSite flags. Also flags Server and X-Powered-By info disclosure headers.
>
> Four in-depth guides sit alongside it: one on writing a real CSP without breaking your site (using report-only mode first), one on HSTS and the preload list, one on X-Frame-Options vs CSP frame-ancestors (and why ALLOW-FROM is dead in all major browsers), and one on nosniff and what MIME sniffing attacks actually look like.
>
> Runs 100% in the browser. Nothing stored, no signup.
>
> Happy to hear what other checks you think are missing from the list.

---

## 4. r/webdev

> Rule check: r/webdev allows tool sharing on Showoff Saturday (weekly thread). Link posts outside the thread may be removed.
> The one-liner below is for dropping into existing threads where someone asks about security headers, pre-launch checklists, or "is my site secure."

**Showoff Saturday post (use in the weekly sticky thread):**
> Just shipped HardenCheck — paste `curl -I your-site.com` output and get an A–F security header grade with platform-specific fix snippets for nginx, Apache, Vercel, Next.js, Netlify, and Cloudflare Pages.
>
> Checks CSP (missing + unsafe-inline), HSTS, XFO / frame-ancestors, nosniff, Referrer-Policy, Permissions-Policy, COOP/CORP, and every Set-Cookie for Secure/HttpOnly/SameSite. Also catches Server and X-Powered-By info disclosure.
>
> Paste mode works offline from `curl -I` output — more accurate than URL mode since CORS proxies can strip headers. No signup, runs in browser.
>
> https://labs.copperbaytech.com/hardencheck/

**Answer-where-asked one-liner** (for threads about "how to check security headers", "pre-launch security checklist", "how to add CSP to Vercel", etc.):
> There's a free tool called HardenCheck (https://labs.copperbaytech.com/hardencheck/) that grades them with an A–F score and gives you platform-specific fix snippets. Paste mode takes `curl -I` output and runs entirely offline so you get an accurate grade even on a non-public staging URL.

---

## 5. r/indiehackers

> Rule check: r/indiehackers (and indiehackers.com itself) welcome build stories and tool launches.
> The founder-narrative frame works well here. Community is supportive of honest "here's what I built and why" posts.
> Don't over-optimize for upvotes — IH readers respond to honest technical reflection.

**Title:**
> Built a security header scanner as part of a ship-safety tool suite — here's the main gap I kept seeing in indie apps

**Body:**
> I've been building a suite of free, browser-only tools under Copper Bay Labs targeting the "pre-launch checklist" problem for indie developers — the checks you know you should run before going live but rarely do because they require pulling up docs, running commands, or paying for a scanner. This is about HardenCheck, the security header grader:
>
> https://labs.copperbaytech.com/hardencheck/
>
> **The consistent gap:** Indie apps and quickly-deployed sites almost universally ship with no Content-Security-Policy, HSTS that either doesn't exist or expires after a day, and session cookies missing HttpOnly and SameSite. These aren't hard to add — nginx has a four-line block that covers all of them — but there's no feedback mechanism. Nothing breaks when they're missing. You only find out during a pentest (expensive) or after an incident (worse).
>
> HardenCheck grades your response headers and cookie flags A–F with plain-English explanations ("this missing header means an attacker who finds an XSS can load scripts from their own domain") and exact copy-paste fixes for nginx, Apache, Vercel, Next.js, Netlify, and Cloudflare Pages.
>
> **The thing I'd rethink:** The CORS proxy problem. Browsers can't read another origin's response headers directly, so URL mode needs a proxy — but CORS proxies frequently strip or rewrite the exact headers being graded. I warn about this in the UI and offer paste mode as an alternative (paste raw `curl -I` output, grades offline, always accurate). But adding a curl step loses people who don't know the command. The honest answer is a browser extension would solve this better, but that's out of scope.
>
> **The cookie grading angle:** Most header scanners check response headers but skip cookie flags. HardenCheck parses every Set-Cookie and checks Secure, HttpOnly, and SameSite per cookie. I added this because a missing HttpOnly flag is a direct escalation path from an XSS vulnerability to session takeover — it's more concretely exploitable than most missing response headers — and it's consistently overlooked.
>
> Four in-depth guides sit alongside the tool covering the top four headers that HardenCheck flags most often: CSP (with report-only mode for safe testing), HSTS (with preload list considerations), X-Frame-Options vs CSP frame-ancestors (including why ALLOW-FROM is dead in all major browsers), and X-Content-Type-Options nosniff.
>
> Free, runs in browser, no signup.
>
> Happy to answer questions about the implementation or the checks.

---

## Additional channels

### AlternativeTo / SaaSHub
- **AlternativeTo listing:** Submit as free alternative to SecurityHeaders.com, Mozilla Observatory, and Qualys SSL Labs (for the header-checking overlap)
- **Tags for SaaSHub:** security, http-headers, content-security-policy, hsts, developer-tools, web-security, free
- **AlternativeTo categories:** Internet & Network, Security

### Answer-where-asked threads (organic, not promotional)

Good threads to drop a mention in when you're genuinely answering a question:

- r/webdev, r/devops: "what security headers should I set on my Nginx config?"
- r/sysadmin: "quick way to test if a site has proper security headers without signing up for a service"
- r/nextjs, r/vercel: "how do I add a Content-Security-Policy to my Next.js app?"
- Stack Overflow: questions about missing security headers, CSP configuration, HSTS setup — the guides at https://labs.copperbaytech.com/hardencheck/guides/ are the right content to reference, not just the tool link
- GitHub discussions in security-focused repos: if someone asks "how do I verify my headers are correct," paste mode is a useful suggestion

**The one-line answer-where-asked text:**
> HardenCheck (https://labs.copperbaytech.com/hardencheck/) can grade that — paste your `curl -I` output in paste mode for an offline grade with fix snippets for most platforms.

### r/netsec note
r/netsec rules require substantial write-ups or published research — a direct tool link post will be removed. The four HardenCheck guides are appropriate to share in relevant threads as "I wrote up how [nosniff / XFO vs frame-ancestors / HSTS preload] actually works." Link to the guide, not the tool homepage, and only where the topic is genuinely relevant to the discussion.

---

## Timing notes

- **Product Hunt:** Tuesday or Wednesday, 12:01 AM PT. Stay available for 2–3 hours after launch to respond to questions. The first comment (posted immediately after) should set up the FAQ so comments don't fill with the same three questions.
- **Show HN:** 1–2 days after PH, weekday morning ET. Write a substantive first comment with the implementation details — HN rewards transparency about the interesting engineering choices and honest limitations.
- **r/SideProject:** Same week, different day from Show HN.
- **r/webdev Showoff Saturday:** Any Saturday.
- **r/indiehackers:** After PH and HN, when you have some data or feedback to reference.

---

## What to log

After each post, record in `forge/ops-log/metrics-ledger.md`:
- Platform, date, post URL or thread link
- Upvotes / comments / traffic spike visible in analytics if available
- Any questions asked that reveal missing features or common confusion
- Anything worth feeding back into the tool or guides
