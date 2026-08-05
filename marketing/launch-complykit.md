# ComplyKit — Launch Kit

> **For the owner to post.** One-paste-ready copy for every channel below.
> Automated posting is against platform ToS — you fire these from your own accounts.
> No fabricated metrics, users, or testimonials — these are honest.
> Log what you posted and any results in `ops-log/metrics-ledger.md`.

**Tool URL:** https://labs.copperbaytech.com/complykit/  
**Guides:**
- https://labs.copperbaytech.com/complykit/guides/do-i-need-a-privacy-policy.html  
- https://labs.copperbaytech.com/complykit/guides/what-should-a-privacy-policy-include.html  
- https://labs.copperbaytech.com/complykit/guides/cookie-consent-banner-requirements.html  
**Audience:** indie hackers, vibe-coders, freelancers, solopreneurs, and small-business owners who launched (or are about to launch) a site or app without legal pages — and know they need them but don't want to pay $20/month for a generator.  
**Core promise:** Answer a short questionnaire and get a GDPR- and CCPA-aware privacy policy, terms of service, and a working cookie-consent banner — all three, free, generated entirely in your browser with no signup and nothing uploaded.

---

## Posting order (highest leverage first)

1. **Product Hunt** — biggest discoverability window; this is a non-technical-leaning tool that gets the warm PH reception well; Tuesday/Wednesday 12:01 AM PT
2. **r/SideProject** — very welcoming to launches and full of indie hackers who skipped legal pages; 1–2 days after PH
3. **r/smallbusiness** — largest audience for the "do I need a privacy policy?" question; leads with legal risk context, not the tool
4. **r/indiehackers** — founder narrative around the "launched without legal pages" moment; works any day after PH
5. **r/webdev / r/nocode** — answer-where-asked in pre-launch checklist threads
6. **r/legaladvice / r/LegalAdviceOffTopicPosts** — answer-where-asked on "do I need a privacy policy for my app?" questions
7. **r/Entrepreneur** — answer-where-asked on startup compliance questions

---

## 1. Product Hunt

**Tagline:**
> Privacy policy, terms & cookie banner in one free generator — GDPR + CCPA aware, no signup

**Description:**
> ComplyKit is a free, browser-based generator for the three legal pages every website needs: a privacy policy, terms of service, and a working cookie-consent banner.
>
> **Why this exists:** Most indie projects and AI-built apps launch without legal pages. It's not that founders don't care — it's that the good generators want a monthly subscription, and copying a random template is worse than nothing if it doesn't match what your site actually does. ComplyKit generates all three documents from a short questionnaire about what your site actually collects, and it does it entirely in your browser: your answers never leave the tab.
>
> **What it generates:**
>
> **Privacy policy** — GDPR and CCPA aware. Covers what data you collect, why you collect it, how long you keep it, who you share it with, and what rights users have. The questionnaire asks about analytics tools, contact forms, email lists, advertising, payment processors, and data region — the output matches what you actually have, not a generic template.
>
> **Terms of service** — the basics: what users agree to, what you disclaim, IP and content rules, how the relationship can end. Not a legal opinion, but a good-faith statement of the rules for using your product.
>
> **Cookie-consent banner** — a working implementation (copy-paste HTML/JS) that meets GDPR's opt-in consent requirements and California's opt-out standard. The generator outputs the code with your site name and policy URL already filled in.
>
> **What makes it different:**
>
> - All three documents, free, no subscription. Most generators give the privacy policy free and charge for terms + banner.
> - Runs 100% in your browser. Nothing is uploaded; your questionnaire answers are not sent to any server.
> - No signup, no email required. Generate, copy, paste, done.
> - GDPR and CCPA handled in the same output. The policy includes the sections each law requires — you don't have to generate separate versions for EU and California traffic.
>
> **What it can't do (honest):** ComplyKit generates a legal-language template from your answers. A template is only as accurate as what you tell it — if you have analytics you didn't disclose, or a payment processor you didn't mention, the generated policy won't cover them, and an inaccurate policy is worse than none. For complex regulated situations (health data, children's services, financial products) or anything you're actually nervous about, have a lawyer review it. Three in-depth guides cover the decision: whether you legally need a policy, what the nine required sections are, and exactly what GDPR and US law require from a cookie banner.
>
> Built by Copper Bay Labs.

**Topics to select on PH:** Legal Tech, Developer Tools, Productivity, Startups

**First comment (post this immediately after it goes live):**
> Happy to answer questions. The ones that come up most:
>
> **Is a generated policy legally valid?** Yes — a template accurately reflecting your data practices is legally valid. The risk is a mismatch: a policy that says you don't use analytics when you have Google Analytics installed, or doesn't disclose a payment processor you use, is worse than no policy because it is an inaccurate disclosure that creates additional liability. ComplyKit's questionnaire asks specifically about each common collection point so the output matches your actual situation. For anything regulated (health, finance, children's data) or involving international data transfers under GDPR's Chapter V, get a lawyer to review it.
>
> **Why build this when Termly and Iubenda exist?** Termly and Iubenda are good products. They also cost money (typically $10–25/month for the full feature set), require an account, and host your policy on their servers. For a solo developer or small project, paying $120–300/year to generate a text document feels out of proportion. ComplyKit is for the person who needs the three documents, wants them to be accurate, and doesn't want to pay a subscription or hand over their email address to get them.
>
> **Does "runs in browser" mean the cookie banner doesn't work properly?** The cookie banner is a code snippet (HTML + a small JS block) that you paste into your site. The snippet itself runs in your visitors' browsers and does the consent flow correctly — it blocks non-essential scripts until consent is given and logs the consent state to localStorage. "Runs in browser" means the generation step happens in your browser without a server call; the output is a real working implementation.
>
> **Does the policy cover both GDPR and CCPA?** Yes. The generated privacy policy includes the sections each law requires: GDPR's lawful basis, data subject rights (access, erasure, portability, objection), controller/processor language, and retention periods; and CCPA's "do not sell" rights, categories of personal information, and the California resident rights section. You don't generate two separate policies — the output covers both in a single document.

---

## 2. r/SideProject

> Rule check: r/SideProject explicitly allows "I built this" posts. Keep it honest, lead with what problem it solves, not what the tool is called. Invite feedback — the community responds well to genuine builders.

**Post title:**
> I built a free generator for privacy policy + terms + cookie banner — runs in browser, no signup, all three docs at once

**Body:**
> Been sitting on this one for a while because there are already generators out there — but they all hit the same friction: free tier gives you the privacy policy, terms and cookie banner are behind a paid plan.
>
> So I built ComplyKit: answer a short questionnaire about what your site actually collects (analytics, contact forms, email lists, payments, etc.) and get all three documents generated in one pass. Everything runs in your browser — your answers never leave the tab. No account required.
>
> Three things I tried to get right:
>
> **Matching actual data practices, not a generic template.** The questionnaire asks specifically whether you have Google Analytics, a contact form, an email list, a payment processor, and so on. The output includes (or excludes) sections based on what you actually have. A policy that says you don't use analytics when you do is worse than none — it's an inaccurate disclosure.
>
> **GDPR and CCPA in the same policy.** The single output covers both: lawful basis and data subject rights for GDPR, the "do not sell" and California resident rights section for CCPA. No separate versions.
>
> **A working cookie banner, not a placeholder.** The banner output is actual code — paste it into your `<head>` and it blocks non-essential scripts until the user consents, with a dismiss-only "accept" button that meets GDPR's unambiguous consent standard. Not a fake banner that doesn't actually block anything.
>
> It's free, no subscription. Three guides cover the decision questions: whether you legally need a policy, what the required sections are, and what GDPR and US law actually require from a cookie banner.
>
> Tool: https://labs.copperbaytech.com/complykit/
>
> Feedback welcome — especially from anyone who's gone through a GDPR complaint or CCPA request and found something missing in generated policies.

---

## 3. r/smallbusiness

> Rule check: r/smallbusiness allows tool posts that are genuinely useful to the community. Lead with the business risk context, not the product. The "not legal advice" framing is important here — this audience includes people who might actually act on legal information without verifying it with a professional.

**Post title:**
> If your website doesn't have a privacy policy, GDPR and CalOPPA both have teeth — here's a free generator that covers both

**Body:**
> Not legal advice — just context that might be useful.
>
> Most small business websites are missing at least one of the three legal pages they're supposed to have: a privacy policy, terms of service, and (if you have EU visitors and use analytics or cookies) a cookie-consent mechanism.
>
> **Why it matters:**
> - GDPR applies to any business whose website is accessible to EU visitors and collects their data — not just businesses based in Europe. Fines can reach €20 million or 4% of global annual turnover. Even for small businesses, supervisory authorities have issued fines in the thousands-to-tens-of-thousands range for basic violations like missing a privacy policy or running analytics without consent.
> - California's CalOPPA requires a privacy policy link on any commercial website that collects personal information from California residents — which is most websites. The California AG enforces it.
> - A missing privacy policy is also one of the items serial ADA demand-letter firms cite alongside accessibility failures. The two often travel together in the same complaint.
>
> **A tool that helps:** I built ComplyKit to make this easier. You answer a short questionnaire about what your site collects (contact form, analytics, email list, payment processor, etc.) and it generates a privacy policy, terms of service, and a cookie-consent banner tailored to what you actually have. Free, no subscription, runs in your browser — your answers aren't uploaded anywhere.
>
> It's not a substitute for a lawyer if you have a complex situation (health data, children's services, financial products), but for a straightforward small business site it gives you accurate, accurate-to-your-situation legal pages without paying $15/month for a generator.
>
> https://labs.copperbaytech.com/complykit/
>
> There are also three free guides on the site covering: whether you legally need a policy, what the required sections are, and what a compliant cookie banner actually has to do (the "I accept" button that doesn't block anything doesn't count under GDPR).

---

## 4. r/indiehackers

> r/indiehackers is receptive to founder narratives, especially honest ones that explain what you built, why, and what you'd do differently. Engagement is best on weekdays. Self-promotion is allowed in moderation; pair it with a genuine reflection on the build.

**Post title:**
> I built ComplyKit: a free in-browser generator for privacy policy + terms + cookie banner — the thing everyone puts off

**Body:**
> The thing that prompted this: I noticed that every AI-built app I tried during the vibe-coding wave — Lovable, Bolt, v0 outputs — launched with a functional UI and no legal pages at all. The tools are optimized for shipping fast; legal pages aren't part of the default output. Founders know they need them and put it off because the good generators charge a subscription and copying a template from someone else's site is usually wrong for your situation.
>
> So I built ComplyKit. Short questionnaire, all three documents out: privacy policy, terms of service, cookie-consent banner. 100% in-browser — nothing uploaded. No account. Free.
>
> **The technical decision I'm honest about:** This is a document generator, not an AI — it's a conditional template engine that includes/excludes sections based on your questionnaire answers. I made that choice deliberately. AI-generated legal language sounds confident and is hard to verify; a structured template covering the known required sections of GDPR, CCPA, and CalOPPA is more predictable and auditable. The risk of a generator is not the template itself but a mismatch between the template and what you actually do — if you have analytics you didn't disclose, the generated policy won't cover it. The questionnaire is designed to surface each common collection point specifically.
>
> **What I'd reconsider:** The cookie-consent banner output covers GDPR opt-in consent and CCPA opt-out. It does not handle the full consent-management-platform use case — if you have twenty third-party scripts that each need to be conditionally loaded by category, the output is a starting point, not a finished solution. A proper CMP (Cookiebot, OneTrust) is worth the cost if you have that complexity. For a simpler site — one analytics tool, one contact form — the ComplyKit banner does the job.
>
> **Three guides** that go deeper on the decisions: whether you legally need a policy (most sites do), what the nine required sections are and which ones most templates miss, and what GDPR and US law actually require from a cookie banner (the "I accept" button that doesn't block anything is not compliant).
>
> Tool: https://labs.copperbaytech.com/complykit/
>
> Happy to hear what's missing — especially from anyone who's been on the receiving end of a GDPR complaint and knows what the supervisory authority actually looks for.

---

## 5. r/webdev and r/nocode

> r/webdev: answer-where-asked in pre-launch checklist threads, "what legal pages do I need?" threads, or privacy/GDPR discussion threads. Showoff Saturday post also works. r/nocode and r/lovabledev: high product-audience fit — AI builder users frequently ship without legal pages; a standalone post or answer-where-asked both work.

**Showoff Saturday post for r/webdev:**

**Title:** Show r/webdev: privacy policy + terms + cookie banner generator — free, in-browser, no signup

**Body:**
> Built ComplyKit: answer a short questionnaire, get all three legal documents in one pass — privacy policy (GDPR + CCPA), terms of service, and a working cookie-consent banner with actual code to paste in.
>
> Runs entirely in your browser, nothing uploaded. The questionnaire asks about your actual setup (analytics, contact form, email list, payment processor, etc.) so the output matches what you have rather than being a generic template.
>
> https://labs.copperbaytech.com/complykit/
>
> Also three guides: do I actually need a privacy policy (yes, almost certainly), what the 9 required sections are, and what a compliant cookie banner actually needs to do.

**Answer-where-asked (pre-launch checklist threads):**
> For legal pages — ComplyKit (https://labs.copperbaytech.com/complykit/) generates all three in one pass (privacy policy, terms, cookie banner), GDPR and CCPA aware, runs in your browser, free. Takes 5 minutes. The generated policy only covers what you tell it you have, so fill out the questionnaire honestly about your analytics/contact form/payment setup.

**Post for r/nocode / r/lovabledev:**

**Title:** If you're shipping Lovable / Bolt / v0 apps, here's a free generator for the legal pages those tools don't include

**Body:**
> AI builders are great at shipping UIs fast. They don't generate a privacy policy, terms of service, or cookie-consent banner — and GDPR applies to EU visitors regardless of how the site was built.
>
> ComplyKit generates all three: answer a short questionnaire, get legal-language documents tailored to what your app actually collects. Runs in your browser, nothing uploaded, no signup.
>
> https://labs.copperbaytech.com/complykit/
>
> If your app has EU users and analytics running without consent, that's a GDPR issue. The cookie-consent guide on the site explains exactly what "consent" means under the regulation and why an "I accept" button that doesn't actually block the scripts doesn't count.

---

## 6. r/legaladvice / r/LegalAdviceOffTopicPosts

> **Do NOT post a promotional thread** in r/legaladvice — this subreddit does not allow it and mod-specific rules often prohibit service recommendations. Use answer-where-asked ONLY in threads where someone has already asked the question. Always lead with the actual answer to their question, not the tool.

**Answer-where-asked (threads asking "do I need a privacy policy for my app/website?"):**
> Almost certainly yes if you collect any personal data — email addresses, IP addresses via server logs, or analytics identifiers all qualify under GDPR. Under CalOPPA, commercial websites collecting personal information from California residents (which is most websites) are required to have a conspicuous privacy policy link.
>
> For a practical starting point: ComplyKit (https://labs.copperbaytech.com/complykit/) generates a GDPR- and CCPA-aware privacy policy from a short questionnaire about what you actually collect — analytics, contact forms, email lists, payment processors. Free, no signup, runs in your browser. For a simple site, it gives you accurate-to-your-situation language. For anything involving health data, children, financial services, or international data transfers, you still want a lawyer to review it. [Not legal advice — consult a qualified attorney for your specific situation.]

**Answer-where-asked (threads asking about cookie consent banners):**
> GDPR requires prior, informed, freely given consent before setting non-essential cookies. "Freely given" means pre-checked boxes don't count, and declining must be as easy as accepting. The "I accept" banner that doesn't actually block the analytics scripts from loading doesn't meet this standard — the consent must precede the data collection.
>
> ComplyKit (https://labs.copperbaytech.com/complykit/) generates a working cookie-consent banner implementation (actual HTML/JS code, not just a template) that blocks non-essential scripts until consent is given. The cookie-consent guide on the site explains what valid consent requires and what the common patterns that fail actually do wrong. [Not legal advice.]

---

## 7. r/Entrepreneur

> r/Entrepreneur allows helpful resource sharing in relevant threads. Answer-where-asked on startup compliance, legal setup, or "what do I need before launching" questions.

**Answer-where-asked:**
> For privacy policy + terms + cookie consent, ComplyKit (https://labs.copperbaytech.com/complykit/) is a free in-browser generator that covers all three in one pass — GDPR and CCPA aware, no subscription, no signup. The questionnaire asks about your actual setup (analytics, contact form, email list, payment processor) so the output matches what you have. For a straightforward site, that's usually enough. If you have health data, serve children, or have investors who'll do due diligence on your legal posture, get a lawyer to review it. Takes about 5 minutes.

---

## AlternativeTo / SaaSHub listing

**Listing name:** ComplyKit  
**Alternatives to list against:** Termly, Iubenda, GetTerms.io, Freeprivacypolicy.com, Privacy Policy Generator (privacypolicies.com)  
**Tags:** privacy-policy, terms-of-service, cookie-consent, GDPR, CCPA, legal, compliance, generator, open-source-alternative  
**Short description:**
> Free in-browser generator for privacy policy, terms of service, and cookie-consent banner. GDPR + CCPA aware. No subscription, no signup, nothing uploaded — all three legal documents from a single questionnaire in your browser. Alternatives: Termly, Iubenda.

---

## Timing notes

- **Product Hunt:** Tuesday or Wednesday, 12:01 AM PT. Stay active in comments the first two hours. PH rewards founder engagement in the first two hours more than any other factor.
- **r/SideProject:** 1–2 days after PH while momentum is live. Weekdays perform better than weekends.
- **r/smallbusiness:** any weekday; avoid Monday mornings (low engagement). Lead with the legal risk context; if you lead with "I built a tool," it reads as promotion and gets downvoted.
- **r/indiehackers:** any day after PH/SideProject. The founder narrative post works better with some HN/PH momentum to reference.
- **r/webdev Showoff Saturday:** any Saturday. Keep it short; link the guides for depth.
- **r/nocode / r/lovabledev:** check for pinned showcase or self-promo threads before posting standalone; post there if one exists. Otherwise, a standalone post with "I built this" framing is usually fine on these subs.
- **r/legaladvice / r/LegalAdviceOffTopicPosts:** answer-where-asked only. Do NOT post a promotional thread.
- **AlternativeTo / SaaSHub:** submit immediately — these listings compound over time as people search for alternatives to paid generators.

---

## What to log in `ops-log/metrics-ledger.md`

After each post, record:

- **Product Hunt:** finish position at 24h and 48h; upvote count; any comments that surface genuine product feedback to act on
- **r/SideProject:** upvotes at 24h; any comments about missing features (GDPR Article 13/14 notices, DPO contact fields, etc.)
- **r/smallbusiness:** upvotes; any DMs or comments from small-business owners with specific compliance questions (signals content gaps for a guide)
- **r/indiehackers:** engagement on the "template vs. AI" framing; any "I had this problem" responses
- **r/webdev:** upvotes and any technical feedback on the cookie banner implementation
- **AlternativeTo / SaaSHub:** when the listing goes live; any community edits

Channels most likely to generate inbound leads for Copper Bay Tech's compliance consulting services: r/smallbusiness and r/legaladvice answer threads. Record any emails received at contact@copperbaytech.com referencing ComplyKit.
