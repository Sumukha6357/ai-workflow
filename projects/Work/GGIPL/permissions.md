# Agent Access Profiles: GGIPL

## 🛡️ Security Profiles

| Profile | Definition | Action |
| :--- | :--- | :--- |
| **🔴 PROTECTED** | Global Lockdown | **GLOBAL DEFAULT**. Agent is forbidden from modifying ANY content without a specific, manual instruction string. |
| **🛑 EMERGENCY** | Hard Stop | If any file contains `// AGENT: STOP`, the AI will disconnect from the repository immediately. |

## 📂 Path Mapping

| Path | Profile | Reasoning |
| :--- | :--- | :--- |
| `**/*` | **🔴 PROTECTED** | **MAXIMUM SECURITY LOCK**. No exceptions. |
| `c:/Proj/ai-governance/` | **🔴 PROTECTED** | Locked against AI self-modification. |

---

## 🚦 Operating Procedure: GGIPL LOCKDOWN
1. **NO AUTO-SYNC**: I will NOT autonomously update the `feature-register.csv` or `progress-dashboard.md` for this project. 
2. **NO AUTO-SCAN**: I will NOT scan the repository for tech stack or tests unless the exact command is given by the user.
3. **MANUAL-ONLY EXECUTION**: 
   - I wait for your EXACT "Target String" and "Replacement String."
   - I execute the change.
   - I log it in the `manual_instructions/chat_walkthroughs.md` ONLY after completion.
4. **NO PROPOSALS**: I am forbidden from proposing "better ways" or "bug fixes." If I see a security flaw, I can only report it—never touch it without a specific request.
