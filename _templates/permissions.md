# 🛡️ Authorized Skills Index: [PROJECT_NAME]

Document which AI Slash Commands are authorized for this project.

## 🚦 Governance Profile: [Enterprise / Minimal / Custom / Production]

| Skill / Command | Authorized | Behavior |
| :--- | :---: | :--- |
| `/check-in` | ✅ | Always Allowed |
| `/init-project` | ✅ | Always Allowed |
| `/secure-push` | [✅/❌] | [Rule] |
| `/enforce-structure` | [✅/❌] | [Rule] |
| `/standardize-docker` | [✅/❌] | [Rule] |
| `/standardize-docs` | [✅/❌] | [Rule] |
| `/setup-monitoring` | [✅/❌] | [Rule] |
| `/setup-cicd` | [✅/❌] | [Rule] |
| `/verify-build` | [✅/❌] | [Rule] |
| `/generate-tests` | [✅/❌] | [Rule] |
| `/lint-and-heal` | [✅/❌] | [Rule] |
| `/project-status` | ✅ | Always Allowed |
| `/project-enhancements` | ✅ | Always Allowed (Read-Only) |
| `/logic-enhancements` | ✅ | Always Allowed (Read-Only) |
| `/premium-ux-audit` | ✅ | Always Allowed (Read-Only) |
| `/sync-hub` | [✅/❌] | [Rule] |

---

### 🏛️ Permission Rule Logic
- **✅ Authorized**: The agent can run this command anytime (if LOCK_LEVEL allows).
- **❌ Forbidden**: The agent is blocked from executing this logic. Call is rejected.
- **🟡 Manual Only**: The agent can only execute if the user provides the "INFRA_OK" or "WALKTHROUGH" key in the current session.
