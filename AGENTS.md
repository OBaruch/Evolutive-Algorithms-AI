# AGENTS.md

Guidance for anyone, human or automated, who contributes to this repository.

## Hard Rules

1. **`src/` is read‑only.** The MATLAB scripts are the original 2021 implementation, kept for historical reasons. Don't edit, reformat, re‑encode, rename or "fix" them. That includes their CRLF line endings, their Spanish comments and their known mistakes.
2. Record code observations in [`docs/possible-improvements.md`](docs/possible-improvements.md). Never apply them to `src/`.
3. Don't add tooling the original project never had (CI, containers, test frameworks, linters, build systems) unless the owner explicitly asks for it.
4. Don't invent context. Label claims as **Confirmed**, **Inferred** or **Unknown**, as in [`docs/project-context.md`](docs/project-context.md).

## Before Changing Anything

Read the spec‑driven records for the repository:

- [`docs/sdlc/intent.md`](docs/sdlc/intent.md): why the repository is organized this way
- [`docs/sdlc/spec.md`](docs/sdlc/spec.md): requirements and acceptance criteria
- [`docs/sdlc/plan.md`](docs/sdlc/plan.md): how the current state was produced

## Verifying That the Original Code Is Untouched

```sh
git hash-object src/BusquedaDelMinimoAleatoria1Variable.m   # a6b0df8fbc25c6052170128d81c81b5dcc465afe
git hash-object src/BusquedaDelMinimoAleatoria2Variables.m  # 7dd718961fd3e099c024f8015b468d4c53171c6c
```
