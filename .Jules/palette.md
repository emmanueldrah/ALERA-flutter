## 2026-05-10 - [Accessibility in Healthcare Dashboard]
**Learning:** In Flutter Web, the canvaskit renderer can sometimes block traditional screen reader interactions if Semantics are not explicitly defined. Using `Semantics` and `Tooltip` on key action elements like the FloatingActionButton and Chat Tiles is critical for WCAG compliance in healthcare apps.
**Action:** Always wrap icon-only interactive elements in `Semantics` with a descriptive `label` and ensure `Tooltip` provides visual parity.

## 2026-05-10 - [Smooth Navigation Transitions]
**Learning:** Switching between heavily populated tabs (like Dashboard and Appointments) can feel jarring. Using `AnimatedSwitcher` with a short duration (300ms) significantly improves the perceived performance and "feel" of the app without adding heavy dependencies.
**Action:** Apply `AnimatedSwitcher` to root navigation bodies in mobile-first Flutter projects to smooth out UI transitions.
