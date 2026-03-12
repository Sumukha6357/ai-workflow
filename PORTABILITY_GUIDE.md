# 🌐 Antigravity Portability Guide
How to replicate this Governance & Knowledge system on a new machine.

## Phase 1: File Transfer
1. Copy the entire `C:\Proj\ai-governance` directory.
2. Copy `C:\Proj\ai-governance\link-governance.ps1`.

## Phase 2: AI Configuration
Open Antigravity Settings > **Rules** and paste the following:

```markdown
# 🛡️ Global AI Governance & Knowledge Protocol
1. **Governance Hub**: Your source of truth is `C:\Proj\ai-governance\`.
2. **KIs & Knowledge**: Read the Knowledge Hub at `C:\Proj\ai-governance\knowledge` before starting tasks.
3. **Session Start**: The first tool call in any project MUST be the `/check-in` workflow.
4. **Project Awareness**: Detect Category (Work/Personal) and locate metadata in the Hub.
5. **Lock Levels**: Observe `mode.rules` [LEVEL 0, 1, or 2].
```

## Phase 3: Activation
1. Create an alias in your PowerShell Profile. To open your profile, run:
   `notepad $PROFILE`
   *(If the file doesn't exist, say 'Yes' to create it)*.
2. Paste the following into the profile:
   `function link-hub { powershell -ExecutionPolicy Bypass -File 'C:\Proj\ai-governance\link-governance.ps1' }`
3. Run `link-hub` in any project directory to bond it to the Hub.
4. Refresh the Antigravity Workflows UI.

---
*System maintained by Antigravity Governance Protocol.*
