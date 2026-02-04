---
name: Cloud Native & DevOps
description: Capability to package, deploy, and monitor applications in production environments.
version: 1.0.0
---

# Cloud Native & DevOps Skill

This skill bridges the gap between code and production.

## 1. Core Principles
- **Infrastructure as Code (IaC):** Server config should be committed code (Dockerfiles, Compose, Terraform), not manual shell commands.
- **Immutable Infrastructure:** Do not patch running servers. Rebuild and redeploy containers.
- **12-Factor App:** Config in ENV variables, logs to stdout, stateless processes.

## 2. Technical Standards
- **Docker:** Multi-stage builds for small images (~100MB max for Go/Node, ~200MB for Python).
- **CI/CD:** Tests and linters must pass before merge. Auto-deploy to Staging.
- **Reverse Proxy:** Nginx/Caddy must sit in front of apps for SSL termination, compression (Gzip/Brotli), and static caching.

## 3. Checklist
1.  [ ] Does Dockerfile use a non-root user?
2.  [ ] Are secrets defined in `.env` (and gitignored)?
3.  [ ] Is a healthcheck endpoint (`/healthz`) exposed?
