# Enterprise UI/UX Enhancement Standards

This document defines the global baseline for premium enterprise web applications. These patterns are used during the `/ui-enhancements` workflow to transform basic interfaces into professional products.

## 1. Layout & Structural Shell
### The Master Table Skeleton
Mandatory 3-tier structure for all data-heavy pages:
- **Control Toolbar**: 420px search wrap, color-coded export suite (PDF/Excel/CSV/Print).
- **Zebra Data Core**: `sam-table-wrap` with sticky headers (`z-index: 1`) and subtle blue striping (`#fcfdff`).
- **structural Pager**: Record analytics ("Showing X-Y of Z") and density controls.

### Glassmorphism & Depth
- **Sections**: Semi-transparent backgrounds (`rgba(255, 255, 255, 0.6)`) with `16px` blur.
- **Micro-elevation**: Cards should lift `translateY(-3px)` on hover with `0.16s ease`.

## 2. Interactive Navigation
### Intelligent Breadcrumbs
- **ID Resolution**: Regex-based detection of UUIDs in paths, automatically resolving them to human-readable names (e.g., `Invoices / INV-2024-001`).

### Context-Preserving Forms
- **Expandable Panels**: Prefer accordion-style "Create" panels above tables over full-page navigation.
- **Inline Settings**: Dropdown-based forms for high-frequency user actions (e.g. Change Password).

## 3. Motion & Physics (Framer Motion)
- **Fluid Entrance**: Staggered sequential loading (`staggerChildren: 0.1s`) and Fade-In entrance with horizontal/vertical offsets.
- **Spring Feedback**: Tactile button responses using Spring physics (`stiffness: 400`, `damping: 17`).

## 4. State & Session Governance
### The "Soft Refresh" Mandate
- **Pattern**: Zero page reloads for CRUD. Use `useSWR` for fetching and `mutate()` for immediate UI updates.
- **Impact**: Preserves scroll position, filter state, and active modals.

### Secure Session Atomic Logic
- **Dual-Storage**: Logic-aware persistence (LocalStorage for "Remember Me", SessionStorage for regular).
- **Silent renewal**: 401 interceptors that attempt token refresh before force-logout.
- **Atomic Logout**: Cleanup of both storage layers to ensure session purity.

## 5. Design Tokens (Baseline)
- **Primary**: Corporate Pink-Red (`#fa486a`)
- **Secondary**: Sky Blue (`#1aa0dd`)
- **Navy**: Deep Corporate (`#353f67`)
- **Borders**: Soft Slate (`#d8deea`)
