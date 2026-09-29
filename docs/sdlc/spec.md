# Specification

> Spec‑driven records: [intent](intent.md) → **spec** → [plan](plan.md).
> This spec defines what the *reorganized repository* must satisfy. It was written from the repository as it existed, not from new product requirements.

## 1. Baseline (as found)

| Path | Type | Git blob hash |
|---|---|---|
| `LICENSE` | MIT License, © 2021 Baruch Lopez | unchanged |
| `Evolutive Algorithms/BusquedaDelMinimoAleatoria1Variable.m` | MATLAB script, CRLF | `a6b0df8fbc25c6052170128d81c81b5dcc465afe` |
| `Evolutive Algorithms/BusquedaDelMinimoAleatoria2Variables.m` | MATLAB script, CRLF | `7dd718961fd3e099c024f8015b468d4c53171c6c` |

No PDFs, Word documents, images, data, outputs or notebooks exist.

## 2. Functional Behavior of the Original Code (documented, not changed)

| ID | Behavior | Source |
|---|---|---|
| B‑1 | Minimizes `f(x) = (x-2)^2 + (2x-2)^2` by sampling 1,000 uniform points in `[-5, 5]`. | `BusquedaDelMinimoAleatoria1Variable.m` |
| B‑2 | Plots `f` over `-4:0.1:4` and marks the best point with a red `*`. | same |
| B‑3 | Minimizes `f(x,y) = (x-2)^2 + (y-2)^2` by sampling 1,000 uniform points in `[-10, 10]^2`. | `BusquedaDelMinimoAleatoria2Variables.m` |
| B‑4 | Plots the surface over `meshgrid(-5:0.5:5)` and marks the best point with a white `*`. | same |
| B‑5 | Leaves the result in the workspace variables `xbest`, `fbest`. It isn't printed. | both |
| B‑6 | Doesn't set a random seed, so the output isn't deterministic. | both |

## 3. Requirements for the Reorganized Repository

### Preservation (must)

| ID | Requirement | Verification |
|---|---|---|
| P‑1 | Every original `.m` file keeps byte‑identical content, including CRLF line endings, comments and existing mistakes. | `git hash-object src/*.m` equals the baseline hashes in §1. |
| P‑2 | Original file names are kept. | File names in `src/` match §1. |
| P‑3 | Files are moved with `git mv` so their history can be followed. | `git log --follow src/<file>` shows commit `e328d93`. |
| P‑4 | `LICENSE` is unchanged. | `git diff main -- LICENSE` is empty. |
| P‑5 | No original file is deleted. | Three files in the baseline, three in the result. |

### Structure (must)

| ID | Requirement |
|---|---|
| S‑1 | Source code lives in `src/`. Documentation lives in `docs/`. |
| S‑2 | No folders without content. `data/`, `assets/`, `docs/original/` and `archive/` aren't created, because the repository has no such material. |
| S‑3 | Path names contain no spaces. |
| S‑4 | A minimal MATLAB‑oriented `.gitignore` is present. No other tooling is added. |

### Documentation (must)

| ID | Requirement |
|---|---|
| D‑1 | `README.md` covers overview, context, problem, objective, structure, original‑implementation notice, technologies, how it works, inputs/outputs, how to run, documentation links and historical note. |
| D‑2 | `docs/project-context.md` classifies the project and labels each finding as Confirmed / Inferred / Unknown. |
| D‑3 | `docs/code-overview.md` explains each script, the shared algorithm and the analytical minima. |
| D‑4 | `docs/possible-improvements.md` lists observations and states clearly that none were applied. |
| D‑5 | Contradictions found in the sources are documented, not resolved in code. |
| D‑6 | All cross‑links are relative and resolve. |
| D‑7 | All new documentation is in English. The original Spanish identifiers and comments are quoted as they are, with translations. |
| D‑8 | Run instructions don't claim anything that wasn't verified. Any statement that the code wasn't executed is made explicitly. |

### Agentic Guardrails (must)

| ID | Requirement |
|---|---|
| G‑1 | `AGENTS.md` at the root states that `src/` is read‑only and points to these SDLC documents. |

## 4. Acceptance Criteria

The refactor is accepted when every P‑, S‑, D‑ and G‑ requirement holds and `git diff --stat main` shows **no content change** (only renames at 100% similarity) for the `.m` files.
