# 🤖 AI Governance Hub

A centralized control system for managing AI agents, workflows, and project governance across all personal and work projects.

## What This Does

This repository acts as the **single source of truth** for how AI agents operate across projects. It defines rules, workflows, templates, and protocols that ensure AI assistance is consistent, secure, and auditable.

## Structure

```
ai-governance/
├── MASTER_PROTOCOL.md       # Core rules and operating modes for all AI agents
├── global-workflows/        # Reusable slash-command workflows (push, lint, test, etc.)
├── _templates/              # Standardized project templates (docs, infra, testing, etc.)
├── projects/                # Per-project governance configs (Work & Personal)
│   ├── Work/
│   └── Personal/
└── .agents/                 # Agent workflow definitions
```

## Key Features

- **Global Workflows** — 19 reusable workflows like `/secure-push`, `/generate-tests`, `/lint-and-heal`, `/setup-cicd`, and more.
- **Project Templates** — Standardized templates for documentation, infrastructure, monitoring, and testing.
- **AI Modes** — Agents operate in `AUTO`, `MANUAL`, or `PROTECTED` mode depending on project sensitivity.
- **Audit Trail** — Every project maintains change logs, task trackers, and progress dashboards.

## How It's Used

Any AI agent working on a project under this governance system must:
1. Run `/check-in` to verify active rules before doing anything.
2. Follow the `mode.rules` defined per project.
3. Log all significant actions to the project's change log.

---

> Maintained by [@Sumukha6357](https://github.com/Sumukha6357)
