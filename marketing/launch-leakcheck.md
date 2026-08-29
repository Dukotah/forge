# LeakCheck — Launch Kit

> **For the owner to post.** One-paste-ready copy for every channel below.
> Automated posting is against platform ToS — you fire these from your own accounts.
> No fabricated metrics, users, or testimonials — these are honest.
> Log what you posted and any results in `ops-log/metrics-ledger.md`.

**Tool URL:** https://labs.copperbaytech.com/leakcheck/  
**Guides:**
- https://labs.copperbaytech.com/leakcheck/guides/accidentally-committed-api-key-github.html  
- https://labs.copperbaytech.com/leakcheck/guides/find-hardcoded-api-keys-in-codebase.html  
- https://labs.copperbaytech.com/leakcheck/guides/prevent-committing-secrets-pre-commit.html  
- https://labs.copperbaytech.com/leakcheck/guides/remove-secret-from-git-history.html  
- https://labs.copperbaytech.com/leakcheck/guides/scan-git-repository-for-secrets.html  
**Audience:** developers, indie hackers, DevOps engineers, anyone building with AI coding tools (Cursor, Lovable, Bolt, v0, Copilot) where real API keys can slip into generated code unnoticed.  
**Core promise:** Paste code, `.env`, or config and instantly find exposed API keys, tokens, and private keys — 40+ named provider patterns, Shannon entropy filtering, 100% in your browser. Nothing is uploaded. Free, no signup.

---

## Posting order (highest leverage first)

1. **Show HN** — technically interesting implementation (entropy filtering, zero-network guarantee); the developer audience is exactly who needs this; weekdays 9–11 AM ET
2. **Product Hunt** — biggest discoverability window; Tuesday/Wednesday 12:01 AM PT; 1–2 days after Show HN
3. **r/SideProject** — welcoming to launches; post after PH to reach a different slice
4. **r/webdev** — Showoff Saturday thread or answer-where-asked in pre-launch checklist threads
5. **r/indiehackers** — founder narrative about the vibe-coding / AI-assisted development leak problem

---

## 1. Show HN

> Rule check: Show HN is for things you built. Weekdays 9–11 AM ET for best visibility.
> Stay in the thread for the first 2 hours to respond. HN rewards technical honesty — lead with the interesting implementation decision, not the marketing pitch.

**Title:**
> Show HN: LeakCheck – paste code or .env to find exposed API keys (runs entirely in your browser)

**Body:**
> Built this after watching AI-generated code commit actual API keys: Cursor, Copilot, and the vibe-coding tools (Lovable, Bolt, v0) are good at producing working code quickly, but they'll use whatever's in the context — including real credentials you pasted to give the model an example. The key slips in, gets committed, shows up on GitHub, and gets scraped by bots within minutes.
>
> LeakCheck scans whatever you paste — a file, a `.env`, a config snippet, a chunk of AI output you're about to ship — and flags exposed secrets by severity, with the value masked and a fix instruction for each hit.
>
> Two technical decisions I'd be curious to get feedback on:
>
> **Named patterns vs. entropy-only scanning.** The scanner uses 40+ named provider regexes (AWS access key IDs start with `AKIA`; Stripe live keys with `sk_live_`; OpenAI keys with `sk-`; GitHub tokens with `ghp_` or `github_pat_`, etc.). Named patterns are precise but miss novel formats. The alternative — entropy-only detection — would catch anything that looks random enough, but the false positive rate on normal code is brutal. The approach here: named patterns for known providers; Shannon entropy as a secondary filter to reduce false positives on "generic high-entropy variable" patterns.
>
> **The masking primitive.** Full secret values are never rendered. The UI shows the first 4 characters + the last 4 characters, with the middle replaced by bullets (•). For values shorter than 8 characters, the display is further restricted. The masking happens before the value touches the DOM, and user-derived text is inserted via `textContent` (not `innerHTML`) so pasted code can't inject markup. I'm reasonably happy with this but interested whether `first-4 + last-4` is the right tradeoff — short enough to identify which key is leaking without being reverse-engineerable.
>
> The zero-network guarantee is enforced at the source level: there's a comment at the top of the detection engine that documents the contract ("ZERO network calls with user data — no fetch / XHR / WebSocket / sendBeacon / Image-ping anywhere in this file"), so an auditor can verify it in one pass rather than tracing every execution path.
>
> 40+ patterns currently: AWS (access key + secret), Stripe (live, restricted, webhook signing), OpenAI, Anthropic, GitHub PAT/OAuth tokens, GitLab, Google API keys + OAuth client secrets, Slack bot/app/webhook tokens, Twilio, SendGrid, Mailgun, Mailchimp, Datadog, Heroku, Shopify, Square, Plaid, npm tokens, Cloudflare, DigitalOcean, Linode, RSA/EC/OpenSSH private keys, Postgres/MySQL/Mongo database connection URLs with embedded credentials, and signed JWTs.
>
> Five in-depth guides cover the incident lifecycle: what to do the moment you realize you've committed a key to GitHub; how to audit a whole codebase for hardcoded credentials; how to prevent future commits with a pre-commit hook; how to permanently remove a secret from git history using git-filter-repo and BFG; and how to scan a full git repository including all historical commits.
>
> https://labs.copperbaytech.com/leakcheck/
>
> Runs on GitHub Pages. Vanilla JS, no dependencies.

**First comment (post immediately after it goes live):**
> A few implementation questions I'd genuinely like input on:
>
> **False positive rate on real code:** Named patterns are tight enough that the false positive rate on provider-specific patterns (AWS, Stripe, OpenAI, etc.) is very low in practice — those prefixes are specific enough that ordinary variable values rarely match. The entropy filter adds a second gate on the "generic high-entropy variable" patterns. What I'm less confident about: whether the generic patterns are worth including at all, or whether they create enough noise to be net-negative for usefulness.
>
> **The GitHub scraping timing question:** When a key hits a public GitHub commit, how fast do the bots actually find it? The answer in practice is: fast enough that you should treat any key exposed in a public commit as compromised regardless of whether you've rotated it yet. The guides reflect this ("rotate first, rewrite history second"), but if anyone has current data on scraper latency I'd be curious.
>
> **What the tool can't do:** It can only see the text you paste. It won't find secrets buried in compiled output, environment variables set at runtime but not in config files, or secrets that were committed and then deleted (they're still in history — that's what the git history guide covers). For committed history, the full-repo scan guide walks through running gitleaks or trufflehog against every commit.

---

## 2. Product Hunt

**Tagline:**
> Find exposed API keys by pasting code — 40+ patterns, runs entirely in your browser

**Description:**
> LeakCheck scans whatever you paste — code, `.env`, config, AI-generated output — and flags exposed API keys, tokens, and private keys by severity. 40+ named provider patterns. Runs 100% in your browser; nothing is uploaded.
>
> **Why this exists:** AI coding tools (Cursor, Copilot, Lovable, Bolt, v0) produce working code fast — but they'll use whatever's in their context window, including real credentials you pasted as examples. The key ends up in the generated code, gets committed to a public repo, and gets scraped within minutes. This is not hypothetical; it's a documented, recurring incident pattern across every AI coding community.
>
> **What LeakCheck flags (40+ patterns):**
> - **Cloud providers** — AWS access key IDs and secret access keys
> - **AI APIs** — OpenAI (`sk-`), Anthropic, Hugging Face
> - **Payment** — Stripe live keys, restricted keys, and webhook signing secrets; Square
> - **Source control** — GitHub PATs, GitHub OAuth tokens, GitLab personal access tokens, npm publish tokens
> - **Google** — API keys and OAuth client secrets
> - **Communication** — Slack bot/app/webhook tokens, Twilio account SID + auth token, SendGrid, Mailgun, Mailchimp
> - **Infrastructure** — Cloudflare API tokens, DigitalOcean, Linode, Heroku, Datadog
> - **Private keys** — RSA, EC, and OpenSSH PEM blocks
> - **Database connection URLs** — Postgres, MySQL, MongoDB with embedded username/password
> - **JWTs** — signed JSON Web Tokens in source
>
> **Detection approach:** Named provider regexes for known formats (precise, low false-positive rate) plus Shannon entropy filtering for high-entropy generic variable patterns. Sensitive values are masked to first 4 + last 4 characters before they touch the DOM — the full value is never displayed or logged.
>
> **The privacy guarantee:** There's no backend. The scanner is a JavaScript file that runs locally in your browser tab. No network call is made with your pasted content — this is explicitly enforced in the source code, not just claimed in marketing copy. Auditable in DevTools.
>
> **Five in-depth guides** covering the full incident lifecycle: what to do the moment you find a leaked key on GitHub; how to audit an entire codebase for hardcoded credentials; how to prevent future leaks with a pre-commit hook; how to permanently remove a secret from git history; and how to scan a full repository including all historical commits.
>
> Runs 100% in your browser. Nothing stored. No signup. Free.
>
> Built by Copper Bay Labs.

**Topics to select on PH:** Developer Tools, Security, Open Source, Productivity

**First comment (post this immediately after it goes live):**
> Happy to answer questions. The ones that usually come up:
>
> **Is it actually private?** Yes — and it's verifiable. Open DevTools → Network tab, paste something, hit Scan. You'll see zero outbound requests with your code. The scanner is a local JavaScript file; it has no backend to send data to. The source code has an explicit comment at the top that documents this guarantee. If you're skeptical, it's the right thing to verify before trusting any security tool.
>
> **Why not just use `git-secrets` or `trufflehog`?** Those are great tools for scanning a git repository's full history and for CI integration. LeakCheck is for the pre-commit moment — you've got a file or a chunk of AI output in front of you and you want to know right now, without installing anything or running a command, whether it has a credential in it. Different workflow, not a replacement.
>
> **How accurate are the patterns?** Named provider patterns (AWS `AKIA...`, Stripe `sk_live_...`, OpenAI `sk-...`, GitHub `ghp_...`, etc.) are tight enough that false positives are rare — those prefixes are specific to each provider. The entropy-filtered generic patterns are more likely to produce a false positive on an ordinary-looking variable that happens to have a high-entropy value. If you get a hit and it's not a real credential, that's a false positive in the generic patterns.
>
> **Does it find secrets in git history?** No — it only sees the text you paste. For scanning a full repository including historical commits, the guides cover running gitleaks and trufflehog against the full history. The tool is for the pre-commit workflow; the guides cover the post-commit recovery path.

---

## 3. r/SideProject

> Rule check: r/SideProject explicitly welcomes "I built this" posts. Self-posts and links are fine.
> Best on weekdays (Tue–Thu) between 9–11 AM ET.
> Don't post the same day as your PH launch — wait a day so it hits a different audience.

**Title:**
> I built a free secret scanner that runs in your browser — paste AI-generated code and find exposed API keys before you commit

**Body:**
> Hey r/SideProject — sharing something I built: **LeakCheck**
>
> https://labs.copperbaytech.com/leakcheck/
>
> **What it does:** Paste code, a `.env` file, or any config and it instantly flags exposed API keys, tokens, and private keys. 40+ patterns covering AWS, Stripe, OpenAI, Anthropic, GitHub, GitLab, Slack, Twilio, Google, and more. Runs 100% in your browser — nothing is uploaded.
>
> **Why I built it:** AI coding assistants are great at generating working code quickly, but they use whatever's in their context — including real credentials you pasted as examples. The generated code contains your actual key, you commit it, it hits GitHub, and bots scrape it within minutes. I wanted a tool that sits in the pre-commit workflow: paste what you're about to ship, instantly know if you have a problem.
>
> **The privacy thing:** Most secret scanners send your code to a server for processing. LeakCheck doesn't — the scanner is a JavaScript file that runs locally in your tab. No backend. Verifiable in DevTools network panel. This matters because you might be pasting real credentials into a scanner to check if they're exposed — a scanner that uploads them to a server would be a worse outcome than just committing them.
>
> **Five guides** covering the full incident lifecycle:
> - [Accidentally committed an API key to GitHub? Here's what to do](https://labs.copperbaytech.com/leakcheck/guides/accidentally-committed-api-key-github.html)
> - [How to find hardcoded API keys in an existing codebase](https://labs.copperbaytech.com/leakcheck/guides/find-hardcoded-api-keys-in-codebase.html)
> - [How to prevent future commits with a pre-commit hook](https://labs.copperbaytech.com/leakcheck/guides/prevent-committing-secrets-pre-commit.html)
> - [How to permanently remove a secret from git history](https://labs.copperbaytech.com/leakcheck/guides/remove-secret-from-git-history.html)
> - [How to scan a full git repository for leaked secrets](https://labs.copperbaytech.com/leakcheck/guides/scan-git-repository-for-secrets.html)
>
> No signup, free, runs in browser.
>
> Happy to hear what patterns are missing from the list.

---

## 4. r/webdev

> Rule check: r/webdev allows tool sharing on Showoff Saturday (weekly thread). Link posts outside the thread may be removed. Answer-where-asked one-liner is appropriate any time someone asks about pre-launch checklists, security best practices, or managing secrets.

**Showoff Saturday post (use in the weekly sticky thread):**
> Built LeakCheck — paste code, `.env`, or config and find exposed API keys and secrets in your browser. 40+ named patterns (AWS, Stripe, OpenAI, GitHub, Google, Slack, private PEM keys, database URLs, JWTs). Runs entirely client-side, nothing uploaded, no signup.
>
> Also built 5 in-depth guides covering the incident workflow: what to do if you already committed a key, how to audit an existing codebase, pre-commit hook setup, git history rewrite with git-filter-repo/BFG, and scanning a full repo with gitleaks.
>
> https://labs.copperbaytech.com/leakcheck/

**Answer-where-asked one-liner** (for threads about "pre-launch security checklist", "how to prevent committing API keys", "accidentally pushed .env to GitHub", "secrets management for small projects"):
> There's a free browser-based scanner called LeakCheck (https://labs.copperbaytech.com/leakcheck/) — paste your code or `.env` and it flags exposed API keys with 40+ named patterns (AWS, Stripe, OpenAI, GitHub, etc.). Runs entirely in the browser, nothing uploaded. Also has guides on git history cleanup if you've already committed something.

---

## 5. r/indiehackers

> Rule check: r/indiehackers (and indiehackers.com itself) welcome build stories and tool launches.
> The founder-narrative frame works well here. The IH community skews toward AI-assisted builders and solo developers — exactly the audience most affected by the vibe-coding credential leak problem.
> Community is supportive of honest "here's what I built and why" posts. Don't over-optimize for upvotes.

**Title:**
> Built a browser-based secret scanner for AI-assisted projects — paste code and find exposed API keys before you commit

**Body:**
> I've been building a suite of free, browser-only security and compliance tools under Copper Bay Labs for indie developers — things you know you should check before shipping but rarely do because they require spinning up a CLI tool or paying for a scanner. This one is LeakCheck, the secret detector:
>
> https://labs.copperbaytech.com/leakcheck/
>
> **The problem that prompted it:** AI coding tools produce working code fast, which is why most of us use them. But they have a consistent failure mode: if you paste a real API key anywhere in the context — as an example, in a `.env` snippet, in a prompt — there's a real chance it ends up in the generated output. You're reviewing generated code quickly, it looks fine, you commit it. The key hits GitHub. Bots are scraping new public commits within minutes and testing valid credentials immediately.
>
> This isn't hypothetical. The "accidentally committed API key" scenario is the most common security incident in indie/solo developer projects, specifically because the feedback loop is fast: write → paste → commit → push → exposed, with no friction point where you notice the credential slipped in.
>
> **What I built:** A scanner that runs in your browser tab with no backend. Paste whatever you're about to commit — a file, a config chunk, the output from an AI tool — and it flags exposed credentials by severity. 40+ named provider patterns covering AWS, Stripe, OpenAI, Anthropic, GitHub, Google, Slack, Twilio, private PEM keys, database connection URLs, JWTs, and more.
>
> **The design constraint I cared about:** It had to be safer to paste code into LeakCheck than to not use it. That means: zero network calls with your pasted content. No backend. The scanner runs locally in JavaScript. This is verifiable in DevTools — there's no server to send your credentials to, so even pasting a real key to check it doesn't create a new exposure. Most "security tools" that work this way don't bother to make the guarantee auditable; I wrote it into the source code as an explicit documented contract.
>
> **Five guides** cover the full workflow:
> - What to do the moment you find a leaked key in GitHub (rotate first, then rewrite history)
> - How to audit an entire codebase for credentials that have been hardcoded over time
> - How to set up a pre-commit hook that runs automatically and blocks commits containing patterns
> - How to permanently remove a secret from git history with git-filter-repo and BFG Repo-Cleaner
> - How to scan a complete git repository including all historical commits
>
> Free, runs in browser, no signup.
>
> Happy to hear what patterns are missing.

---

## Additional channels

### AlternativeTo / SaaSHub
- **AlternativeTo listing:** Submit as free alternative to GitGuardian (for the paste-and-check workflow), Snyk (for the secrets detection use case), and trufflehog (for the browser/no-CLI audience who don't want to install a binary)
- **Tags for SaaSHub:** security, secrets-detection, api-key-scanner, developer-tools, free, open-source, client-side
- **AlternativeTo categories:** Security, Developer Tools

### Answer-where-asked threads (organic, not promotional)

Good threads to reference when you're genuinely answering a question:

- r/webdev, r/programming: "accidentally pushed `.env` to GitHub", "how to prevent committing API keys"
- r/devops: "secrets management for small projects without a vault"
- r/LocalLLaMA, r/ChatGPT, r/cursor: "is it safe to paste real API keys into AI prompts" — the five guides are the right thing to reference, not just the tool link
- Stack Overflow: questions about `git filter-repo` for secret removal, pre-commit hooks for credential scanning, "rotate compromised API key GitHub" — the guides at https://labs.copperbaytech.com/leakcheck/guides/ are the right content to reference
- GitHub issues/discussions in AI coding tool repos where users ask about credential safety: paste mode is the relevant reference point

**The one-line answer-where-asked text:**
> LeakCheck (https://labs.copperbaytech.com/leakcheck/) can check that — paste the code and it flags exposed credentials in your browser with nothing uploaded. It also has a guide on the git history cleanup if something already got committed.

### r/netsec note
r/netsec rules require substantial write-ups or published research — a direct tool link post will be removed. The five LeakCheck guides are appropriate to share in relevant threads where the topic is genuinely being discussed (e.g., "how do git secrets scanners actually work", "what happens to GitHub secrets after they're scraped"). Link to the guide, not the tool homepage, and only where the topic is genuinely relevant.

---

## Timing notes

- **Show HN:** Weekday 9–11 AM ET. Write a substantive first comment immediately — HN rewards technical honesty about interesting implementation decisions and limitations. Stay in the thread for the first 2 hours.
- **Product Hunt:** 1–2 days after Show HN, Tuesday or Wednesday 12:01 AM PT. Post the first comment immediately after it goes live.
- **r/SideProject:** Same week as PH, different day.
- **r/webdev Showoff Saturday:** Any Saturday.
- **r/indiehackers:** After PH and HN, when you have some feedback or data to reference.

---

## What to log

After each post, record in `forge/ops-log/metrics-ledger.md`:
- Platform, date, post URL or thread link
- Upvotes / comments / traffic spike visible in analytics if available
- Any questions asked that reveal missing patterns or common confusion points
- Any patterns that came up repeatedly (e.g., "does it detect X?") that should be added to the 40+
- Anything worth feeding back into the tool or guides
