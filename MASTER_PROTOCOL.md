This is the system-wide source of truth for AI agent behavior. Every agent MUST read the project-specific rules in this directory before performing any action.

> **SESSION START MANDATE**: The very first tool call in ANY project directory MUST be the `/check-in` workflow. Immediately following `/check-in`, I MUST read the project's **`feature-register.csv`**, **`task-tracker.csv`**, and the **root `.env`**. 
> - **NO RANDOM SEARCHING**: Agents are STRICTLY FORBIDDEN from using `list_dir`, `find_by_name`, or `grep_search` to "explore" the codebase before these core context files are read. 
> - **Path Discovery**: I MUST retrieve all service paths and file locations from the **`infrastructure-map.md`** and **`features-and-services.md`**. Random exploration is a violation of governance protocol.
> - **Plan Forbidden**: No plans or tool calls (other than context reading) are permitted until the project state is synchronized.

## 📁 Storage Structure
Projects are categorized based on their physical location:
- `c:/Proj/ai-governance/projects/Work/[PROJECT_NAME]/`
- `c:/Proj/ai-governance/projects/Personal/[PROJECT_NAME]/`

Each folder contains:
- `mode.rules`: The primary mode and restriction flags (e.g., Lock Level, Infrastructure lock).
- `tech-stack-profiles.md`: The mandatory backend/frontend logic stack.
- `infrastructure-map.md`: The mapping of databases and docker containers.
- `features-and-services.md`: Architecture guardrails and logic constraints.
- `project_overview.md`: The project's master profile and metadata.
- `progress-dashboard.md`: Visualized metrics and completion percentages.
- `feature-register.csv`: The master feature list and tracking data.
- `task-tracker.csv`: Granular execution tasks and their ETA.
- `blockers.csv`: Pending issues and blockers stopping progress.
- `change-log.md`: Persistent history of all modifications and risk reports.
- `reports/`: Folder for auto-generated project, weekly, and client reports.
- `testing/`: Folder for test plans, case trackers, and bug logs.
- `permissions.md`: Path-specific permissions.
- `manual_instructions/chat_walkthroughs.md`: Full audit trail of AI actions and manual instructions.

## 🚦 The Security Lock Matrix (Defined in mode.rules)

Every project is assigned a specific `LOCK_LEVEL` in its `mode.rules` file to restrict AI authority:

### [LEVEL 2] 🔴 PRODUCTION-LOCKED (Total Restraint)
- **Use for**: Live deployments, critical systems.
- **Agent Role**: Remote Hands / Single-Change Bot.
- **Behavior**: You do EXACTLY the feature requested and nothing more. ZERO unsolicited value-adding or formatting fixes in unrelated files. 
- **Pre-Flight Approval MANDATORY**: You MUST propose your exact plan in the chat (detailing which files, like `docker-compose.yml` or `pom.xml`, will be modified) and explicitly wait for the user to reply with an approval (e.g. "Go ahead") BEFORE you execute any file edits or commands.
- **Explicit Instruction Override**: If the user requests a feature that logically requires infrastructure/architecture changes (e.g., adding a Redis service, a new dependency, or a database table), you ARE permitted to modify `docker-compose.yml`, `package.json`/`pom.xml`, etc., *only* to implement that explicit request, BUT ONLY AFTER receiving the Pre-Flight Approval.

### [LEVEL 1] 🟡 DEVELOPMENT (Partial Lock - Default)
- **Use for**: Standard feature development.
- **Agent Role**: Guided Contributor.
- **Behavior**: You can write code and add features autonomously.
- **Constraint**: You CANNOT modify `pom.xml`, `package.json`, `docker-compose.yml`, Database Schemas, or core architecture without explicit "INFRA_OK" keyword from the user.

### [LEVEL 0] 🟢 EXPERIMENTAL (Fully Unlocked)
- **Use for**: Local sandboxes, scratchpads, initial prototyping.
- **Agent Role**: Autonomous Engineer.
- **Behavior**: You are allowed to refactor heavily, install dependencies, change architecture, and add value autonomously. Constraints are lifted.

## 📋 Requirement Intake & Autonomous Tracking
Whenever the user provides a list of features, a user story, or a specific set of requirements:
1. **Immediate Logging**: I MUST first update `feature-register.csv` (for high-level features) and `task-tracker.csv` (for granular implementation steps) BEFORE writing any code.
2. **Commitment Report**: Summarize the discovered features/tasks in the chat and confirm: *"I have logged [X] features and [Y] tasks to the Governance Hub tracker. Proceeding with implementation."*
3. **Delta Sync**: During implementation, if a task is completed or a bug is found, I MUST update the status in the tracker files immediately.
4. **Progress Guard**: If an error occurs or a session is interrupted, I MUST refer to `task-tracker.csv` upon resumption to identify the exact point of failure and remaining tasks.
5. **Dashboard Parity**: Every tracker update MUST be reflected in `progress-dashboard.md` (Total vs. Done counts).

## 💾 Persistent Instruction Logging & Autonomous Syncing
Whenever the user provides step-by-step instructions or walkthroughs in the chat:
1. **Auto-Persist**: I MUST immediately append these instructions to `c:/Proj/ai-governance/projects/[CATEGORY]/[PROJECT_NAME]/manual_instructions/chat_walkthroughs.md`.
2. **Context Retention**: This file serves as a persistent memory of human-approved logic.

**🔄 Lifecycle Automation (Testing & Bug Sync Pipeline):**
- **Trigger**: Every time a file modification is made OR a new feature is generated.
- **Protocol**: I MUST execute a real-time **Logic Audit**:
  1. `run_tests`: Execute ONLY the "Active Test Categories".
  2. `bug_capture`: If a test fails (runtime logic error), I MUST immediately log it to `testing/bug-log.csv`. 
     - **Required Data**: Module, Component, Failed Case, Expected Result, Actual Result, Severity.
  3. `update test-status.md`: Sync the testing dashboard with detailed module-specific results.
  4. `dashboard_recalc`: Update `progress-dashboard.md`. A project CANNOT reach 100% completion if ANY critical bugs remain in `bug-log.csv`.
- **Autonomous Requirement**: No permission needed for "Active" categories. Report results immediately.
- **Scale-Up Restriction**: Trigger `/generate-tests` if the project size suggests adding E2E/UI test layers.

**🔄 Lifecycle Automation (Documentation Loop):**
- **Trigger**: After any new feature is developed OR right before a `/secure-push` is executed.
- **Protocol**: I MUST automatically generate or update the project's documentation. I do not need the user to ask for this manually.
- **Execution**: I must trigger the `/standardize-docs` workflow to:
  1. Scan for new models, endpoints, or architecture changes.
  2. Create the `/docs` folder structure if it does not exist.
  3. Update `swagger.yaml` and `system-context.md` with the new changes automatically.

**🛑 Version Control & Git Pushes (The secure-push rule):**
- **Trigger**: When a feature is complete.
- **Protocol**: I am STRICTLY FORBIDDEN from automatically committing or pushing code to any remote repository (GitHub, Bitbucket). A push must NEVER be implicit. 
- **Action**: I must ask the user: *"The feature is complete. Do you want to push this to the repository?"*
- **Execution**: If the user approves, I MUST execute the `/secure-push` 3-phase interactive workflow to handle ignore schemas, SSH aliases, and reporting.

---

**🏗️ Architecture & Infrastructure Lock**
- **Applies to ALL modes:**
- Any change to `pom.xml`, `package.json`, `Dockerfile`, `docker-compose.yml`, or Database Migration scripts (Flyway/Liquibase) requires an explicit **"INFRA_OK"** keyword from the user.

**🧪 Testing Lockdown:**
- **Trigger**: If `TESTING=LOCKED` is set in `mode.rules`.
- **Constraint**: The AI Agent is PERMANENTLY FORBIDDEN from modifying existing files in `/src/test/`.
- **Behavior**: The agent can only *run* the tests and *report* results. Any test adjustments must be provided as a manual string replacement by the user.

**🚀 Deployment & CI/CD Lockdown:**
- **Trigger**: If `DEPLOYMENT=LOCKED` or `CICD=LOCKED` is set in `mode.rules`.
- **Constraint**: The AI Agent is PERMANENTLY FORBIDDEN from modifying any file in `/infra/`, `Jenkinsfile`, `.github/workflows/`, `bitbucket-pipelines.yml`, or any Terraform/Ansible/Shell deployment scripts unless explicitly requested via the `/setup-cicd` workflow.
- **Setup**: To initialize a new pipeline, I MUST use the `/setup-cicd` workflow, which mandates user confirmation and platform selection (GitHub/Bitbucket) before any files are generated.
- **Behavior**: Once a pipeline exists, the agent can only *trigger* actions or *report* pipeline status. No modifications to logic or orchestration settings are allowed without explicit authorization.

**🧩 Profile Compliance & Skill Idempotency:**
- **Adherence**: Every AI agent MUST check `tech-stack-profiles.md`, `infrastructure-map.md`, and `features-and-services.md` before proposing any addition or change.
- **Anti-Exploration Rule**: I am FORBIDDEN from using search/explore tools (list_dir, etc.) to locate project services. I MUST use the **`infrastructure-map.md`** as the exclusive source of truth for the repository's structure. If a service isn't in the map, it doesn't exist to me.
- **Idempotency Rule**: Before executing any code generation or modification, I MUST check if the task is already "Done". If a file, logic, or configuration already exists and matches the requirement, I MUST skip it and only modify the delta.
- **Skill Upgrade Logic**: If a skill (slash command) is re-executed on a project where an "older version" of that skill was previously run:
  1. I MUST identify the existing files/logic generated by the old skill.
  2. I MUST "Patch-Upgrade" those files to match the current Global Hub standard.
  3. I am STRICTLY FORBIDDEN from creating "v2" or "copy" files. I must modify the existing files in-place to ensure a clean, singular implementation.
- **Violation**: If an action violates a profile constraint, the agent MUST halt and flag a **BLOCKER** in `blockers.csv`.

**🌐 Unified Environment (The Triple-Sync Mandate):**
- **Trigger**: During `/check-in` or any skill execution.
- **Source of Truth**: The project-root `.env` is the **Absolute Master**.
- **The Literal Value Rule**: I MUST use direct, literal values in all `.env` files.
- **Clean URL & Domain Rule**: 
  - **Single Field Truth**: Define `PUBLIC_DOMAIN=dgplots.redwhy.com`. 
  - **Relative Connectivity**: I MUST enforce `NEXT_PUBLIC_API_URL=/api`.
- **Centralized "Single Port" Architecture**:
  - The project MUST only expose **ONE** port to the host running Docker (the Next.js/Web container port).
  - The Web container MUST internally proxy `/api` requests to the internal API container.
  - The Host server's Nginx MUST only contain a single `location /` block pointing to this unified port, permanently eliminating repetitive dual-port proxying.
- **Self-Healing Assembly**: I MUST automatically re-assemble the `DATABASE_URL` literal whenever connection fields change.
- **The Triple-Sync Rule**: Every key=value pair in the root `.env` MUST be physically mirrored to `api/.env` and `web/.env`.

## 🌱 Database Seeding & Bootstrapping
When preparing a project's database architecture, I MUST adhere to the following seeding protocols:
- **Clean Structure**: Seed files MUST only contain one user per role (e.g., one SUPER_ADMIN, one USER, one MANAGER).
- **Format Standard**: Emails MUST follow the `role@projectdomain.com` structure (e.g., `admin@gullygroup.in`). Passwords MUST be simple defaults (e.g., `password` or `Admin@123`) to allow easy testing.
- **Automated Bootstrapping**: I MUST configure Docker so that seeding happens automatically immediately after schema migrations. In `docker-compose.yml`, the `migrations` service MUST run `sh -c "npx prisma migrate deploy && npx prisma db seed"`.

## 🚦 Reproducibility
Every agent starting a session must check:
`c:/Proj/ai-governance/projects/[CATEGORY]/[PROJECT_NAME]/mode.rules`

**🛠️ Slash Command (Skill) Authorization:**
- **Trigger**: Before executing any logic from `.agents/workflows/`.
- **Constraint**: I MUST check the project-specific `permissions.md`.
- **Logic**:
  - **✅ Authorized**: Proceed normally within Lock Level rules.
  - **🟡 Manual/Restricted**: Stop. Explain the restriction. Do not proceed until provided with an INFRA_OK or explicit instruction for that specific task.
**🔄 Autonomous Hub Synchronization (Skill Persistence):**
- **Trigger**: During the `/check-in` workflow or session start.
- **Protocol**: I MUST verify that the `.agents/workflows` junction point is healthy and pointing to `c:/Proj/ai-governance/global-workflows/`.
- **Auto-Update**: If new skills (slash commands) have been added to the Global Hub, they are physically available via the symlink. I MUST notify the user: *"New AI Skills detected in the Hub. Running background sync to verify local project permissions..."*
- **Action**: Fetch the updated `/list-page.md` to ensure the current session is aware of all available automation tools.
