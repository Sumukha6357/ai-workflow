# Agent Access Profiles

This file defines the level of autonomy the AI agent has over specific parts of the workspace.

## 🛡️ Security Profiles

| Profile | Definition | Action |
| :--- | :--- | :--- |
| **🟢 AUTO** | Standard Access | Agent can refactor, fix bugs, and improve code autonomously. |
| **🟡 MANUAL** | Restricted Access | Agent MUST stop and ask for specific manual instructions or a walkthrough. |
| **🔴 PROTECTED** | Read-Only | Agent can read for context but is forbidden from modifying any content. |
| **🛑 EMERGENCY** | Hard Stop | If a file contains the keyword `// AGENT: STOP`, all work must cease immediately. |

## 📂 Path Mapping

| Path | Profile | Reasoning |
| :--- | :--- | :--- |
| `/Warehouse-Management/api/src/main/resources/` | **🔴 PROTECTED** | Contains sensitive application properties and secrets. |
| `/Warehouse-Management/api/src/main/java/com/example/warehouse/security/` | **🟡 MANUAL** | Security and Auth logic require manual human verification. |
| `/Warehouse-Management/web/` | **🟢 AUTO** | Frontend components and styling are safe for autonomous improvement. |
| `c:/Proj/ai-governance/` | **🔴 PROTECTED** | Agent cannot self-modify security protocols. |

---

## 🚦 Operating Procedure
1. Before any file modification, the Agent must cross-reference the file path with this table.
2. If the path falls under **🟡 MANUAL**, the Agent must look for a specific guide in `c:/Proj/ai-governance/projects/[CATEGORY]/[PROJECT_NAME]/manual_instructions/` or request one in the chat.
3. If the path falls under **🔴 PROTECTED**, the Agent must explain why a change is needed but never attempt the change itself.
