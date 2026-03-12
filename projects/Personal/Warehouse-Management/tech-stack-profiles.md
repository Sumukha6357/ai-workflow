# 🛠️ Mandatory Tech Stack & Profiles: Warehouse-Management

## 🧩 Primary Stack
- **Runtime**: Java 17, Node 24
- **Frontend**: Next.js 16 (App Router), Tailwind 4
- **Backend**: Spring Boot 3.4.6 (LTS)
- **Database**: PostgreSQL 16 (Local/Docker)

## 🏗️ Infrastructure Constraints
- **Docker Required**: YES (Multi-stage builds)
- **Environment**: Containerized architecture exclusively.

## 🔒 Architectural Guardrails
- **Pattern**: Monorepo split (/api, /web, /infra).
- **Security**: JWT & Spring Security 6.x (RBAC).

## 🚦 Compliance Check
AI Agent is forbidden from proposing changes that bypass Docker (e.g., local `java -jar`) or use styling outside of Tailwind 4. Violations trigger an immediate **INFRA_LOCK**.
