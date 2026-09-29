# Evolutive Algorithms — Random Search for Function Minimization

Two small MATLAB scripts that find the minimum of a mathematical function by **pure random search**. The scripts draw 1,000 random candidates inside a bounded search space, keep the best one, and plot it on the function's graph. The one‑variable script plots a curve and the two‑variable script plots a 3‑D surface.

> **Original implementation.** This repository keeps the original implementation of the project. The source code has deliberately not been refactored or modernized, so it keeps its historical context and the original way it was written. The source code is the original implementation I wrote during my studies.

---

## Project Context

| Item | Status | Details |
|---|---|---|
| Project type | **Coursework / Assignment** (inferred with high confidence) | The header of `BusquedaDelMinimoAleatoria2Variables.m` reads *"Actividad 3"* ("Activity 3"), followed by the author's full name and what appears to be a student ID. |
| Subject area | Inferred | The original folder name (`Evolutive Algorithms`) and the repository name (`Evolutive-Algorithms-AI`) point to a course on evolutionary algorithms or computational intelligence. |
| Institution / course name | Unknown | The repository doesn't say. |
| Date | Confirmed (upload date only) | The files were uploaded to GitHub on 2021‑02‑20. The date they were written isn't recorded. |
| Author | Confirmed | Baruch Lopez (Omar Baruch Morón López). |
| Language of the code | Confirmed | MATLAB, with comments and identifiers in Spanish. |

See [docs/project-context.md](docs/project-context.md) for the full evidence, with each item marked as confirmed, inferred or unknown.

## Problem Statement

Find the minimizer of a continuous objective function without using gradients or any analytical information. The only tool is to evaluate the function at randomly sampled points.

## Objective

Implement the simplest stochastic optimizer, uniform random search, and show that it works:

1. on a one‑variable function, `f(x) = (x-2)^2 + (2x-2)^2`, searched over `[-5, 5]`;
2. on a two‑variable function, `f(x,y) = (x-2)^2 + (y-2)^2`, searched over `[-10, 10] x [-10, 10]`.

Each script also plots its best solution on the function's graph as a visual check.

## Repository Structure

```
.
├── README.md                  ← you are here
├── AGENTS.md                  ← rules for automated contributors (source is read-only)
├── LICENSE                    ← MIT (original, 2021)
├── .gitignore
├── src/                       ← ORIGINAL MATLAB source, unmodified
│   ├── BusquedaDelMinimoAleatoria1Variable.m
│   └── BusquedaDelMinimoAleatoria2Variables.m
└── docs/
    ├── project-context.md     ← origin, evidence, confirmed / inferred / unknown
    ├── code-overview.md       ← line-by-line explanation of each script
    ├── possible-improvements.md ← observations only, NOT applied
    └── sdlc/
        ├── intent.md          ← why this repository refactor exists
        ├── spec.md            ← what the refactored repository must satisfy
        └── plan.md            ← how the refactor was carried out
```

Until this reorganization, the two scripts sat in a folder called `Evolutive Algorithms/`. They were moved to `src/` with `git mv`, so their contents are byte‑for‑byte identical and their Git history is intact.

## How It Works

Both scripts follow the same algorithm (pure random search):

```
fbest ← +∞
repeat 1000 times:
    xi   ← uniform random point in [xl, xu]
    fval ← f(xi)
    if fval < fbest:
        xbest ← xi
        fbest ← fval
plot f over a grid, then mark (xbest, fbest)
```

| Script | Objective | Search bounds | Plot grid | Known true minimum |
|---|---|---|---|---|
| `BusquedaDelMinimoAleatoria1Variable.m` | `(x-2)^2 + (2x-2)^2` | `[-5, 5]` | `-4:0.1:4` | `x = 1.2`, `f = 0.8` |
| `BusquedaDelMinimoAleatoria2Variables.m` | `(x-2)^2 + (y-2)^2` | `[-10, 10]^2` | `meshgrid(-5:0.5:5)` | `(x, y) = (2, 2)`, `f = 0` |

I worked out the true minima by hand for this documentation. The original code doesn't state them. See [docs/code-overview.md](docs/code-overview.md) for the derivation and a detailed walkthrough.

## Inputs and Outputs

- **Inputs:** none. The objective function, the bounds and the iteration count are hard‑coded in each script.
- **Outputs:** a MATLAB figure. The scripts don't print the best solution explicitly. It is left in the workspace variables `xbest` and `fbest`. No data files are read or written.

## Technologies

- **MATLAB.** The scripts use only base language features: anonymous functions (`@`), `rand`, `meshgrid`, `plot`, `plot3`, `surf` and `hold`. No toolboxes are needed.
- The repository doesn't record which MATLAB version was used.

## Running the Project

The scripts are plain MATLAB scripts. They are not functions and take no arguments. In MATLAB, from the repository root:

```matlab
cd src
BusquedaDelMinimoAleatoria1Variable      % one-variable version
BusquedaDelMinimoAleatoria2Variables     % two-variable version
```

Notes:
- `BusquedaDelMinimoAleatoria1Variable.m` starts with `clc`, `clear` and `cla`, so it wipes the current workspace and axes.
- `BusquedaDelMinimoAleatoria2Variables.m` doesn't clear anything and calls `hold on`, so run it in a fresh figure to avoid overlaying earlier plots.
- The scripts don't set a random seed, so every run gives a slightly different result.
- The scripts look compatible with GNU Octave because they use only core functions, but this hasn't been tested. None of the scripts were executed while preparing this documentation, because no MATLAB/Octave runtime was available.

## Documentation

- [Project context](docs/project-context.md)
- [Code overview](docs/code-overview.md)
- [Possible improvements (not applied)](docs/possible-improvements.md)
- Repository refactor records: [intent](docs/sdlc/intent.md) · [spec](docs/sdlc/spec.md) · [plan](docs/sdlc/plan.md)

## Historical Note

This repository was later reorganized and documented to make it easier to read and to preserve the historical context of the original project. The original source code is unchanged. Only its location moved, from `Evolutive Algorithms/` to `src/`. The added documentation describes the original work and doesn't rewrite it.

## License

[MIT](LICENSE) © 2021 Baruch Lopez
