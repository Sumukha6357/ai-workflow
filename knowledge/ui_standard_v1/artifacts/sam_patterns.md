# SAM School UI Pattern Standards

This document defines the "SAM Baseline" for premium enterprise web applications. These patterns should be used as the target reference during `/premium-ux-audit` workflows.

## 1. Layout & Shell
### Glassmorphism Sections
Use semi-transparent backgrounds with high blur to create depth.
- **Background**: `rgba(255, 255, 255, 0.6)`
- **Blur**: `16px`
- **Border**: `1px solid rgba(255, 255, 255, 0.65)`

### Role-Based Dashboard
- **Grid**: `grid-template-columns: repeat(auto-fit, minmax(240px, 1fr))`
- **Cards**: Large emoji/icons (52px) with underlined titles (`text-underline-offset: 3px`).
- **Logic**: Sidebar/Dashboard cards must be filtered based on the `UserRole` enum.

## 2. Interaction & Feedback
### Premium Motion (Framer Motion)
Advanced animations that give an "app-like" feel:
- **FadeIn with Offset**: Use custom easing `[0.21, 0.47, 0.32, 0.98]` with a 20px Y-offset for content entrance.
- **Staggered Entry**: Lists and card grids MUST use `staggerChildren` (0.1s) to load items sequentially.
- **Tactile Feedback**: Interactive elements (buttons/links) should use Spring-based scaling (`whileHover: {scale: 1.02}`, `whileTap: {scale: 0.98}`).

### Intelligent Navigation
- **Dynamic ID Breadcrumbs**: Navigation paths MUST resolve UUIDs to human-readable names via API (e.g., `Invoices / INV-001` instead of `Invoices / uuid`).
- **Sidebar Context**: The sidebar should auto-collapse or highlight based on the deeply nested resolved path.

### Context-Preserving Forms
- **Expandable Create Panel**: For high-density data pages, implement an accordion-style creation panel directly above the table. This preserves filter/scroll context compared to navigation or modals.
- **Profile Dropdown**: Settings like "Change Password" should occur within the dropdown UI to maintain context.

## 3. Data Presentation
### Standardized Toolbars
- **Export Suite**:
  - **PDF**: Red theme (`#be123c`)
  - **Excel**: Green theme (`#2e7d32`)
  - **CSV**: Blue theme (`#1565c0`)
  - **Print**: Purple theme (`#7b1fa2`)
- **Search Bar**: 420px width with an absolute-positioned icon.

### Technical Table Specs
- **Header**: Sticky headers with `z-index: 1`.
- **Zebra Striping**: Even rows should use a very subtle blue tint (`#fcfdff`).
- **Cell Padding**: 10px 12px for high-density readable data.

## 4. Color Hierarchy
- **Primary**: `#fa486a` (Pink-Red)
- **Secondary**: `#1aa0dd` (Sky Blue)
- **Navy**: `#353f67` (Deep Corporate)
- **Border**: `#d8deea`

## 5. State Management & Soft Refresh
### The "No-Reload" Mandate
Premium UX requires that the user's scroll position, filters, and modal states remain intact after operations.
- **Pattern**: Use `useSWR` for data fetching and `mutate()` for updates.
- **Implementation**:
  - All `GET` requests should be wrapped in a `useSoftQuery` hook (15s default interval).
  - **Mutation**: After a `POST/PUT/DELETE`, call `mutate('/endpoint')` or `mutate((key) => key[0] === '/endpoint')` to trigger a background update.
- **Forbidden**: `window.location.reload()`, `router.refresh()`, or `router.push()` to the same page for data updates is considered a "Logic Blocker".

## 6. Session & Security Management
### Clean State Persistence
Enterprise applications must handle session volatility gracefully.
- **Dual-Storage Token Logic**: 
  - **Remember Me (True)**: Persistence in `localStorage`.
  - **Remember Me (False)**: Persistence in `sessionStorage` (cleared on tab close).
  - **The "Smart Token" Getter**: The API intercetor must check both storages to ensure the session is active regardless of persistence choice.
- **Silent Refresh Tokens**:
  - Implement 401 interceptors that attempt to call `/auth/refresh` before forcing a logout.
  - **Atomic Logout**: The `clearSession()` utility MUST clear both `localStorage` and `sessionStorage` to prevent "ghost sessions" from previous logins.
- **Loading State Integrity**: Use persistent `isLoading` flags during auth checks in `AppShell` to prevent "Login Flash" (briefly seeing login page before redirect).
