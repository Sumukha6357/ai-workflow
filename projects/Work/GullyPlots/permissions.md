# 🛡️ Authorized Skills Index: [PROJECT_NAME]

Document which AI Slash Commands are authorized for this project.

## 🚦 Governance Profile: 🏢 Enterprise

| Skill / Command | Authorized | Behavior |
| :--- | :---: | :--- |
| `/check-in` | ✅ | Always Allowed |
| `/init-project` | ✅ | Always Allowed |
| `/secure-push` | ✅ | Always Allowed |
| `/enforce-structure` | ✅ | Always Allowed |
| `/standardize-docker` | ✅ | Always Allowed |
| `/standardize-docs` | ✅ | Always Allowed |
| `/setup-monitoring` | ✅ | Always Allowed |
| `/setup-cicd` | ✅ | Always Allowed |
| `/verify-build` | ✅ | Always Allowed |
| `/generate-tests` | ✅ | Always Allowed |
| `/lint-and-heal` | ✅ | Always Allowed |
| `/project-status` | ✅ | Always Allowed |

---

### 🏛️ Permission Rule Logic
- **✅ Authorized**: The agent can run this command anytime (if LOCK_LEVEL allows).
- **❌ Forbidden**: The agent is blocked from executing this logic. Call is rejected.
- **🟡 Manual Only**: The agent can only execute if the user provides the "INFRA_OK" or "WALKTHROUGH" key in the current session.
