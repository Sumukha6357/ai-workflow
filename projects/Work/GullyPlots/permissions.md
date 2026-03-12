# 🛡️ Authorized Skills Index: [PROJECT_NAME]

Document which AI Slash Commands are authorized for this project.

## 🚦 Governance Profile: 🧩 Custom

| Skill / Command | Authorized | Behavior |
| :--- | :---: | :--- |
| `/check-in` | ✅ | Always Allowed |
| `/init-project` | ✅ | Always Allowed |
| `/project-status` | ❌ | Restricted |
| `/project-enhancements` | ❌ | Restricted |
| `/logic-enhancements` | ❌ | Restricted |
| `/secure-push` | ❌ | Restricted |
| `/enforce-structure` | ❌ | Restricted |
| `/standardize-docker` | ❌ | Restricted |
| `/standardize-docs` | ❌ | Restricted |
| `/setup-monitoring` | ❌ | Restricted |
| `/setup-cicd` | ❌ | Restricted |
| `/verify-build` | ❌ | Restricted |
| `/generate-tests` | ❌ | Restricted |
| `/premium-ux-audit` | ❌ | Restricted |
| `/sync-hub` | ❌ | Restricted |
| `/lint-and-heal` | ❌ | Restricted |

---

### 🏛️ Permission Rule Logic
- **✅ Authorized**: The agent can run this command anytime (if LOCK_LEVEL allows).
- **❌ Forbidden**: The agent is blocked from executing this logic. Call is rejected.
- **🟡 Manual Only**: The agent can only execute if the user provides the "INFRA_OK" or "WALKTHROUGH" key in the current session.
