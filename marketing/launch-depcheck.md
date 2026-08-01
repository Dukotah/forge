# DepCheck — Launch Kit

> **For the owner to post.** One-paste-ready copy for every channel below.
> Automated posting is against platform ToS — you fire these from your own accounts.
> No fabricated metrics, users, or testimonials — these are honest.
> Log what you posted and any results in `ops-log/metrics-ledger.md`.

**Tool URL:** https://labs.copperbaytech.com/depcheck/  
**Guides:**
- https://labs.copperbaytech.com/depcheck/guides/fix-npm-audit-vulnerabilities.html  
- https://labs.copperbaytech.com/depcheck/guides/audit-npm-packages-security.html  
- https://labs.copperbaytech.com/depcheck/guides/npm-typosquatting-how-to-detect.html  
**Audience:** JavaScript developers, indie hackers, vibe-coders, DevOps engineers, anyone deploying a Node.js or JS project who wants to know if their dependencies are safe before they ship.  
**Core promise:** Paste your `package.json` and get a dependency risk report covering six dimensions — vulnerabilities, typosquatting, abandoned packages, risky licenses, loose version pins, and bloat — in seconds. No install. Runs entirely in your browser.

---

## Posting order (highest leverage first)

1. **Show HN** — the technically interesting angle (typosquatting + OSV in a single paste, no install) is a strong fit for HN; post 9–11 AM ET on a Tuesday or Wednesday
2. **Product Hunt** — biggest discoverability moment; Tuesday/Wednesday 12:01 AM PT; post Show HN first and reference feedback in your PH first comment
3. **r/SideProject** — welcoming to launches; 1–2 days after PH
4. **r/webdev** — answer-where-asked in dependency security threads; or Showoff Saturday post
5. **r/netsec** — do NOT post the tool directly (mods remove product links); the typosquatting guide and the audit guide are the right content to share in relevant discussions
6. **r/indiehackers** — founder narrative; works any day after PH

---

## 1. Show HN

**Title:**
> Show HN: DepCheck – paste a package.json, find CVEs, typosquatted names, and abandoned packages

**Body (self-text post):**
```
I built DepCheck [1] to fill a gap I kept running into: npm audit only checks for 
published CVEs in packages you've already installed. It won't catch a typosquatted 
package (which runs malicious code at install time, before a CVE ever gets filed), 
won't flag an abandoned package with no maintainer, and won't warn you about a 
copyleft license buried in your transitive deps.

DepCheck takes a package.json paste and runs six checks in your browser:

1. Known vulnerabilities — via the OSV database (same data npm audit uses for CVEs, 
   but without requiring an npm install first)
2. Typosquatting — edit-distance similarity against ~2,000 popular packages; flags 
   names that look like they could be a one-character mistake
3. Abandoned / unmaintained — no releases in years, deprecated flag, orphaned project 
   signals
4. Risky licenses — GPL/AGPL copyleft and unknown licenses that can infect or expose 
   commercial code
5. Loose version ranges — ^ / * / "latest" pins that silently pull in unreviewed updates
6. Dependency bloat — heavy or redundant packages that expand your attack surface 
   without obvious benefit

Privacy: only package names and versions go out to public registries (OSV, npm). Your 
source code, env vars, and secrets never leave the tab.

A few things I'd reconsider if I were building it again: 

- The typosquatting heuristic is edit-distance-only — it catches single-character 
  transpositions/additions well but misses creative look-alike attacks (e.g. 
  'express-uti1s' with a numeral 1 replacing the letter l). A production version of 
  this needs periodic sync with npm's own abuse-detection data.
- I'm using a public OSV endpoint for vulnerability lookups. This is reliable for 
  batch checks but rate-limited; a heavy manifest with 200+ deps will queue lookups 
  serially, which is slow. A locally cached OSV dataset would fix this.
- "Abandoned" is harder to define than it sounds. No releases in two years could mean 
  unmaintained or could mean "it's done and stable." I err toward flagging and letting 
  you decide, but I've seen plenty of false positives on mature utility libraries.

Three guides cover the most common follow-up questions: fix-intent vuln remediation, 
a full pre-deploy audit workflow, and a deeper dive on how typosquatting attacks 
actually work (including the npm pack trick for inspecting postinstall scripts before 
they run).

[1] https://labs.copperbaytech.com/depcheck/
```

**First comment to post immediately after the Show HN goes live:**
```
Anticipated questions:

Q: How is this different from `npm audit`?
A: npm audit checks packages already installed in a node_modules tree for published 
CVEs. DepCheck works from a package.json paste — no install needed — and adds five 
checks npm audit doesn't do at all: typosquatting detection, abandoned-package 
signals, license risk, version range looseness, and bloat. The typosquatting check 
is the most unique: a typosquatted package exfiltrates credentials during `npm install` 
itself, before any CVE gets filed, which means npm audit will never catch it.

Q: Can I use this in CI?
A: Not yet as a native CLI. You can run it in a browser tab as part of a manual 
pre-deploy checklist, or use `npm audit` + `npm info` for CI gatekeeping (the audit 
guide covers both). A CI-native version with scheduled re-scans is on the Pro 
waitlist roadmap.

Q: How does the typosquatting detection actually work?
A: It computes Levenshtein edit distance between each package name in your manifest 
and a curated list of ~2,000 popular packages. Anything within distance 1 (one char 
insertion, deletion, or substitution) against a much-more-popular package gets flagged. 
The heuristic produces false positives — legitimate packages can have similar names — 
so the output is "check this one" rather than "this is confirmed malicious."

Q: What data leaves my browser?
A: Only package names and versions, sent to two public endpoints: OSV.dev for 
vulnerability data and registry.npmjs.org for metadata (version freshness, license, 
maintainer signals). Your source code, file paths, secrets, and env vars never leave 
the tab.
```

---

## 2. Product Hunt

**Tagline:**
> Find CVEs, typosquatted names, and abandoned packages in your package.json — no install

**Description:**
> DepCheck scans your npm dependencies for six risk categories before you ship — without running `npm install`, without uploading your code, and without a signup.
>
> **The problem it solves:** `npm audit` is good at what it does, but it only catches published CVEs in packages you've already installed. It won't flag a typosquatted package (which runs at install time, before any CVE is filed), won't warn you that a dependency hasn't had a release in three years, and won't catch a copyleft license buried in your indirect deps.
>
> **What DepCheck checks:**
> - **Known vulnerabilities** — via the OSV database; same advisory data as `npm audit`, but DepCheck works from a paste, no install required
> - **Typosquatted names** — edit-distance comparison against popular packages; `crossenv` vs `cross-env` is the classic example, but new typosquat campaigns appear regularly
> - **Abandoned / unmaintained packages** — no releases in years, deprecated flag, orphaned project signals; an unmaintained dependency is an unpatched dependency
> - **Risky licenses** — GPL, AGPL, and unknown licenses that can obligate you to open-source your own code or create legal uncertainty
> - **Loose version pins** — `^1.2.0`, `*`, `"latest"` ranges that silently pull in unreviewed updates on `npm install`
> - **Dependency bloat** — heavy or redundant packages that expand your install size and attack surface
>
> **How it works:** Paste your `package.json`. Only package names and versions are sent to public registries (OSV.dev and npm). Your source code, secrets, and env vars never leave the browser. Results are ranked by severity with what's wrong and what to do.
>
> **Three in-depth guides** cover the most common follow-up needs: step-by-step CVE remediation, a full pre-deploy dependency audit workflow, and a detailed explainer on how npm typosquatting attacks work — including how to inspect a postinstall script before it runs on your machine.
>
> Runs 100% in your browser. No install. No signup. Free.
>
> Built by Copper Bay Labs.

**Topics to select on PH:** Developer Tools, Security, Open Source, Developer Experience

**First comment to post right after launch goes live:**
```
FAQ I've seen come up in early feedback:

**Isn't this just npm audit in a browser?**
The CVE check uses the same OSV database npm audit does, but DepCheck adds five 
checks npm audit doesn't do: typosquatting detection, abandoned-package signals, 
license risk, version pin looseness, and bloat. The typosquatting check is the most 
distinct — a typosquatted package runs exfiltration code during `npm install`, before 
any CVE gets filed. npm audit has no category for it.

**What does "typosquatting detected" actually mean?**
It means the package name in your manifest is one character away from a much more 
popular package, which is a pattern attackers use to catch developers who mistype a 
package name during `npm install`. The flag is "check this" — not "confirmed 
malicious." Click through to the typosquatting guide for a five-step verification 
workflow that tells you whether the package is legitimate before you trust it.

**Can I run this without the internet?**
No — the vulnerability lookup hits OSV.dev and the metadata checks hit 
registry.npmjs.org. But the typosquatting check and the version-pin/license heuristics 
run locally against data bundled in the page, so those work offline.

**Is there a CLI version?**
Not yet. Browser-only for now. A CI-native version with scheduled re-scans is on the 
Pro roadmap — join the waitlist on the tool page if that's what you need.
```

---

## 3. r/SideProject

**Post title:**
> I built DepCheck — paste a package.json, find vulnerabilities, typosquatted packages, and abandoned dependencies (free, no install, browser-only)

**Body:**
```
I built DepCheck [link] because I kept running into the same pre-ship anxiety: my 
package.json has 60+ dependencies I didn't all choose consciously (some came in as 
indirect deps, some were LLM suggestions I just accepted), and `npm audit` only 
tells me about published CVEs — it doesn't warn me that a package hasn't been updated 
in three years, or that one of my package names is suspiciously close to a well-known 
library.

DepCheck checks six things that I actually worry about before shipping:

1. Known CVEs (via OSV — same data source as npm audit, no install required)
2. Typosquatted names — packages a character away from popular ones that can execute 
   malicious code at install time
3. Abandoned / unmaintained packages — no releases in years or a deprecated flag
4. Copyleft licenses (GPL/AGPL) that could have legal implications for commercial apps
5. Loose version pins (`^`, `*`, `"latest"`) that silently pull in unreviewed updates
6. Heavy or redundant packages that inflate your attack surface

Privacy: only package names and versions go to public registries. Your source code 
never leaves the tab. No signup.

I also wrote three guides that cover the most common follow-up questions once you 
find something: how to fix npm vulnerabilities, a full pre-deploy audit workflow, 
and a deep dive on how typosquatting attacks actually work and how to verify a 
suspect package before installing.

Feedback welcome — the typosquatting heuristic in particular is something I'd love 
input on (it's edit-distance-only right now, which catches the common one-character 
transpositions but misses more creative look-alikes).

https://labs.copperbaytech.com/depcheck/
```

---

## 4. r/webdev

### Option A: Showoff Saturday post

**Title:**
> [Showoff Saturday] DepCheck — paste your package.json, find CVEs, typosquatted names, and abandoned packages (no install, free)

**Body:**
```
Built DepCheck this year: paste a package.json, get back a risk report covering 
vulnerabilities (via OSV), typosquatted names, abandoned deps, risky licenses, loose 
version pins, and bloat. Runs entirely in the browser — only package names and 
versions go out, never your code.

The thing that fills a real gap vs. `npm audit`: typosquatting detection. npm audit 
catches published CVEs. It has no category for a package that exfiltrates your API 
keys at install time because a developer fat-fingered the package name. DepCheck 
flags names that are a character away from well-known packages so you can verify 
before you trust.

Three guides cover the most common follow-up needs once you find something flagged: 
CVE remediation, a full pre-deploy audit workflow, and a typosquatting explainer 
with a verification workflow.

https://labs.copperbaytech.com/depcheck/

Would appreciate feedback on the typosquatting heuristic — it's edit-distance only 
right now, which gets the common cases but misses creative look-alike attacks.
```

### Option B: Answer-where-asked one-liners

For threads about pre-launch security checklists, npm security, or "what do you check before you ship":
```
For the dependency side: DepCheck (https://labs.copperbaytech.com/depcheck/) — paste 
your package.json and it checks CVEs (via OSV), typosquatted names, abandoned deps, 
risky licenses, and loose version pins in your browser without installing anything. 
Complements `npm audit` since audit only catches published CVEs, not typosquats or 
abandoned packages.
```

For threads specifically about typosquatting or supply chain attacks:
```
npm audit doesn't catch typosquatting — those packages execute at install time, 
before a CVE ever gets filed. DepCheck [link] flags package names in your manifest 
that are a character away from popular packages. The guide on the site also has a 
five-step pre-install verification workflow (including `npm pack` for reading 
postinstall scripts before they run).
```

---

## 5. r/indiehackers

**Post title:**
> I built a dependency risk scanner that catches what npm audit misses — typosquatted packages, abandoned deps, risky licenses (free, browser-only)

**Body:**
```
I built DepCheck because my own pre-ship workflow had a hole in it.

`npm audit` is good at its job: it checks packages you've already installed against 
published CVEs. But it has a few blind spots that came up for me repeatedly:

**Typosquatting.** A typosquatted npm package — `crossenv` instead of `cross-env`, 
or `lodahs` instead of `lodash` — runs malicious code during `npm install` itself, 
before any CVE is filed and before your app ever runs. npm audit has no category for 
this. DepCheck flags dependency names that are a character away from well-known 
packages so you can double-check before you trust them.

**Abandoned packages.** An unmaintained package is an unpatched package — any future 
CVE goes unfixed because there's no one maintaining it. npm audit doesn't flag 
abandoned packages, only ones with active published advisories.

**License risk.** A GPL or AGPL license buried in a dependency can create legal 
obligations for commercial projects. npm audit doesn't check licenses.

DepCheck scans for all of those, plus loose version pins (^, *, "latest" that 
pull in unreviewed updates) and dependency bloat. Paste your `package.json`, get a 
report. Only package names and versions leave the browser — your source code stays 
local. No install, no signup.

If I were rebuilding it: the typosquatting heuristic is edit-distance only right now. 
That catches the classic one-character transpositions but misses numeral-for-letter 
substitutions (like `1` for `l`). A production version would need to sync with npm's 
own abuse-detection pipeline. I'd also cache the OSV dataset locally to make large 
manifests scan faster.

Three guides cover the post-scan workflow: fixing CVEs, running a full pre-deploy 
dependency audit, and a deep dive on how typosquatting attacks work with a 
verification checklist.

https://labs.copperbaytech.com/depcheck/

Happy to answer questions about the implementation — the typosquatting similarity 
detection is the most technically interesting part.
```

---

## 6. r/netsec — guide links only (no direct product post)

**Do NOT post the tool URL directly** — r/netsec moderators remove product promotion posts. The right move is to share the guides in relevant technical discussions.

**When someone posts about npm supply chain attacks, typosquatting, or dependency security:**
```
Good deep dive on how the npm typosquatting attack model actually works (postinstall 
scripts run at install time, before your code runs or a CVE gets filed):
https://labs.copperbaytech.com/depcheck/guides/npm-typosquatting-how-to-detect.html

Includes the `npm pack` approach for reading postinstall scripts before they execute, 
which most writeups skip.
```

**When someone posts a pre-deploy security checklist or "what do you check before shipping":**
```
Dependency hygiene writeup that covers the full audit workflow — CVE remediation, 
lockfile review, license risk, CI integration: 
https://labs.copperbaytech.com/depcheck/guides/audit-npm-packages-security.html
```

---

## AlternativeTo / SaaSHub

**List as a free alternative to:**
- Snyk (npm scanning)
- Socket.dev
- npm audit (built into Node)
- Dependabot (GitHub dependency alerts)

**Tags:** npm, dependency security, supply chain security, JavaScript, vulnerability scanning, typosquatting, open source

**AlternativeTo description:**
> Free browser-based npm dependency risk scanner. Paste a package.json and get a report covering known CVEs (via OSV), typosquatted package names, abandoned/unmaintained deps, risky licenses (GPL/AGPL), loose version pins, and dependency bloat. Only package names and versions are sent to public registries — source code never leaves the browser. No install, no signup.

---

## Timing notes

- **Show HN:** Tuesday or Wednesday, 9–11 AM ET. Stay in the thread for 2+ hours to answer technical questions — HN rewards engagement and the first-hour karma matters most.
- **Product Hunt:** Tuesday or Wednesday, 12:01 AM PT. Post Show HN first (ideally 1–2 days before PH) and reference any HN feedback in your PH first comment — it adds credibility.
- **r/SideProject:** Any weekday, 1–2 days after PH.
- **r/webdev Showoff Saturday:** Any Saturday. Check for a pinned "Showoff Saturday" megathread — comment there rather than making a standalone post if one exists.
- **r/indiehackers:** Any day after PH, especially after you have some upvotes or comments to reference.
- **r/netsec guide shares:** Best in direct response to relevant posts; don't create a thread just to share the guides.

---

## What to log back to metrics-ledger.md

After each post:
- Show HN: score at 2h, 6h, 24h; comment count; any "use in CI" requests
- Product Hunt: upvotes at 24h and 48h; comments; finish position
- r/SideProject: upvotes, comments, any DMs
- r/webdev: upvotes on the Showoff Saturday post or thread replies
- r/indiehackers: upvotes, replies, any "how does the typosquatting work" questions
- Inbound to the tool: track any spike in scan volume (if analytics are set up), Pro waitlist sign-ups after each post
