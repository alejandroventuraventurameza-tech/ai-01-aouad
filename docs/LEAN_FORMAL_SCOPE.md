# Formal proof ledger — Proposition 2.1 (kernel-verified)

**Primary assignment:** Aouad, Lykouris & Zhong (2026), arXiv:2605.11350v1, Section 2, Proposition 2.1; [course Issue #6](https://github.com/alexanderquispe/AI-Econ-Modeling/issues/6).  
**Branch:** work/repository1-proposition21-audit; **PR:** [#1](https://github.com/alejandroventuraventurameza-tech/ai-01-aouad/pull/1) (draft).  
**Environment:** Lean 4.34.0, Mathlib v4.34.0.

## Exact certified claims

The top-level kernel-checked declaration is **Aouad.proposition21_from_limsup_and_jensen** in [Aouad/RatioBound.lean](../Aouad/RatioBound.lean). It proves existence of an xStar >= 0 such that:

1. xStar globally maximizes f(x)=p(x)-gamma*x on the nonnegative axis.
2. xStar is the **greatest** such global maximizer (the paper's tie-break).
3. For every s,a,e >= 0, chosen effort eStar=max(xStar-s-a,0) maximizes p(s+a+e)-gamma*e over feasible effort.
4. The selected gross output is p(s+a+eStar)=max(p(xStar),p(s+a)).

**Explicit hypotheses:** Continuous p on real inputs; Jensen concavity for nonnegative x and y; p(0)>=0; p nondecreasing on the nonnegative axis; and Filter.limsup (p(x)/x) along x -> +infinity is < gamma. The source article assumes stronger smoothness and nonnegative productivity. The real-limsup theorem requires eventual upper boundedness, **proved** from Jensen concavity and p(0)>=0 in Aouad.ratio_isBoundedUnder_of_jensen.

Gamma positivity, assumed in the source economic model, is not mathematically necessary for this top-level implication once the strict tail-gap assumption is given. This difference is a generalization, not a contradictory economic assumption.

## Verified dependency chain

| Gate | Source declaration | Evidence |
|---|---|---|
| Effort nonnegativity and conditional optimality | selectedEffort_nonneg; selectedEffort_optimal; selectedEffort_grossOutput | [Lean #44970575150](https://github.com/alejandroventuraventurameza-tech/ai-01-aouad/actions/runs/44970575150), success |
| Jensen concavity to right-tail monotonicity | netOutput_jensen_of_production_jensen; rightTail_antitone_of_jensen; selectedEffort_optimal_from_jensen | [Lean #44970882111](https://github.com/alejandroventuraventurameza-tech/ai-01-aouad/actions/runs/44970882111), success |
| Attainment and greatest-maximizer tie-break | exists_greatest_global_maximizer_of_strict_tail | [Lean #44972209796](https://github.com/alejandroventuraventurameza-tech/ai-01-aouad/actions/runs/44972209796), success |
| Ratio limsup to strict tail | strictTail_of_eventual_ratio_gap; exists_greatest_global_maximizer_of_real_limsup | [Lean #44972209796](https://github.com/alejandroventuraventurameza-tech/ai-01-aouad/actions/runs/44972209796), success |
| Bounded ratio from Jensen concavity; full Section 2 statement | ratio_isBoundedUnder_of_jensen; proposition21_from_limsup_and_jensen | [Lean #44972813354](https://github.com/alejandroventuraventurameza-tech/ai-01-aouad/actions/runs/44972813354), SHA 482c2cf9291fa5b626ccf7a17660804db18ac095, success |

**Final audit:** 8,930 build jobs; 14 declarations within the allowed axioms [propext, Classical.choice, Quot.sound]; no sorryAx. The candidate had ordinary intermediate elaboration errors, which were fixed and rechecked. Those failed attempts do not imply the final theorem is unproved.

## Limits

- Only the **static** Proposition 2.1 is formalized. Nothing is certified here about birth-death Markov chains, IARA/DARA effects, Bayesian learning, deskilling, unreliability, or skill polarization.
- The proof is in a compatible mathematical representation with explicit domain and regularity assumptions; it should not be described as a literal line-by-line compilation of the paper's prose.
- This Lean proof is not itself handwriting or a ChatGPT conversation log. The student's seven-page original iPad PDF and manuscript images are now in `hand/` (see [review](REVIEW_IPAD_PDF.md)); instructor acceptance of digital handwriting remains outside the scope of automated checks. The student's copied chat excerpts are recorded in [prompts.md](../prompts.md) and [RP4 ledger](RP4_CONVERSACION_EN_CURSO.md), but the combined record is **not a fully verbatim export of both parties**.

Do not describe all course evidence as certified, or merge PR #1 as a completed academic submission, until the dialogue integrity gate and human manuscript review are addressed.
