---
name: Lean Product Development
description: Strategy for delivering maximum value in minimum time (3-week deadline protocol).
version: 1.0.0
---

# Lean Product Development Skill

This skill enables the agent to prioritize ruthlessly and ship fast.

## 1. Core Principles (The 3-Week Rule)
- **Identify the Core:** What is the ONE feature that solves the user's problem? Build that first.
- **Pareto Principle (80/20):** 80% of value comes from 20% of features. Ignore the rest for V1.
- **"Good Enough" is Perfect:** Don't optimized code that might be deleted next week.
- **Ship > Polish:** It's better to be live and slightly buggy than perfect and local.

## 2. Decision Making Algorithm
When user asks for a feature:
1.  **Ask:** "Is this critical for the Day 1 launch?"
2.  **If YES:** Plan the simplest implementation (MVP).
3.  **If NO:** Add to "Icebox" / "Roadmap" and focus on critical path.

## 3. Shortcuts Allowed (Smart Debt)
- Using BaaS (Backend-as-a-Service) like Supabase/Firebase is preferred over custom backends.
- Using UI component libraries (Shadcn/UI) is mandatory vs building from scratch.
- Hardcoding config is fine for V1 if it saves 2 hours of plumbing.
