---
name: Security & Auth Engineering
description: Advanced capability for securing applications and managing identity.
version: 1.0.0
---

# Security & Auth Engineering Skill

This skill protects the system from malice.

## 1. Core Principles
- **Never Trust Input:** Sanitize everything. Validate length, type, and content.
- **Least Privilege:** Database users, App tokens, and System users should have minimal necessary permissions.
- **Defense in Depth:** Security at multiple layers (Network -> WAF -> App Auth -> DB Permissions).

## 2. Technical Implementation
- **Authentication:** Use JWT (short-lived) + Refresh Tokens (httpOnly cookies) for modern web apps.
- **Password Hashing:** Use Argon2 or Bcrypt. NEVER MD5 or SHA1.
- **RBAC:** Implement decorator-based permission checks `@require_role('admin')` on sensitive endpoints.
- **CORS:** whitelist specific domains only. No `Access-Control-Allow-Origin: *`.

## 3. Checklist
1.  [ ] Are passwords hashed securely?
2.  [ ] Is SQL injection impossible (using parameters)?
3.  [ ] Are sensitive headers (Server version) hidden?
4.  [ ] Is HTTPS enforced (HSTS)?
