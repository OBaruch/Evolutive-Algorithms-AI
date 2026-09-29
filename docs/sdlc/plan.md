# Plan

> Spec‑driven records: [intent](intent.md) → [spec](spec.md) → **plan**.
> This is the execution plan for the repository refactor, kept as a record of how it was carried out.

## Phase 1 — Discovery (read‑only)

- [x] List every file in the repository, including Git history and authorship.
- [x] Look for PDFs, Word/PowerPoint files, images, data and outputs. **None found.**
- [x] Read both MATLAB scripts in full and record their line endings (CRLF) and blob hashes.
- [x] Pull out the contextual evidence: the "Actividad 3" header, the author name, the folder and repository names, and the upload date.
- [x] Classify the project as **Coursework / Assignment** (inferred) and write down which facts are unknown (institution, course, assignment statement).
- [x] Find inconsistencies: the "2 variables" comment in the 1‑variable script, and plot ranges that differ from the search ranges.

## Phase 2 — Analysis

- [x] Work out the analytical minima (`x* = 1.2, f* = 0.8`; `(2,2), f* = 0`) to use as documentation references.
- [x] Estimate typical results with a temporary re‑implementation outside the repository. It is labeled as inferred because MATLAB/Octave wasn't available and the original scripts weren't executed.

## Phase 3 — Restructure

- [x] Create a dedicated branch for the change.
- [x] Move both scripts from `Evolutive Algorithms/` to `src/` with `git mv`. The empty legacy folder disappears.
- [x] Check that the blob hashes are unchanged (spec P‑1).
- [x] Add a minimal `.gitignore` for MATLAB/Octave artifacts and OS files.
- [x] Leave `data/`, `assets/`, `docs/original/` and `archive/` out, because there is no material for them (spec S‑2).

## Phase 4 — Documentation

- [x] `README.md`
- [x] `docs/project-context.md`
- [x] `docs/code-overview.md`
- [x] `docs/possible-improvements.md`
- [x] `docs/sdlc/intent.md`, `spec.md`, `plan.md`
- [x] `AGENTS.md` (guardrails for automated contributors)

## Phase 5 — Verification

- [x] `git hash-object src/*.m` matches the baseline.
- [x] `git diff -M --stat main` shows the `.m` files as pure renames.
- [x] Every relative Markdown link resolves to an existing file.
- [x] No run command or result is claimed as tested.

## Phase 6 — Delivery

- [x] Commit under the repository author's identity.
- [x] Push the branch and open a pull request against `main` for review.

## Risks and Mitigations

| Risk | Mitigation |
|---|---|
| Line endings get normalized when the files are moved, which silently changes them | Verify the blob hashes after the move. No `.gitattributes` rewrite. |
| Documentation overstates the context (for example, naming a university) | Every contextual claim is labeled Confirmed / Inferred / Unknown. |
| Someone later "cleans up" the source | `AGENTS.md` and the README state that `src/` is read‑only. The improvements are recorded separately. |
