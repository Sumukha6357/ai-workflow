# System Architecture

## 📂 Monorepo Structure
The project uses a clean separation of concerns within a single repository:
- `/api/`: Spring Boot backend service.
- `/web/`: Next.js frontend application.
- `/infra/`: Docker and environment configuration.

## 🔄 Data Flows
1. **Command Flow**: Frontend -> REST Endpoint -> Spring Service -> PostgreSQL.
2. **Event Flow**: Backend Service -> WebSocket Topic -> Subscribed Frontend Clients.
3. **Security Flow**: Request -> Spring Security Filter (JWT/Session) -> Method Level Security (RBAC) -> Data Access.

## 🧱 Design Patterns
- **Service-Repository Pattern**: Clean abstraction of business logic from data access.
- **DTO (Data Transfer Object) Pattern**: Ensuring only necessary data is sent over the wire.
- **Event-Driven UI**: React components subscribing to live WebSocket streams for stock updates.
