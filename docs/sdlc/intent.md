# Intent

> Part of the spec‑driven records for this repository: **intent** → [spec](spec.md) → [plan](plan.md).
> These documents describe the *repository refactor*. They don't describe the original MATLAB project, which is documented in [../project-context.md](../project-context.md).

## Why

This repository holds a small piece of coursework from 2021: two MATLAB scripts that implement pure random search. As uploaded, it had no README, no description of the problem, a folder name with a space in it (`Evolutive Algorithms/`), and no explanation of the algorithm or its context. Someone visiting it today, such as a recruiter, a reviewer or the author years later, couldn't tell what it does without reading the code.

## Desired Outcome

Turn the repository into a **clear, navigable, portfolio‑ready historical record** of the original work, which:

- explains *what* the project does, *why* it existed and *how* it works;
- separates original material from documentation added later;
- labels every contextual claim as confirmed, inferred or unknown;
- keeps the original implementation exactly as written.

## Guiding Principle

**Modernize the repository, not the project.** Organization, documentation and presentation may follow current practice. The technical implementation stays as it was.

## Non‑Goals

- Fixing, optimizing, reformatting or translating the MATLAB code.
- Adding tooling that the original project never had: CI, containers, test frameworks, linters, package managers or build systems.
- Presenting the project as larger, newer or more sophisticated than it is.
- Inventing an institution, course name, assignment statement or results that the repository doesn't support.

## Stakeholders

- **Author / owner:** Baruch Lopez. Wants the work kept in a professional portfolio.
- **Readers:** people browsing the portfolio who need to understand the project in about two minutes.
- **Future contributors, human or automated:** need explicit guardrails so the original code isn't "improved" by accident (see [AGENTS.md](../../AGENTS.md)).
