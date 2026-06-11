# Dev.to cross-post — paste-ready (canonical points back to your domain for SEO)

> HOW TO POST: dev.to → Create Post → click the **⚙ settings / "..."** and set
> **Canonical URL** = https://labs.copperbaytech.com/checklist/  (this gives YOUR domain the
> SEO credit, not dev.to). Title + body below. Add tags: `webdev`, `security`, `ai`, `beginners`.

---

**Title:** The 5-Minute Pre-Launch Checklist for AI-Generated Apps

---

You shipped fast — often with an AI writing most of the code. Here are the six things that quietly get people, and how to check each one in about a minute. Every tool below runs entirely in your browser, so it's safe to paste real code and real secrets.

## Why AI-generated apps need a different checklist

AI coding tools optimize for *"works on my machine,"* not *"safe in public."* They'll happily hardcode an API key to make a demo run, leave a `.env` in a deployed folder, pull in a dependency that's three years abandoned, or skip the security headers a human would add out of habit. None of that breaks the build — so it ships.

The good news: the issues that actually cause pain are fast to check.

## 1. Did you leak a secret?

The most common AI mistake: an API key or token written directly into the code instead of an env var. Paste your code or `.env` and scan for exposed credentials before you commit.

→ **LeakCheck:** https://labs.copperbaytech.com/leakcheck/

## 2. Is your live site leaking files?

Even with clean code, your *deployed* site can expose a reachable `.env`/`.git` folder, secrets in your JS bundle, or source maps that hand over your original code.

→ **ExposureCheck:** https://labs.copperbaytech.com/exposurecheck/

## 3. Are your dependencies a liability?

AI tools love to `npm install` their way out of a problem. Paste your `package.json` to flag vulnerable, abandoned, typosquatted, or risky-license dependencies.

→ **DepCheck:** https://labs.copperbaytech.com/depcheck/

## 4. Are your security headers set?

Missing headers are the difference between an A and an F on most security scans — and a five-minute fix once you know which are missing.

→ **HardenCheck:** https://labs.copperbaytech.com/hardencheck/

## 5. Is it accessible and privacy-safe?

Accessibility (ADA/WCAG) and privacy gaps are the stuff of demand letters, and AI-generated front ends are full of them. Paste a URL for a plain-English risk report.

→ **ShipSafe:** https://labs.copperbaytech.com/shipsafe/

## 6. Do you have the legal basics?

Collecting any data — even an email signup — usually means you need a privacy policy and a consent banner. Generate a starting template.

→ **ComplyKit:** https://labs.copperbaytech.com/complykit/

---

A note on honesty: these are heuristic scanners — a fast first pass, not a full audit or legal advice. They'll have false positives and won't catch everything. Think of them as the gut-check a security-minded teammate would do before you ship.

Full checklist + tools: https://labs.copperbaytech.com/checklist/
