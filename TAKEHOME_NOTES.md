# Take-home notes

Answer briefly:

1. Decisions you made and why:
   I implemented the RemixService using a simple fallback sequence: full prefix + suffix → prefix only → minimal prefix → original text. This keeps the logic predictable, respects the 280‑character limit, and safely handles the boundary case by returning the original text when no prefix can fit.
   I updated the controller to delegate all transformation logic to the service, keeping responsibilities clean and consistent with the backend structure.
   On the frontend, I fixed the MAX_CHARACTERS issue so the UI correctly reflects the 280‑character constraint and aligns with the backend behaviour.

2. Tradeoffs to keep it small:

I avoided introducing a more complex strategy pattern or configuration layer to keep the solution easy to review and aligned with the scope of the assignment.
I kept frontend changes minimal and focused strictly on meeting the requirements rather than restructuring the UI or adding abstractions that weren’t necessary for the take‑home.

3. If you had more time, what would you improve next:

Add end‑to‑end tests to validate the full flow between the frontend and backend, especially around the 280‑character boundary.
Refactor the JSX into smaller reusable components and extract state/logic into a custom hook to improve readability and maintainability.
Expand the prefix/suffix sets or make them configurable.
In a real‑world scenario, I would also consider slightly reducing the frontend input limit to simplify UX around the 280‑character edge case.
