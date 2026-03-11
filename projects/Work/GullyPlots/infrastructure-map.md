# 🏗️ Infrastructure Map: GullyPlots

## 🗄️ Databases & Storage
- **Primary Database:** PostgreSQL 15 (Container: `gullyplots_db`)
- **Internal Port:** 5432
- **Host Exposure:** `${DB_PORT:-5432}`

## 🐳 Containerization & Orchestration
- **Runtime:** Docker Engine
- **Primary Entry (Single Port):** Web Service (Next.js) acting as Proxy
  - **Master Port (Source of Truth):** `${PORT:-8080}`
  - **Logic:** Traffic hits Next.js on port 3000 (exposed as `${PORT}`). 
  - **Proxy:** Next.js `rewrites` `/api/*` to internal service `http://api:3001`.
- **Service Paths:**
  - `api/`: NestJS Backend
  - `web/`: Next.js Frontend
  - `infra/gateway/`: Gateway Configuration

## 🚀 CI/CD & Cloud Hosting
- **Pipeline:** None (Available for `/setup-cicd`)
- **Hosting Provider:** Local-Only (Standardized)
