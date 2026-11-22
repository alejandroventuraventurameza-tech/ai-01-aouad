# Reproducibility and final evidence ledger (draft submission)

**Repository:** [ai-01-aouad](https://github.com/alejandroventuraventurameza-tech/ai-01-aouad)  
**Branch:** work/repository1-proposition21-audit; **PR:** [#1](https://github.com/alejandroventuraventurameza-tech/ai-01-aouad/pull/1) (draft).  
**Article:** arXiv:2605.11350v1 is the original August class assignment; v2 (October 2026) is distinguished for research extension claims.

## Source and build evidence

- Formal package: Lean 4.34.0, Mathlib v4.34.0 in lean-toolchain and lakefile.toml.
- Original conditional optimizer lemmas: [Lean #44970575150](https://github.com/alejandroventuraventurameza-tech/ai-01-aouad/actions/runs/44970575150) (success).
- Jensen derivative-free bridge: [Lean #44970882111](https://github.com/alejandroventuraventurameza-tech/ai-01-aouad/actions/runs/44970882111) (success).
- Compactness/greatest optimizer and real-limsup tail: [Lean #44972209796](https://github.com/alejandroventuraventurameza-tech/ai-01-aouad/actions/runs/44972209796) (success).
- **Top-level Proposition 2.1 proof:** [Lean #44972813354](https://github.com/alejandroventuraventurameza-tech/ai-01-aouad/actions/runs/44972813354), exact SHA 482c2cf9291fa5b626ccf7a17660804db18ac095 (success); **8,930 jobs**, **14 declarations axiom-audited**, only propext, Classical.choice, Quot.sound; no sorryAx.
- Original six-slide Beamer (source presentation.tex, compiled presentation.pdf): [PDF #44970668988](https://github.com/alejandroventuraventurameza-tech/ai-01-aouad/actions/runs/44970668988) (success). Its new PDF is distinct from the instructor template.
- Full proof reach and assumptions: [docs/LEAN_FORMAL_SCOPE.md](LEAN_FORMAL_SCOPE.md).

## Reproduction commands

From the repository root, after installing the pinned Lean toolchain and a TeX distribution:

~~~bash
lake update
lake exe cache get
lake build Aouad
latexmk -pdf -interaction=nonstopmode -halt-on-error presentation.tex
~~~

The Lean workflow currently generates lake-manifest.json rather than committing it. To freeze all transitive dependency revisions precisely, preserve an inspected manifest in the final repository before declaring the entire environment immutable. The source-level Mathlib revision is pinned.

## Non-formal obligations and release blockers

- **Required academic record:** prompts.md is an explicit placeholder, not an authentic raw conversation; the copied instructor dialogue was removed from the branch.
- **Required handwritten work:** hand/README.md explains the expected original derivation; the instructor's scanned notebook was removed from this branch.
- **Not certified:** dynamic paradoxes in Sections 3–5. The proof pertains to the static Section 2 only.
- **Submission:** PR remains draft. No merge to main and no course Issue #6 link comment until the authentic student evidence and final integrity checks are complete.

This is a **scientifically verified static core**, not yet a completed assignment submission.
