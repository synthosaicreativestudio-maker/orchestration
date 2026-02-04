---
name: Backend Patterns & Clean Architecture
description: Expert capability for structuring complex backend logic for maintainability.
version: 1.0.0
---

# Backend Patterns & Clean Architecture Skill

This skill prevents "Spaghetti Code" in growing projects.

## 1. Core Principles
- **Dependency Rule:** Inner layers (Entities) should not know about outer layers (Presenters, DB).
- **Separation of Concerns:** A file should do ONE thing. `routes.py` parses HTTP, `services.py` does logic, `models.py` defines data.
- **Interface Segregation:** Depend on abstractions (interfaces), not concrete classes for better testing context.

## 2. Common Patterns
- **Repository Pattern:** Abstract DB access. The service layer shouldn't know if it's Postgres or Redis.
- **Service Layer:** Place all business logic here. Controllers/Routes should just be "traffic cops".
- **DTOs (Data Transfer Objects):** Validate input data (Pydantic/Zod) at the gate before it touches logic.

## 3. Checklist
1.  [ ] Is business logic separated from HTTP transport code?
2.  [ ] Can I swap the database without rewriting business logic?
3.  [ ] Are circular dependencies avoided?
