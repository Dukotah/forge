# ShipSafe — Launch Kit

> **For the owner to post.** One-paste-ready copy for every channel below.
> Automated posting is against platform ToS — you fire these from your own accounts.
> No fabricated metrics, users, or testimonials — these are honest.
> Log what you posted and any results in `ops-log/metrics-ledger.md`.

**Tool URL:** https://labs.copperbaytech.com/shipsafe/  
**Guides:**
- https://labs.copperbaytech.com/shipsafe/guides/wcag-compliance-ai-generated-sites.html  
- https://labs.copperbaytech.com/shipsafe/guides/wcag-2-1-vs-2-2-what-changed.html  
- https://labs.copperbaytech.com/shipsafe/guides/ada-compliance-checklist.html  
**Audience:** founders and developers using AI builders (Lovable, Bolt, v0, Cursor) or no-code tools (Webflow, Framer, Squarespace, WordPress), web developers checking client sites before launch, business owners who've heard about ADA demand letters and want to know if they're exposed.  
**Core promise:** Paste a URL and get a plain-English report on the ADA/WCAG accessibility and privacy gaps that trigger demand letters — graded A–F with specific fixes. Free, in-browser, no signup.

---

## Posting order (highest leverage first)

1. **Product Hunt** — biggest discoverability window; Tuesday/Wednesday 12:01 AM PT
2. **r/nocode or r/lovabledev** — tightest product-audience fit; post within a few days of PH while momentum is live
3. **Show HN** — strong fit for the technical framing of "what serial filers actually scan for"; weekdays 9–11 AM ET; stay in the thread the first two hours
4. **r/SideProject** — welcoming to launches; 1–2 days after PH to reach a different slice
5. **r/smallbusiness** — non-developer audience; highest volume; post any weekday; leads with the lawsuit angle, not the tool
6. **r/webdev** — Showoff Saturday version or drop the answer-where-asked one-liner in "best practices before launch" threads
7. **r/indiehackers** — founder narrative; works any day

---

## 1. Product Hunt

**Tagline:**
> Demand-letter risk check for your website — free ADA + privacy scan, A–F grade, instant fixes

**Description:**
> ShipSafe is a free, browser-based ADA and privacy risk scanner. Paste any URL and you get a plain-English report showing the exact gaps that trigger demand letters — with an A–F grade, a high/medium/low risk rating, and specific fixes for each issue.
>
> **Why this exists:** More than 4,600 ADA website lawsuits were filed in 2024. Serial filers use automated scanners to find the same issues at scale — missing alt text, unlabeled form fields, no page language attribute, no privacy policy. Most site owners don't know these issues exist until they get a letter. ShipSafe surfaces them first.
>
> **What it checks (four categories):**
>
> **Accessibility (ADA / WCAG)** — the items that appear in demand letters: page language declared, images have alt text, form fields have associated labels, links and buttons have readable names, page has a title, heading structure, mobile viewport, main landmark. These eight checks are weighted highest because they're the most frequently cited.
>
> **Privacy & legal** — issues often bundled into the same complaints: privacy policy linked in the page, cookie consent mechanism if tracking scripts are present, Terms of Service link, contact path, and accessibility statement (shown to reduce demand-letter risk when it's present).
>
> **Schema & SEO** — JSON-LD structured data, meta description, Open Graph tags, canonical URL. Flagged separately from the legal checks because they affect visibility, not compliance.
>
> **Trust signals** — HTTPS, favicon, mixed content. Basics that make a site look legitimate to users and auditors.
>
> **Output:** An A–F letter grade, a health score out of 100, a demand-letter risk rating, per-category scores, and a fix suggestion for every failing item (with WCAG criterion references where applicable). If you have issues, there's a one-click pre-filled email CTA to get a fix quote from Copper Bay Tech — your specific findings are already in the body.
>
> **What it can't do (honest):** ShipSafe reads your page's HTML source. It cannot check color contrast (requires visual rendering), keyboard navigation (requires interaction testing), screen reader output, or JavaScript-rendered content. The scan gives you signal on the most-cited static issues; a thorough WCAG audit requires more.
>
> Three in-depth guides cover the most common scenarios: WCAG compliance gaps in AI-generated sites (Lovable, Bolt, v0, Cursor), the specific changes from WCAG 2.1 to 2.2 (if you've previously passed a 2.1 audit), and a 30-item ADA compliance checklist organized by POUR principle with test methods on every item.
>
> Runs 100% in your browser. Nothing is stored. No signup. Free.
>
> Built by Copper Bay Labs.

**Topics to select on PH:** Developer Tools, Legal Tech, Productivity, No-Code & Low-Code

**First comment (post this immediately after it goes live):**
> Happy to answer questions. A few that come up:
>
> **Is this legal advice?** No — and the tool says so plainly on every result. ShipSafe gives you a heuristic signal about what's checkable in your page source. Whether those issues constitute a legal violation depends on your site, how you use it, and your jurisdiction. For a binding determination, talk to a qualified attorney. The tool's value is surfacing the gaps before a filer does.
>
> **If I pass ShipSafe, am I ADA compliant?** No. Passing ShipSafe means you cleared the specific HTML-source checks the tool runs — which are the most commonly cited issues in automated ADA complaints. A full WCAG 2.1 AA audit also requires manual testing: keyboard-only navigation, color contrast (which requires rendering), screen reader output, and more. The three guides cover what's beyond the scan.
>
> **Why focus on AI-generated sites?** Lovable, Bolt, v0, and Cursor produce well-styled output that frequently ships without a `lang` attribute on the HTML tag, with unlabeled inputs, and with images missing `alt` text. These aren't edge cases — they're defaults. The tools are optimized for speed and appearance; accessibility attributes require intent. ShipSafe closes that gap.
>
> **What's the difference between "demand-letter risk" and the letter grade?** The letter grade is a weighted average across all four categories (A–F). Demand-letter risk is a separate signal that only counts the legal-category failures — accessibility and privacy — since those are what complaints actually cite. A site can have a B grade overall but still be high risk if it has multiple accessibility failures; a site with no JavaScript, no tracking, and good alt text might score an A with no compliance gaps even if its meta description is missing.

---

## 2. r/nocode (and r/lovabledev, r/webflow, r/framer)

> Rule check for r/nocode: The subreddit allows tool showcases, especially ones built for the no-code community. Lead with value, not promotion. For r/lovabledev and r/webflow: check current pinned rules — self-promo threads may be pinned or required; post there rather than a standalone thread.

**Standalone post for r/nocode:**

**Title:** I built a free ADA/WCAG risk scanner specifically for Lovable, Bolt, Webflow, Framer sites — paste a URL, get the exact gaps that trigger demand letters

**Body:**
> If you're shipping sites with Lovable, Bolt, v0, Webflow, or Framer, there's a real and underappreciated gap: these tools produce great-looking sites that frequently ship with the specific issues automated ADA filers look for — missing alt text, no `lang` attribute on the HTML tag, unlabeled form inputs, no privacy policy link.
>
> More than 4,600 ADA website lawsuits were filed in 2024. Most of them start with an automated scan that finds these exact issues.
>
> I built ShipSafe to catch these before a letter does. Paste any URL → get a plain-English A–F report with per-issue fixes. Runs in your browser, nothing stored, free, no signup.
>
> https://labs.copperbaytech.com/shipsafe/
>
> There's also a guide on the five most common WCAG gaps in AI-generated sites specifically, with fixes for each platform: https://labs.copperbaytech.com/shipsafe/guides/wcag-compliance-ai-generated-sites.html
>
> Happy to answer questions about what it checks (and what it can't — it reads HTML source, so color contrast and keyboard navigation require manual testing beyond the scan).

---

## 3. Show HN

> Rule check: Show HN is for things you built. Weekdays 9–11 AM ET for best visibility.
> Stay in the thread for the first 2 hours to respond. HN rewards technical honesty — lead with the interesting implementation detail and the genuine scope limitation, not the marketing pitch.

**Title:**
> Show HN: ShipSafe – ADA/WCAG demand-letter risk scanner that runs in your browser

**Body:**
> Built this because I kept seeing the same pattern: a site built on Lovable or Webflow ships without a `lang` attribute, with unlabeled form fields, images with no `alt` text. These are the exact things automated ADA demand-letter campaigns scan for. The site looks fine, the builder didn't know, and the first signal is a letter.
>
> ShipSafe is a browser-based ADA and privacy risk scanner. Paste a URL, the page is fetched via a CORS proxy chain, and the source HTML is analyzed in the tab — nothing leaves the browser beyond the initial fetch. Output: A–F grade, demand-letter risk (high/medium/low), per-category scores, per-issue fix suggestions with WCAG criterion references.
>
> What it checks in the source HTML:
> - Accessibility (highest weight): `lang` attribute, `alt` on all images, form field labels (label-for, aria-label, aria-labelledby), accessible names on links and buttons, page title, heading structure, mobile viewport meta, `<main>` landmark
> - Privacy: privacy policy link, cookie consent if tracking scripts are detected, ToS link, contact path, accessibility statement
> - Schema/SEO: JSON-LD validity, meta description, Open Graph, canonical
> - Trust: HTTPS, favicon, mixed content
>
> The honest limitation: static HTML analysis misses color contrast (needs rendering), keyboard navigation (needs interaction), screen reader behavior (needs AT), and any content injected by JavaScript after load. I'm explicit about this in the UI and in the methodology page. The scan covers the most-cited static issues and is a fast first pass, not a replacement for a full audit.
>
> The scoring: each check returns pass/warn/fail/info. The per-category score is the pass rate on checked items. The letter grade is a weighted average across categories. Demand-letter risk is a separate count of legal-category (accessibility + privacy) failures — a site can B overall but be high risk if it has multiple accessibility failures.
>
> Three guides cover the common follow-up questions: WCAG compliance in AI-generated sites, what changed in WCAG 2.1→2.2, and a 30-item ADA checklist by POUR principle with test methods on every item.
>
> The tool: https://labs.copperbaytech.com/shipsafe/

**First comment (post this right after the thread opens, before others respond):**
> A few things I'd do differently or am still working through:
>
> **CORS proxy reliability.** The fetch goes through a fallback chain of three public CORS proxies. On a site that either blocks bots or renders primarily via JavaScript, the HTML source is nearly empty and the tool says so explicitly. The right fix is an optional headless-render mode (for color contrast and JS-rendered content) — that needs a server component, which I've avoided so far to keep this 100% client-side. It's the main gap.
>
> **The letter grade might oversimplify.** An A–F grade is legible but it collapses a lot of dimension. A site can be technically accessible (high accessibility score) while still having serious privacy issues, or vice versa. I show per-category scores alongside the grade, but I could see an argument that the headline grade does more harm than good — that a B grade feels "fine" when the specific failing items are the ones that actually matter.
>
> **What "demand-letter risk" actually means.** I'm calling it demand-letter risk, not compliance. The distinction matters: a site can be technically WCAG non-compliant but never receive a letter; a site can pass this scan but still fail a manual audit. What I'm really measuring is "how many of the specific items that appear in automated ADA complaint letters are present." That's useful but limited, and I try to be clear about it.
>
> Happy to go deep on any of the above.

---

## 4. r/SideProject

> Rule check: r/SideProject allows self-promotion on project showcase posts. Use "I made this" framing, keep it honest, be ready to answer questions.

**Title:** I built a free ADA/WCAG demand-letter risk scanner — paste a URL, get plain-English accessibility and privacy gaps, A–F grade

**Body:**
> ShipSafe: https://labs.copperbaytech.com/shipsafe/
>
> **What it does:** Paste a website URL → get a plain-English report on the accessibility and privacy issues that trigger ADA demand letters. A–F letter grade, high/medium/low demand-letter risk rating, per-issue fixes with WCAG references. Runs in your browser, nothing stored, free.
>
> **Why I built it:** More than 4,600 ADA website lawsuits were filed in 2024. The majority start with an automated scan. The gaps they scan for — no page language attribute, missing alt text, unlabeled form fields, no privacy policy — are exactly what AI site builders and no-code tools ship by default. ShipSafe catches these before a filer does.
>
> **What it checks:** accessibility (WCAG 2.1 AA items checkable in static HTML), privacy (policy, cookie consent, ToS, contact), schema/SEO, trust signals.
>
> **Honest limitation:** Static HTML analysis only — can't check color contrast (needs visual rendering), keyboard nav, screen reader behavior, or JS-injected content.
>
> Three guides: WCAG gaps in AI-generated sites, WCAG 2.1 vs 2.2 changes, and a 30-item ADA checklist by POUR principle (each item has a test method and a fix note).
>
> Would love feedback, especially on what the scan misses or whether the A–F framing is misleading.

---

## 5. r/smallbusiness

> Rule check: r/smallbusiness (4.6M members) allows helpful tool posts but is strict about self-promotion. Frame this as genuinely useful information about a real risk, not a product pitch. Lead with the legal context, introduce the tool as the practical solution. Don't spam; post once and engage in comments.

**Title:** Free tool to check if your website has the accessibility gaps that trigger ADA demand letters (4,600+ filed in 2024)

**Body:**
> This came up in a client conversation and I figured it's worth sharing more broadly.
>
> Over 4,600 ADA website lawsuits were filed in 2024. A significant portion use automated scanners to find sites with specific, fixable issues — missing alt text on images, form fields without labels, no page language attribute, no privacy policy. Many small business owners don't know these are required and don't find out until they get a letter.
>
> I built a free browser-based tool that checks for these: https://labs.copperbaytech.com/shipsafe/
>
> Paste your URL → get a plain-English report with a risk rating (high/medium/low demand-letter risk), a grade, and specific fix instructions for each issue. No signup, nothing stored, free.
>
> It won't tell you whether you're legally compliant — only an attorney can do that — but it will tell you if you have the most commonly cited issues.
>
> There's also a guide on common fixes if you want to DIY: https://labs.copperbaytech.com/shipsafe/guides/wcag-compliance-ai-generated-sites.html
>
> Happy to answer questions about what it checks.

---

## 6. r/webdev

> Rule check: r/webdev allows Showoff Saturday posts (every Saturday) for personal projects. Keep it concise. The answer-where-asked one-liner is for organic thread participation in "what do you check before launch" or "accessibility tools" discussions — do not post it as a standalone thread.

**Showoff Saturday post:**

**Title:** ShipSafe — browser-based ADA/WCAG risk scanner. Paste a URL, get demand-letter risk rating + WCAG-referenced fixes

**Body:**
> https://labs.copperbaytech.com/shipsafe/
>
> Checks accessibility (alt text, labels, lang attribute, heading structure, etc.), privacy (policy link, cookie consent if tracking scripts present, contact path), schema, and trust signals. Outputs an A–F grade, demand-letter risk level, per-category scores, and a fix suggestion with the WCAG criterion for each failing item. Runs in your browser, 100% client-side.
>
> Works on any live page but especially useful for AI-generated sites and no-code builders that don't enforce these by default.
>
> Three guides: WCAG in AI-generated sites, WCAG 2.1 vs 2.2 changes, 30-item ADA checklist with test methods per item.
>
> Built for the "before I launch this client site" moment — happy to hear what it's missing.

**One-liner for answer-where-asked threads** (in discussions about "pre-launch checklist", "accessibility tools", "ADA compliance", "what do you check before shipping"):
> ShipSafe (https://labs.copperbaytech.com/shipsafe/) is a free browser-based ADA/WCAG risk scanner — paste a URL, get a plain-English report with demand-letter risk rating and WCAG-referenced fixes for whatever it finds.

---

## 7. r/indiehackers

> Rule check: r/indiehackers allows founder stories and product showcases. The audience responds to honest narrative about why you built something, what you learned, and what you'd do differently.

**Title:** I built a free ADA risk scanner after watching AI-generated sites ship with the exact gaps demand-letter campaigns look for

**Body:**
> ShipSafe: https://labs.copperbaytech.com/shipsafe/
>
> **The problem it solves:** 4,600+ ADA website lawsuits were filed in 2024. A large portion are automated: someone runs a scanner that finds sites with missing alt text, no page language attribute, unlabeled form inputs, no privacy policy link — and sends demand letters at scale. Most site owners have no idea these issues are required. The only time they find out is when they get the letter.
>
> The situation got sharper with AI builders. Lovable, Bolt, v0, Cursor — these tools ship great-looking sites that almost routinely omit the `lang` attribute, skip alt text on decorative images, and use placeholder text instead of actual form labels. The builders are optimized for speed and appearance; accessibility attributes require someone to think about them.
>
> **What I built:** A browser-based scanner you can paste a URL into. It fetches the page, runs about 20 checks in the browser tab, and outputs a plain-English report with an A–F grade, a demand-letter risk rating (high/medium/low), and specific fix instructions with WCAG criterion references. Nothing stored, no signup, free.
>
> **The framing I went back and forth on:** I initially called it an "accessibility checker" and it felt boring. Reframing around "demand-letter risk" was both more honest (that's the specific thing it's measuring) and more specific (the audience who knows about ADA lawsuits searches very differently from the audience who wants to improve accessibility in the abstract). Same tool, different resonance.
>
> **What I'd change:** The CORS proxy dependency for fetching pages is the biggest technical limitation. Public proxies are unreliable, some block JavaScript-heavy pages, some strip headers. The right solution is an optional server-side render path — but I've kept this 100% client-side for now. That trade-off is real: sites built with React, Next.js, or other JS-heavy frameworks often scan as nearly empty.
>
> Three guides: WCAG compliance for AI-generated sites specifically, WCAG 2.1 → 2.2 changes, and a 30-item ADA checklist by POUR principle with a test method on every item.
>
> Happy to answer questions about the demand-letter landscape, the technical stack, or what the scan misses.

---

## Additional channels

### r/legaladvice / r/LegalAdviceOffTopicPosts (answer-where-asked only)
Do not post the tool as a standalone thread in legal subreddits. When threads appear asking "how do I know if my website is ADA compliant?" or "I got a demand letter about my website", a brief, honest reply can be appropriate:

> Not legal advice, but there's a free tool that checks for the most commonly cited technical gaps: https://labs.copperbaytech.com/shipsafe/ — it reads your page's HTML and flags the issues (missing alt text, unlabeled forms, no lang attribute, etc.) most often cited in demand letters. It gives you signal on what to look at; whether those issues constitute a violation and how to respond to the letter needs an attorney.

### AlternativeTo / SaaSHub
List ShipSafe as a free alternative to:
- WAVE Web Accessibility Evaluation Tool
- Deque axe DevTools
- Siteimprove
- UserWay Website Accessibility Checker

Tags/categories: accessibility, ADA compliance, WCAG, website audit, no-code tools

### r/Entrepreneur (answer-where-asked only)
When threads ask about ADA website compliance, website lawsuit risk, or "do I need to make my website accessible":

> Worth running https://labs.copperbaytech.com/shipsafe/ — free, paste your URL, it checks for the specific items most often cited in ADA demand letters (alt text, form labels, page language, privacy policy) and gives you a plain-English report with fixes. Not legal advice, but it tells you if you have the issues that make sites easy targets.

---

## Timing notes

- **Product Hunt:** Tuesday or Wednesday, 12:01 AM PT. Don't post on a day with a major tech launch already on the front page.
- **Show HN:** Weekday morning, 9–11 AM ET. Stay in the thread for the first 2 hours.
- **r/nocode:** Any weekday; check whether r/lovabledev has a showcase thread pinned (post there if so).
- **r/SideProject:** 1–2 days after PH.
- **r/smallbusiness:** Any weekday, morning is fine. Moderate your thread.
- **r/webdev Showoff Saturday:** Any Saturday.
- **r/indiehackers:** After PH/HN, once you have some feedback to reference.

---

## What to log in metrics-ledger.md after posting

Once any of the above runs, add a row to `ops-log/metrics-ledger.md`:
- PH upvotes at 24h / 48h
- HN points and comments at 6h
- Subreddit post karma
- Any inbound emails with subject starting "Fix quote" (the lead signal)
- Any Search Console impressions bump in the week following

The lead-capture CTA on the scan result ("Get a free fix quote →") pre-fills an email to contact@copperbaytech.com with the specific issues found. That email is the money signal — even one lead proves the funnel converts.
