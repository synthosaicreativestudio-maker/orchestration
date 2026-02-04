---
name: API Design Strategy
description: Standards for designing robust, secure, and developer-friendly APIs.
version: 1.0.0
---

# API Design Strategy Skill

This skill ensures frontend and backend talk the same language effectively.

## 1. Core Principles
- **Predictability:** Use standard HTTP codes (200 OK, 201 Created, 400 Bad Request, 401 Unauth, 403 Forbidden).
- **RESTful URLs:** Nouns, not verbs. `POST /users` (Create), `GET /users/123` (Read), not `POST /createUser`.
- **Versioning:** Always namespace APIs (`/api/v1/`). Never break backward compatibility without a new version.

## 2. Technical Standards
- **Pagination:** Never return "all" records. Implement `limit/offset` or cursor pagination.
- **Filtering/Sorting:** Use standard query params (`?sort=-created_at&status=active`).
- **Standard Error Format:** Return JSON errors `{ "error": "code", "message": "human text", "details": {} }`.

## 3. Checklist
1.  [ ] Are inputs validated strictly?
2.  [ ] Is Swagger/OpenAPI documentation auto-generated?
3.  [ ] Is rate limiting enabled for public endpoints?
