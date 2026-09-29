# Project Context

This document rebuilds the origin and purpose of the project from the evidence in the repository. Each statement is labeled:

- **Confirmed**: backed directly by a file, the code or the Git history.
- **Inferred**: a reasonable conclusion from the available evidence, but not stated explicitly.
- **Unknown**: can't be determined from the repository.

## Classification

**Coursework / Assignment**, inferred with high confidence.

## Evidence Inventory

The original repository had exactly three files:

| File (original path) | Kind | Role |
|---|---|---|
| `LICENSE` | License text | MIT License, "Copyright (c) 2021 Baruch Lopez" |
| `Evolutive Algorithms/BusquedaDelMinimoAleatoria1Variable.m` | MATLAB script | Random search on a 1‑variable function |
| `Evolutive Algorithms/BusquedaDelMinimoAleatoria2Variables.m` | MATLAB script | Random search on a 2‑variable function |

There were no PDFs, Word documents, presentations, images, datasets, notebooks, generated outputs or configuration files. As a result, the original assignment statement is **not available**, and this context is based only on the code, the file and folder names, and the Git history.

Git history (confirmed):

| Commit | Date | Author | Message |
|---|---|---|---|
| `3361c83` | 2021‑02‑20 20:52 (UTC‑6) | Baruch Lopez | Initial commit (LICENSE) |
| `e328d93` | 2021‑02‑20 20:53 (UTC‑6) | Baruch Lopez | Add files via upload (both `.m` scripts) |

Both scripts were uploaded together through the GitHub web interface. Their CRLF line endings suggest they were written on Windows (inferred).

## Findings

| Topic | Status | Finding |
|---|---|---|
| Academic origin | Inferred | The two‑variable script opens with the header comment `%%Actividad 3` ("Activity 3") followed by the author's full name and a numeric identifier. That format is typical of how students label graded coursework. |
| Author | Confirmed | Omar Baruch Morón López (script header), published as "Baruch Lopez" (LICENSE and Git author). |
| Student identifier | Inferred | The 9‑digit number in the header looks like a student ID. The institution it belongs to isn't stated. |
| Institution | Unknown | Not stated anywhere. |
| Course name | Unknown | The folder name `Evolutive Algorithms` and the repository name `Evolutive-Algorithms-AI` suggest a course on evolutionary algorithms or computational intelligence (inferred). |
| Activity statement / requirements | Unknown | No assignment document is included. The intended task can only be inferred from the code: *find a function's minimum by random search, in one and in two variables*. |
| Date of development | Unknown (upload date confirmed) | The upload date is 2021‑02‑20. The development date isn't recorded. |
| Whether the 1‑variable script is part of "Actividad 3" | Inferred | Only the 2‑variable script has the header. The 1‑variable script was uploaded in the same commit, uses the same algorithm and the same variable names, and was most likely written for the same activity or as a warm‑up for it. |
| Language / platform | Confirmed | MATLAB (`.m` scripts; uses `meshgrid`, `surf`, `plot3`, anonymous functions). |

## Why Random Search in an "Evolutive Algorithms" Context

*This section is an interpretation (inferred), not a claim about the course syllabus.*

Pure random search is usually the first baseline taught before evolutionary and population‑based methods such as genetic algorithms, evolution strategies, differential evolution or PSO. It introduces the vocabulary those methods share:

- **search space / bounds** (`xl`, `xu`),
- **candidate solution** (`xi`),
- **fitness / objective evaluation** (`fval = f(xi)`),
- **elitism / best‑so‑far tracking** (`xbest`, `fbest`),
- **iteration budget** (1000 evaluations).

Later algorithms keep this loop but replace "sample blindly" with operators such as mutation, crossover and selection. A third activity in such a course being random search fits that progression, but this can't be confirmed.

## Documented Inconsistencies

These are recorded as found. They are **not** corrected in the source.

1. **Comment vs. code, 1‑variable script.** The comment on the objective function says *"Funcion de 2 variables que se le pretende buscar el minimo"* ("2‑variable function whose minimum we want to find"), but the function `f=@(x)(x-2).^2+(2*x-2).^2` takes a single variable. The comment was probably copied from the 2‑variable script (inferred).
2. **Plot range vs. search range.** In both scripts the plotted domain is narrower than the search domain: `[-4, 4]` vs. `[-5, 5]` in 1‑D, and `[-5, 5]^2` vs. `[-10, 10]^2` in 2‑D. The true minima lie inside the plotted domain, so this doesn't affect the visual result in practice.

## Scope

- **In scope of the original project:** two standalone scripts, hard‑coded objectives, visual output.
- **Not present:** functions or modules, parameter files, data I/O, tests, reports, recorded results.
