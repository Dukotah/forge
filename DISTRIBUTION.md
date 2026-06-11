# Copper Bay Labs — Distribution Playbook (read this each operator run)

**Current phase: LAUNCH (organic, $0 budget).** 11 tools + hub + cornerstone post are LIVE
at `labs.copperbaytech.com/<slug>/` (custom domain, indexed, Search Console verified, sitemap
accepted). Lead-capture CTAs are wired on all detectors → `contact@copperbaytech.com` (confirmed
receiving). The ONLY thing missing is traffic. Goal of every run: advance organic distribution
and queue human-only actions for the owner. Update `ops-log/metrics-ledger.md` every run.

## The 3-layer engine (do work in this priority order each run)
1. **SEO content (fully autonomous — do the most here).**
   - Expand the cornerstone post family: one new high-intent article per run (target queries in
     `marketing/suite-launch.md` §2, e.g. "did my ai leak my api key", "is my .env exposed",
     "vibe coding security checklist"). Each post: honest, links the relevant tool(s), proper
     canonical/og/sitemap entry, matches hub design (`hub/styles.css`). Deploy to the hub repo.
   - On-page SEO passes: tighten title tags / meta descriptions toward the target queries.
   - Internal linking: every new post links tools; tool pages link the checklist.
2. **Answer-where-asked (autonomous DRAFT, human POST).** Find live threads (r/webdev, r/SaaS,
   r/indiehackers, Cursor/Lovable/Bolt forums, Stack Overflow) where someone is *already* asking
   about leaked keys, exposed `.env`, ADA letters, dependency vulns. Draft a genuinely helpful,
   non-spammy answer that links the relevant tool only where it actually helps. Put drafts +
   thread URLs in the emailed handoff queue. NEVER auto-post (ban risk).
3. **Launch prep (autonomous PREP, human POST).** Keep `marketing/suite-launch.md` current
   (URLs already labs.copperbaytech.com). Prep platform-ready versions (Show HN, PH, X, LinkedIn)
   so the owner can paste. Queue them.

## Hard rules
- **Never auto-post to any social/forum platform.** Draft + queue for the owner only.
- **No fabricated metrics, users, testimonials, or reviews.** Honest-only.
- **Don't spend money.** Phase is $0/organic until the ledger's proof threshold is met.
- `ideas.json` is append-/update-only for shipped/greenlit/building (FORGE.md guardrail #8).

## Each run, email dukotah@gmail.com
- What was shipped this run (new posts/SEO changes, with live URLs)
- The metrics-ledger row you appended (impressions/clicks/leads/revenue + sources)
- **Handoff queue** — the exact human-only actions, copy-paste ready: thread URLs + draft answers,
  and which launch post to fire next.

## Proof gate
When the ledger shows the proof threshold met (≥1 closed job OR ≥3 genuine fix-quote leads),
flag it loudly in the email — that's the signal the owner will fund paid ads, and distribution
shifts from organic-only to paid + organic.
