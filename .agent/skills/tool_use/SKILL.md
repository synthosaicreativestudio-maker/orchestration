---
name: Tool Use
description: Expertise in selecting and executing the right tools for the job.
version: 1.0.0
---

# Tool Use


## Core Skills
8.  **Contextual Tool Selection:** Know when to search vs. read file vs. run command.
9.  **Query Formulation:** Create precise search queries and grep patterns.
10. **Output Parsing:** Extract meaning from logs, HTML, and JSON.
11. **API Schema Understanding:** Read docs to form valid requests.
12. **Error Recovery:** Retry with corrected parameters on failure.
13. **Multi-Step Tool Chaining:** Combine tools (Search -> Read -> Write).
14. **Sandboxed Execution:** Handle destructive commands (`rm`, `drop`) with extreme caution.

## Instructions
- If a tool fails, analyze the stderr before retrying.
- Use `grep` or `find` before reading huge files.
- Verify tool output matches expectations.

