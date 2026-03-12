# GullyPlots Architecture Report

1. **Triple-Sync**: .env is mirrored from root to api/web. This ensures a single source of truth for all literal values.
2. **Lifecycle**: The startup order is strictly managed (db -> migrations -> api -> web).
3. **Decoupling**: Build steps are separated from the 'up' command in the Makefile to allow for faster iteration and explicit caching control.
4. **Environment Awareness**: Scripts like `common-db-env.sh` allow the project to build connectivity strings dynamically from environment keys.
