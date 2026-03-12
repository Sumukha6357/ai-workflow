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
### Micro-Animations
- **Hover**: Interactive elements should lift slightly: `transform: translateY(-3px)`.
- **Transitions**: All hover states must have a smooth timing (e.g., `0.16s ease`).

### Profile Dropdown
- **Enhanced Profile**: Instead of a simple link list, use a detailed card with:
  - Avatar initials centered in a gradient circle.
  - Role/Email labels in uppercase 10px font.
  - **Inline Forms**: Settings like "Change Password" should occur within the dropdown UI to maintain context.

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
