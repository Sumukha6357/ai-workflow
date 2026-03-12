---
description: Enterprise-grade UI/UX audit, Wireframe analysis, and Standardized Component injection.
---

# Premium UI/UX & Design System Audit (Phased Interactive Approach)

This workflow transforms basic UI into a premium, consistent enterprise experience by analyzing wireframes, standardizing layouts, and injecting modern design tokens.

## Phase 1: Visual & Wireframe Analysis
1. **Analyze Input**: If the user provides images or wireframes, I MUST:
   - Perform a clean breakdown of the layout, typography, colors, and spatial relationships.
   - **Report**: Describe exactly what is present in the visual (e.g., "Detected a Sidebar with 24px padding, Glassmorphism cards, and an Inter-font Header").
2. **Current Tech Scan**: Audit the existing `web/src/styles`, `tailwind.config`, and `components/` to see the current design "delta".
   - **Soft Refresh Check**: Replace hard refreshes (e.g., `router.refresh()`) with SWR logic.
   - **Session Integrity**: Verify that `localStorage` and `sessionStorage` are handled atomically and that 401s trigger a refresh attempt before logout.

## Phase 2: The "Premium" Enhancement Report
3. **Pillar Recommendations**: Provide a list of layout and design enhancements based on the **SAM Enterprise Standard**:
   - **Enterprise Table Skeleton**: Implement the 3-tier grid (Toolbar -> Wrap -> Pager) with sticky headers and zebra striping.
   - **Intelligent Navigation**: Implement **Dynamic ID Breadcrumbs** to resolve UUIDs into human-readable labels.
   - **Motion Physics**: Integrate Framer Motion for **Staggered Entry** and **Spring-based Tactile Feedback**.
   - **Contextual Form Panels**: Use **Expandable Create Panels** above tables to preserve list context.
   - **Secure Session Management**: Implement "Silent Token Renewal" and Atomic Logout patterns.
   - **Soft Refresh Implementation**: Use `useSWR` (SoftQuery) and `mutate()` for all CRUD operations.
   - **Glassmorphism Foundations**: Implement `.sam-section` patterns (16px blur, semi-transparent backgrounds).
   - **Micro-elevation**: Add `translateY(-3px)` hover effects for interactive cards.
   - **Functional Toolbars**: Integrate color-coded export suites (PDF, Excel, CSV) and search-active headers.
4. **Persistent Audit**: I MUST immediately create/update the `reports/ui-ux-report.md` file (using the master template).
   - This file MUST contain the "Visual Mastery Score" and the "Fidelity Analysis" comparing code to wireframes.
   - **Report**: Present the link to the `.md` file in the chat.

## Phase 3: Selection & Implementation Gate
5. **STOP**: This workflow is **READ-ONLY** by default.
6. **Task Selection**: User chooses the "Tier" to implement.
7. **Implementation & Sync**:
   - Create/Update `design-system.css`, `theme.ts`, etc.
   - **Sync Report**: Update `reports/ui-ux-report.md` with the new Sync % for each implemented module.

// turbo
8. Run `/verify-build` to ensure the new styles and libraries (like Framer Motion) don't break the build.
9. Run `/standardize-docs` to update the UI Pattern section in the docs.
