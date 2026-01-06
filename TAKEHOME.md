# Distribution.ai — Junior Developer Take-Home (≤ 4 hours)

## Goal

Add a small “Remix” tool: take a draft social post and generate 4 alternative versions (no authentication, no database, no external APIs).

**Definition of “Remix” for this assignment:**
A remix is simply the original post with a different prefix and/or suffix added (e.g. a hook or call-to-action).
You are **not** expected to rewrite the text or mimic an AI model. Simple, deterministic transformations are expected and encouraged.

Example Prefixes: "Have you noticed?", "Quick tip:"
Example Suffixes: "Try this today.", "What do you think?"

Each variant must include the original text, be distinct from the other variants, and be **≤ 280 characters**.

---

## Technical Policies

### 🛠 Can't run the repo? (Fallback Option)

While we recommend using this starter repository to save time, **we care about your logic, not your environment configuration.** If you spend more than 30 minutes trying to get this specific repo running and fail:

-   Create a fresh Laravel repository from scratch.
-   Implement the "Remix" goal using the same requirements (Post request, validation, 4 variants).
-   Submit that repo instead. You will not be penalized.

### 🤖 AI Policy

You are **encouraged** to use AI tools (ChatGPT, Claude, Copilot, etc.) just as you would in a real job. However:

-   You must be able to **explain every line of code** you submit.
-   The "Attention to Detail" bug is designed to test if you are actually reading the code or just copy-pasting from an AI.
-   Use the `TAKEHOME_NOTES.md` to explain how AI helped you (or didn't).

---

## Where to focus

To complete this assignment, you will primarily need to edit:

1. `app/Http/Controllers/Api/RemixController.php` (Validation)
2. `app/Services/Remix/RemixService.php` (Logic)
3. `resources/js/Pages/Tools/Remix.jsx` (UI & Bugfixing)
4. `TAKEHOME_NOTES.md` (Rationale)

## What to build

### A) Backend: POST /api/remix

Implement the endpoint so it returns:

```json
{ "variants": ["...", "...", "...", "..."] }
```

**Rules**

-   Endpoint is public (no auth required)
-   Validate `{ text }`:
    -   required
    -   string
    -   min 20 characters
    -   max 280 characters
-   Return exactly 4 variants
-   Variants should not be trivial copies (don’t return the input 4 times)

### B) Frontend: Remix page

There’s a page stub at `/tools/remix`.

-   Textarea to write/paste the post
-   “Remix” button
-   Loading + error states
-   Display the 4 variants
-   Each variant has a “Copy” button

### C) Attention to detail bugfix

The starter branch includes a small bug/mismatch related to Remix. Find it and fix it.

### D) Show understanding

Add a short write-up (10–20 lines) in `TAKEHOME_NOTES.md` answering:

1. What decisions you made and why (structure, validation, UI state, etc.)
2. What tradeoffs you made to keep it small
3. What you’d improve next if you had more time

## Bonus (Optional): Deployment

If you’d like, deploy your solution so we can test it in a browser. This is optional and not required to pass.

-   Any free platform is fine (e.g., Railway, Render, Fly.io)
-   SQLite is acceptable if needed
-   Include the deployed URL in your submission notes

## Deliverables

-   **A link to your fork** with all your changes
-   `TAKEHOME_NOTES.md` completed
-   Tests passing: `php artisan test`

> [!IMPORTANT] > **Do NOT open a Pull Request.** Simply share the link to your fork once you are done.
