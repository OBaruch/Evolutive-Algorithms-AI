# Possible Improvements

> **None of these improvements have been applied.** The code in [`src/`](../src) is kept exactly as originally written to preserve the historical context of the project. This page only records observations that a present‑day reader might find useful.

## Correctness and Clarity

| # | Observation | Location | Suggestion |
|---|---|---|---|
| 1 | The comment says "Funcion de 2 variables" but the function takes one variable. | `BusquedaDelMinimoAleatoria1Variable.m`, line 4 | Fix the comment to say one variable. |
| 2 | The plot domain (`-4:0.1:4`, `-5:0.5:5`) is narrower than the search domain (`[-5,5]`, `[-10,10]^2`). | Both scripts | Plot over the same bounds that are searched, so any best point is always visible. |
| 3 | The result isn't printed. It only exists in `xbest` / `fbest` and on the plot. | Both scripts | Print it with `fprintf` so the run is self‑describing. |
| 4 | The loop variable `i` shadows MATLAB's imaginary unit. | Both scripts | Use `k` or `iter`. |

## Reproducibility

| # | Observation | Suggestion |
|---|---|---|
| 5 | No random seed, so every run differs. | Call `rng(seed)` so experiments can be repeated. |
| 6 | The 2‑variable script doesn't clear the figure, while `hold on` keeps earlier plots. | Start with `figure;` or `clf`. |
| 7 | The 1‑variable script calls `clear`, which wipes the user's workspace. | Turn the scripts into functions. |

## Structure

| # | Observation | Suggestion |
|---|---|---|
| 8 | The objective, bounds and iteration budget are hard‑coded and repeated in two scripts. | Write one reusable `randomSearch(f, xl, xu, N)` function that works in any dimension. The 2‑D version already works with vectors, so it generalizes easily. |
| 9 | No tests or reference values. | Assert that the result is close to the known minima (`x* = 1.2`; `(2, 2)`). |

## Algorithmic Extensions (Natural Next Steps in an Evolutionary‑Algorithms Course)

- **Localized random search / (1+1)‑ES:** sample around `xbest` with a step size that shrinks over time.
- **Record the convergence curve:** store `fbest` per iteration and plot it.
- **Population‑based methods:** genetic algorithms, differential evolution and particle swarm optimization, compared against this random‑search baseline on the same functions.
- **Harder benchmark functions:** Rastrigin, Rosenbrock and Ackley, which show where pure random search breaks down.
