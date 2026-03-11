# Agent Access Profiles

## 📂 Path Mapping (Templates)

| Path | Profile | Reasoning |
| :--- | :--- | :--- |
| `/src/main/resources/` | **🔴 PROTECTED** | Configs/Secrets. |
| `/src/main/java/**/security/` | **🟡 MANUAL** | Security logic. |
| `/infra/` | **🔴 PROTECTED** | Global infrastructure. |
| `/` | **🟡 MANUAL** | Root level files (pom.xml, package.json). |
