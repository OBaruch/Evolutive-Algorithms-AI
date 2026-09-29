# Code Overview

This is a walkthrough of the two original MATLAB scripts in [`src/`](../src). The scripts are documented here **as written**, and nothing in them has been changed.

Both scripts are self‑contained: neither calls the other, and neither uses external data.

---

## 1. `BusquedaDelMinimoAleatoria1Variable.m`

*"Random search for the minimum, 1 variable"*

### Responsibility

Approximates the minimizer of a one‑variable quadratic function by evaluating 1,000 uniformly random points in `[-5, 5]`, then plots the function with the best point found.

### Walkthrough

| Line(s) | Code | Purpose |
|---|---|---|
| 1–3 | `clc`, `clear`, `cla` | Clear the command window, the workspace variables and the current axes. |
| 4 | `f=@(x)(x-2).^2+(2*x-2).^2;` | Objective function (anonymous, element‑wise). |
| 5–6 | `x=-4:0.1:4; y=f(x);` | Grid used only for plotting the curve. |
| 7–8 | `xl=-5; xu=5;` | Lower and upper bounds of the search space. |
| 9–10 | `fbest=inf; xbest=0;` | Best‑so‑far value and position. |
| 12–20 | `for i=1:1000 … end` | Main loop: sample `xi = xl + (xu-xl)*rand(1)`, evaluate it, keep it if it improves `fbest`. |
| 22–24 | `hold on; plot(x,y); plot(xbest,fbest,'r*')` | Draw the curve and mark the best point with a red asterisk. |

### Analytical reference (added for documentation)

```
f(x)  = (x-2)^2 + (2x-2)^2 = 5x^2 - 12x + 8
f'(x) = 10x - 12 = 0  ⇒  x* = 1.2
f(x*) = 0.8
```

Since `f(x) - 0.8 = 5(x - 1.2)^2`, the error of the random search in objective value is five times the squared distance to `x*`.

---

## 2. `BusquedaDelMinimoAleatoria2Variables.m`

*"Random search for the minimum, 2 variables"*, labeled **Actividad 3** in its header.

### Responsibility

Same algorithm extended to two dimensions: 1,000 random points in `[-10, 10] x [-10, 10]`, followed by a surface plot with the best point marked.

### Walkthrough

| Line(s) | Code | Purpose |
|---|---|---|
| 1–2 | `%%` / `%%Actividad 3 …` | Cell marker and header with activity number, author name and ID. |
| 4 | `f=@(x,y)(x-2).^2+(y-2).^2;` | Objective function of two variables. |
| 5–6 | `[x,y]=meshgrid(-5:0.5:5); z=f(x,y);` | Grid used only for plotting the surface. |
| 7–8 | `xl=[-10;-10]; xu=[10;10];` | Bounds as column vectors, one row per dimension. |
| 9–10 | `fbest=inf; xbest=[0;0];` | Best‑so‑far value and position. |
| 12–22 | `for i=1:1000 … end` | Sample `xi = xl + (xu-xl).*rand(2,1)` (element‑wise, so each coordinate is scaled to its own bounds), evaluate `f(xi(1),xi(2))`, keep the improvement. |
| 24–26 | `hold on; surf(x,y,z); plot3(xbest(1),xbest(2),fbest,'w*','LineWidth',10)` | Draw the surface and mark the best point with a thick white asterisk. |

### Analytical reference (added for documentation)

`f(x,y) = (x-2)^2 + (y-2)^2` is a paraboloid with its minimum at `(2, 2)`, where `f = 0`. Here `f` is exactly the squared Euclidean distance from `(2, 2)`.

---

## Shared Algorithm: Pure Random Search

```
Input : objective f, bounds [xl, xu], budget N = 1000
fbest ← +∞
for i = 1..N
    xi   ← xl + (xu − xl) ⊙ U(0,1)
    fval ← f(xi)
    if fval < fbest then (xbest, fbest) ← (xi, fval)
Output: xbest, fbest   (left in the MATLAB workspace and plotted)
```

Properties:

- **Gradient‑free.** The algorithm only needs function evaluations.
- **Memory‑less sampling.** Each candidate is independent of the previous ones. Only the best one is remembered, which acts as a simple form of elitism.
- **Fixed budget.** It always runs 1,000 evaluations, with no convergence‑based stopping rule.
- **Non‑deterministic.** No seed is set (`rand` isn't seeded), so results change from run to run.

## Expected Behavior (inferred, not executed)

No MATLAB/Octave runtime was available while writing this documentation, so the scripts themselves were **not executed**. To estimate typical results, the same sampling procedure was re‑implemented temporarily outside the repository (not committed) and run 200 times with different seeds:

| Script | Median `fbest − f*` | Worst of 200 runs |
|---|---|---|
| 1 variable | ≈ 5 × 10⁻⁵ | ≈ 3 × 10⁻³ |
| 2 variables | ≈ 0.09 | ≈ 0.58 |

This shows the expected weakness of pure random search as dimensions grow. With the same budget, the 2‑D search space is 40 times larger (an area of 400 against a length of 10), so the best sample is typically much farther from the optimum.

## Execution Flow

```
MATLAB session
   └─ run script
        ├─ define f, plotting grid, bounds
        ├─ 1000 × (sample → evaluate → keep best)
        └─ figure: function graph + best point marker
```

## Dependencies Observed

Only built‑in MATLAB functions: `clc`, `clear`, `cla`, `rand`, `meshgrid`, `inf`, `plot`, `plot3`, `surf` and `hold`. No toolboxes, no files, no external libraries.
