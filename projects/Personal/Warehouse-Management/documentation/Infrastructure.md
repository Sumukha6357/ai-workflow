# Infrastructure & Deployment

## 🐳 Dockerization
Each component is containerized for consistency across environments:
- **`api-service`**: Java 17 Alpine based image.
- **`web-client`**: Node 24 based image with production build optimization.
- **`db-ledger`**: PostgreSQL 16 image with persistent volume mapping.

## 🌐 Networking
- **Backend Internal**: Runs on port 8080.
- **Frontend External**: Runs on port 3000.
- **WebSocket Bridge**: Handshake occurs on port 8080/ws.

## 🛠️ Environment Profiles
1. **Local**: H2 database (optional) or local Dockerized Postgres.
2. **Dev**: Shared development environment with STOMP broker.
3. **Prod**: Optimized production builds with high-security JWT configuration.
