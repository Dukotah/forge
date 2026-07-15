# InvoiceQuick — Launch Kit

> **For the owner to post.** One-paste-ready copy for every channel below.
> Automated posting is against platform ToS — you fire these from your own accounts.
> No fabricated metrics, users, or testimonials — these are honest.
> Log what you posted and any results in `ops-log/metrics-ledger.md`.

**Tool URL:** https://labs.copperbaytech.com/invoicequick/  
**Guides:** https://labs.copperbaytech.com/invoicequick/guides/create-free-invoice-pdf.html  
**Audience:** freelancers, independent contractors, small-business owners, consultants — globally.  
**Core promise:** generate a clean PDF invoice in under 2 minutes, no signup, no watermark, nothing uploaded.

---

## Posting order (highest leverage first)

1. **Product Hunt** — the biggest discoverability moment; schedule for a Tuesday/Wednesday 12:01 AM PT
2. **r/SideProject** — builder community, welcoming of launches, no signup required to vote
3. **r/freelance** — InvoiceQuick's exact target audience; answer questions, don't just drop a link
4. **Show HN** — developer audience; good for a week or two after PH to hit a different crowd
5. **r/webdev** — more technical framing; valid during Showoff Saturday or in a relevant thread
6. **r/indiehackers** — founder narrative; works any day, community is supportive

---

## 1. Product Hunt

**Tagline:**
> Free invoice PDF generator — no signup, no watermark, runs in your browser

**Description:**
> InvoiceQuick makes a clean, professional PDF invoice in under 2 minutes — and nothing leaves your browser.
>
> **The problem it solves:** Every "free" invoice generator either (a) requires you to sign up before you can download anything, (b) slaps a watermark on your PDF, or (c) is actually a trial for a subscription. For someone who needs to send a one-off invoice, this is genuinely friction-heavy for something that should take 90 seconds.
>
> **What InvoiceQuick does differently:**
> - No signup, no account — open it, fill it in, download the PDF
> - No watermark — the PDF looks exactly like a real professional invoice
> - 100% client-side — your invoice data (client names, rates, amounts) never leaves this tab. No upload, no server, no database
> - 15 currencies formatted correctly for each locale (USD, EUR, GBP, CAD, AUD, NZD, JPY, INR, SGD, CHF, SEK, ZAR, BRL, MXN, AED)
> - Tax rate field with a configurable label — set it to VAT, GST, sales tax, or anything your jurisdiction uses
> - Save as .json and reload next month for recurring client invoices — just bump the invoice number and date
> - Your work autosaves in the browser between sessions so refreshing doesn't wipe your draft
>
> The PDF comes out via the browser's native print-to-PDF — no server-side renderer. That's the reason it can run entirely in the browser and stay free with no infrastructure.
>
> Two guides are live alongside the tool: one covering everything that needs to go on a professional invoice (numbering, VAT/GST, payment terms) and one on how to send it and follow up on late payments.
>
> Built by Copper Bay Labs. Completely free.

**Topics to select on PH:** Freelance Tools, Productivity, Finance, Business Tools

**First comment (post this immediately after it goes live — sets the tone for Q&A):**
> Happy to answer questions. A few that tend to come up:
>
> **Is a PDF invoice legally valid?** Yes — format doesn't determine validity, content does. A PDF with your details, client details, invoice number, dates, itemized amounts, and payment terms is as legally valid as one from Xero or QuickBooks. If you're VAT/GST registered, your jurisdiction may also require your registration number and the label "Tax Invoice."
>
> **What does "nothing uploaded" actually mean?** When you click "Download PDF," the browser opens its print dialog with just your invoice visible. You choose "Save as PDF" as the destination — the file writes directly to your computer. No data packet ever leaves your browser tab. You can verify this by watching your network tab in DevTools while generating an invoice.
>
> **Can I use this for recurring monthly invoices?** Yes. After generating an invoice, click the .json button to save your work. Next month, click Load .json, update the invoice number and dates, and download a fresh PDF in under a minute. The tool also autosaves to localStorage between sessions.
>
> **What about VAT?** There's a tax rate field with a configurable label — set it to VAT, GST, sales tax, or whatever applies. The guide explains which jurisdictions require it and at what registration thresholds: https://labs.copperbaytech.com/invoicequick/guides/create-free-invoice-pdf.html

---

## 2. r/SideProject

> Rule check: r/SideProject is explicitly for sharing what you built. Self-posts welcome.
> Best to post on weekdays (Tue–Thu) between 9–11 AM ET for visibility.

**Title:**
> I built a free invoice PDF generator that runs entirely in your browser — no signup, no watermark

**Body:**
> Hey r/SideProject — sharing something I built: **InvoiceQuick**
>
> https://labs.copperbaytech.com/invoicequick/
>
> The frustration that prompted it: every time I needed to quickly send an invoice, every "free" generator either made me create an account first or put their logo on my PDF. For a 90-second task, the signup friction is disproportionate — and you're trusting a random website with your client names, rates, and business details.
>
> So I built a version that runs 100% in the browser. Fill in your details, add line items, pick a currency, click Download PDF. Your invoice data never leaves your browser tab — no upload, no server. The PDF comes out via the browser's native print-to-PDF (you pick "Save as PDF" in the print dialog), which is how it stays fully client-side.
>
> A few details worth mentioning:
> - 15 currencies formatted correctly (right decimal places, symbol position)
> - Tax/discount fields with configurable labels (VAT, GST, sales tax — whatever your jurisdiction uses)
> - Save your invoice as a .json file; next month, load it back and just update the invoice number and date
> - Your work autosaves to localStorage between sessions
>
> Also wrote two guides alongside it: one on everything a professional invoice must include (VAT thresholds, invoice numbering, payment terms) and one on sending invoices and following up on late payments professionally. Both free.
>
> Built with vanilla JS — no framework. Happy to answer questions about how anything works.

---

## 3. r/freelance

> Rule check: r/freelance allows tool sharing that's relevant to freelancers, especially from builders.
> Don't make it an ad. Frame it as "built for myself, sharing in case it helps."
> Best as a standalone post, not buried in a thread — the audience here will have opinions.

**Title:**
> Built a free invoice PDF tool with no signup and no watermark — uses your browser's print-to-PDF so nothing is ever uploaded

**Body:**
> I kept using invoice generators that either required an account or added their branding to my invoice PDF. For something I might use once a quarter, creating another account felt excessive — and more importantly, I didn't love the idea of my client names, rates, and billing details sitting in a database somewhere I don't control.
>
> So I built InvoiceQuick: https://labs.copperbaytech.com/invoicequick/
>
> It runs entirely in the browser. You fill in your info, add line items, pick a currency (15 options), set a due date and payment terms, and download a clean PDF. No signup, no watermark. Your data stays in this tab — nothing gets uploaded to any server.
>
> The trick that makes this work without a backend: I use the browser's native print-to-PDF. When you click "Download PDF," the browser opens its own print dialog with just the invoice showing, and you pick "Save as PDF" as the destination. The file goes straight to your computer.
>
> A couple of features that took a bit of extra work:
> - **15 currencies** — USD, EUR, GBP, CAD, AUD, NZD, JPY, INR, SGD, CHF, SEK, ZAR, BRL, MXN, AED — each formatted correctly (right symbols, decimal conventions, etc.)
> - **Configurable tax label** — set it to VAT, GST, HST, or whatever applies to you. The guide covers which jurisdictions require it.
> - **.json save/load** — save your invoice as a JSON file after you're done; next billing cycle, load it back and just update the invoice number and date. Saves retyping client info.
> - **Autosave** — your work saves to localStorage so refreshing doesn't wipe your draft
>
> Two guides I wrote alongside it, in case useful:
> - What a professional invoice must include (numbering, VAT thresholds, payment terms): https://labs.copperbaytech.com/invoicequick/guides/create-free-invoice-pdf.html
> - How to send the invoice and the follow-up cadence for late payments: https://labs.copperbaytech.com/invoicequick/guides/send-invoice-email.html
>
> Happy to answer questions or take feedback.

---

## 4. Show HN

> Rule check: Show HN is for things you built. Works best on weekdays, 9–11 AM ET.
> Stay in the thread for the first 2 hours to respond to comments — velocity in the first hour matters most.
> HN readers appreciate technical honesty; lead with what's interesting about the implementation, not what's cool about the product.

**Title:**
> Show HN: InvoiceQuick – browser-only invoice PDF, no signup, nothing uploaded

**Body:**
> Built this to solve a friction I kept running into: needing to send a quick invoice and hitting a signup wall on every "free" invoice generator, or getting a watermarked PDF.
>
> InvoiceQuick runs 100% client-side. Fill in your details and line items in a form, pick a currency, and download a PDF via the browser's native print-to-PDF (no server-side renderer — that's the whole trick that keeps it offline-capable and free with zero infrastructure).
>
> The UX is: click Download PDF → browser opens print dialog with just the invoice showing → pick "Save as PDF" as destination. Your data never leaves the tab; you can verify that in DevTools.
>
> A few things I put work into:
> - 15 currencies formatted correctly for their locale (symbol position, decimal conventions)
> - Tax field with configurable label (VAT, GST, sales tax) — the guide covers jurisdiction thresholds
> - Save your invoice as .json; load it next month to re-bill the same client without retyping anything
> - Autosaves to localStorage between sessions
> - Live preview updates as you type
>
> Also wrote two guides: one on what a professional invoice must legally include (numbering, VAT, payment terms) and one on sending the invoice and following up on late payments. Both free.
>
> https://labs.copperbaytech.com/invoicequick/

**First comment (post immediately after the Show HN goes live):**
> Anticipated questions:
>
> **Is this legally valid?** Format doesn't determine validity — the content does. A PDF with your details, client's details, invoice number, date, itemized amounts, and payment terms is legally equivalent to one from Xero or FreshBooks. If you're VAT/GST registered, you'll also need your registration number and the "Tax Invoice" label in some jurisdictions.
>
> **Why browser print-to-PDF instead of jsPDF/Puppeteer?** Three reasons: (1) it's zero infrastructure — no server, no Lambda, no cost at any traffic level; (2) browser print produces correctly paginated output automatically; (3) no third-party PDF library means no dependency on a package that might start behaving unexpectedly.
>
> **Why not just use Wave/InvoiceNinja/etc.?** You can and should if you do a lot of billing. This is for the "I need to send exactly one invoice right now and I don't want to create an account" case. Also: you might not want your client list and rates in a third-party database.
>
> **What's the .json feature?** When you download a PDF, there's also a .json button that saves your invoice as a small local file. Load it back next billing cycle and just update the invoice number and date. Recurring clients become very fast.

---

## 5. r/webdev

> Rule check: r/webdev allows side-project showcase posts but has strict self-promo limits.
> Best posted in the weekly Showoff Saturday thread (pinned every Saturday) — freestanding promo posts
> outside that thread often get removed. Search for "Showoff Saturday" in the sub to find the active thread.
> Alternatively, find a live thread about invoicing tools, freelancing, or browser-side JS and reply there.

**For Showoff Saturday (short version):**
> **InvoiceQuick** — free browser-only invoice PDF generator
>
> https://labs.copperbaytech.com/invoicequick/
>
> The interesting implementation detail: PDF output goes via the browser's native print-to-PDF rather than a server renderer, which means zero infrastructure — runs fully static, nothing uploaded. Also built the .json save/load so freelancers can reload the same client info next month without retyping anything. Vanilla JS, no framework. Feedback welcome.

**Answer-where-asked version (adapt to the thread context):**
> If you need something simple without signup: https://labs.copperbaytech.com/invoicequick/ — runs in the browser, nothing uploaded, downloads a clean PDF via print-to-PDF. 15 currencies, tax field, .json reload for recurring clients.

---

## 6. r/indiehackers

> r/indiehackers is a community for founders and indie builders. Honest "what I built and why" posts
> are welcome. Don't frame it as a product pitch — frame it as a build story.

**Title:**
> Built a free, client-side invoice generator — no backend, no signup, no watermark

**Body:**
> Sharing something I shipped: InvoiceQuick (https://labs.copperbaytech.com/invoicequick/).
>
> The origin was a personal friction point: needing to quickly invoice a client, opening the first three results for "free invoice generator," and either hitting a paywall, a signup form, or getting a watermarked PDF. The tool I wanted didn't seem to exist — something with zero friction that produces a professional output without making me create an account.
>
> The interesting constraint I gave myself: 100% client-side. No server, no database, no user accounts. Your invoice data (client names, rates, business details) never leaves the browser tab.
>
> The implementation detail that makes this possible: PDF output via the browser's native print-to-PDF dialog. No jsPDF, no Puppeteer, no Lambda function. The user hits "Download PDF," the browser opens its print dialog with just the invoice visible, they pick "Save as PDF" as the destination, and the file goes straight to their machine. Zero infrastructure cost at any traffic level.
>
> Features I ended up adding that weren't in the original plan:
> - **15 currencies with correct locale formatting** — took longer than expected because formatting conventions differ (symbol position, decimal separators, no-decimal for JPY)
> - **.json save/load** — save your invoice as a local file; next billing cycle, load it back and just update the invoice number and date. Turns recurring clients into a 30-second job.
> - **LocalStorage autosave** — refreshing the page doesn't wipe your draft
> - **Tax label field** — configurable, so you can set VAT / GST / HST / sales tax depending on your jurisdiction
>
> Also wrote two guides alongside the tool covering what legally needs to go on a professional invoice and how to follow up on late payments. All free, no email gate.
>
> Stack: vanilla JS, no framework, static HTML/CSS, deploys on GitHub Pages.
>
> Happy to talk about what worked or didn't. Open to feedback on the tool itself.

---

## Additional channels (do after the main posts)

### AlternativeTo listing
List InvoiceQuick as a free alternative to:
- **Invoice Simple** — most searched freemium invoice app
- **Zoho Invoice** — popular small-business option
- **Wave Invoicing** — free tier competitor

Search "Invoice Simple" on AlternativeTo, click "Add as alternative," submit InvoiceQuick.
This creates a permanent, indexed backlink and captures "free alternative to Invoice Simple" search traffic.

### SaaSHub listing
Submit at saashub.com — free, fast approval, good backlink.
Category: "Invoicing & Billing" or "Finance"

### Answer threads on Reddit (ongoing, no spam gate)
These are comment replies in live threads — not promo posts, no domain filter.
- r/freelance threads: "how do you invoice clients", "best free invoice tool", "invoice without subscription"
- r/freelancers: same queries
- r/digitalnomad: "how do you handle invoicing"
- r/smallbusiness: "invoice templates", "how to invoice a client"

Search: `site:reddit.com "how do I invoice" OR "free invoice tool" OR "invoice without signing up"`

Adapt your reply to the specific thread — give a genuinely useful answer first, then mention the tool only if it's directly relevant to what they asked.
