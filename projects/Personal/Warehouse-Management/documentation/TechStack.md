# Technology Stack

## 💻 Frontend (The "Control Tower")
- **Framework**: Next.js 16 (App Router)
- **Language**: TypeScript 5+
- **Styling**: Tailwind CSS 4 (Latest standard)
- **State/Data**: React Server Components + Client-side specialized hooks for real-time updates.

## ⚙️ Backend (The "Engine")
- **Framework**: Spring Boot 3.4.6 (Java 17)
- **Security**: Spring Security 6+ (OIDC/JWT & RBAC Integration)
- **Communication**: REST APIs (Primary) + WebSockets/STOMP (Real-time events).
- **Persistence**: Hibernate/JPA + PostgreSQL Dialect.

## 🗄️ Persistence & Cache
- **Database**: PostgreSQL 16
- **Real-time Broker**: STOMP over WebSocket (Internal Spring Broker).

## 🐳 Infrastructure
- **Containerization**: Docker (Multi-stage builds).
- **Orchestration**: Docker Compose (Local & Staging profiles).
- **Environment Management**: .env for frontend; Spring Profiles (local/dev/prod) for backend.
