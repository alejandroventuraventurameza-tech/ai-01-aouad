# Reproducibility record — Repository 1 (work in progress)

This page states what was actually compiled and what remains unverified. It is not a declaration of final course submission.

## Source identity

- Assigned paper: Aouad, Lykouris & Zhong (2026), arXiv:2605.11350v1; course Issue #6.
- Later revision: arXiv:2605.11350v2. Extension claims must declare which version was checked.
- Working branch: work/repository1-proposition21-audit.
- Pull request: https://github.com/alejandroventuraventurameza-tech/ai-01-aouad/pull/1 (draft).

## Lean 4 kernel-verified checkpoint

GitHub Actions [run #44970575150](https://github.com/alejandroventuraventurameza-tech/ai-01-aouad/actions/runs/44970575150), SHA 9f08e3244dabfc2c3edf6f0a4fa58fb9f2a27993: **SUCCESS**, 8,926 jobs, three declared theorems compiled and axiom-audited.

The declarations are:
- Aouad.selectedEffort_nonneg
- Aouad.selectedEffort_optimal
- Aouad.selectedEffort_grossOutput

Each reports exactly the standard Lean/Mathlib axiom dependencies [propext, Classical.choice, Quot.sound]. None reports sorryAx. The two economic theorems have explicit extra assumptions, including global maximum and a right-tail condition: they do not yet establish the full proposition directly from the paper's regularity and concavity hypotheses.

## Extended Jensen-concavity candidate

The new Aouad/ConcavityBridge.lean at SHA d57e87121153507f19238bcc16af5ff04c86ea94 attempts to replace the assumed right-tail condition by an explicit Jensen concavity hypothesis. See [the separate pinned workflow #44970882111](https://github.com/alejandroventuraventurameza-tech/ai-01-aouad/actions/runs/44970882111). **SUCCESS / KERNEL-VERIFIED** in [run #44970882111](https://github.com/alejandroventuraventurameza-tech/ai-01-aouad/actions/runs/44970882111): 8,927 build jobs and explicit axiom audit of nine declarations. The three new Jensen bridge theorems have precisely `[propext, Classical.choice, Quot.sound]` dependencies. Their scope is conditional on a given nonnegative global maximizer; this does not certify its existence.

## Beamer checkpoint

GitHub Actions [run #44970668988](https://github.com/alejandroventuraventurameza-tech/ai-01-aouad/actions/runs/44970668988), SHA bd8738459c6521bdc04dff9687067acee2447d6c: **SUCCESS**; original six-slide Beamer compiled and the generated PDF committed back to the working branch.

The copy in main was inherited from the instructor template. On the working branch the PDF now has a different Git blob identifier and corresponds to the independent TeX source.

## Reproduce

From repository root in an environment with Git, Lean and TeX:

~~~bash
lake update
lake exe cache get
lake build Aouad
latexmk -pdf -interaction=nonstopmode -halt-on-error presentation.tex
~~~

The exact Lean toolchain is pinned in lean-toolchain and Mathlib tag in lakefile.toml. The current workflow runs lake update before each build because a resolved lake-manifest.json has **not yet been committed**; this limits transitive-dependency reproducibility until the manifest is frozen.

## Remaining release gates

- A complete Lean proof from the article's limsup condition, existence of x-star, largest-maximizer choice and concavity is not yet certified.
- An authentic raw student dialogue in prompts.md is still required; the inherited professor transcript was removed on this branch.
- Original physical handwritten evidence in hand/ is still required; the instructor's scanned handwritten PDF was removed on this branch.
- Do not merge or submit to course Issue #6 until authentic evidence and current PDF, CI and originality gates are reviewed.
