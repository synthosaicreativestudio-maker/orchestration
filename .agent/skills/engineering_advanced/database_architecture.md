---
name: Advanced Database Architecture
description: Expert capability for designing scalable, reliable, and performant data layers.
version: 1.0.0
---

# Advanced Database Architecture Skill

This skill ensures data integrity, performance, and scalability.

## 1. Core Principles
- **Normalization vs Performance:** Start normalized (3NF). Denormalize ONLY when performance benchmarks demand it.
- **Indexing Strategy:** Every foreign key and query filter MUST be indexed. Explain *why* an index is chosen (B-Tree vs Hash).
- **ACID Compliant:** Transactions are not optional for financial or critical state changes.
- **Migrations:** All DB changes must be versioned migrations (Alembic/Go-Migrate), never manual `ALTER TABLE` in prod.

## 2. Technical Implementation
- **ORM usage:** Use ORMs (SQLAlchemy/Prisma) for productivity, but drop to Raw SQL for complex aggregations.
- **Connection Pooling:** Always configure pool size and timeouts to prevent connection leaks.
- **N+1 Problem:** Aggressively detect and fix N+1 query issues using eager loading (`joinedload`).

## 3. Checklist
1.  [ ] Are indexes defined for search fields?
2.  [ ] Are unique constraints enforced at the DB level, not just app level?
3.  [ ] Is there a migration file for this change?
