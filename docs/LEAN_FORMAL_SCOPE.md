# Lean formalization ledger — exact reach of the current candidate

**Paper:** Aouad, Lykouris & Zhong (2026), arXiv:2605.11350v1, §2, Proposition 2.1.  
**Source file:** [Aouad/Proposition21.lean](../Aouad/Proposition21.lean).  
**Environment:** Lean 4.34.0; Mathlib v4.34.0 via Lake.  
**Rule:** compile status is established only by the exact GitHub Actions run at a definite commit SHA.

## Dependency chain for Proposition 2.1

1. **Existence:** the source tail-regularity assumption implies that $f(x)=p(x)-\gamma x$ is eventually coercive downward. Continuity then produces a nonempty compact global argmax. **Lean status: PENDING.**
2. **Greatest selection:** since the argmax is compact, $x^\star=\max\operatorname{argmax} f$ exists; if a plateau occurs this makes the largest effort choice unambiguous. **Lean status: PENDING.**
3. **Right-tail monotonicity:** concavity plus global optimality implies that $f$ is nonincreasing for $x\geq x^\star$; greatest selection strengthens the decline beyond $x^\star$. **Lean status: DEMONSTRATED conditionally.** `Aouad.rightTail_antitone_of_jensen` compiled in [run #44970882111](https://github.com/alejandroventuraventurameza-tech/ai-01-aouad/actions/runs/44970882111), SHA `d57e87121153507f19238bcc16af5ff04c86ea94`, with only the standard axioms. This proves weak right-tail monotonicity, not maximal-argmax existence.
4. **Conditional effort optimality:** assuming an explicit global-maximizer property and explicit right-tail monotonicity, the positive-part effort candidate maximizes the worker's utility on $e\geq0$. **Lean status: DEMONSTRATED under the stated hypotheses** — [successful pinned CI #44970575150](https://github.com/alejandroventuraventurameza-tech/ai-01-aouad/actions/runs/44970575150), SHA 9f08e3244dabfc2c3edf6f0a4fa58fb9f2a27993.
5. **Gross-output identity:** for the selected effort, nondecreasing production on the nonnegative domain gives $p^\star=\max\{p(x^\star),p(s+a)\}$. **Lean status: DEMONSTRATED under the stated hypotheses** — the same pinned CI #44970575150, with ordinary axioms only.
6. **Full theorem bridge:** combine 1–5 without extra assumptions and match the paper's exact notation, restrictions and tie-break. **Lean status: PENDING.**

The source of Proposition 2.1 uses concavity, continuity, monotonicity and a tail regularity condition; the initial Lean optimization theorem takes a derived consequence (right-tail monotonicity) as a premise instead of proving it. Its green compilation, should it occur, is **not** full formal verification of Proposition 2.1.

## Verification protocol

- GitHub Actions must build the exact Lean source with the pinned toolchain.
- Inspect the logged axioms for the three declarations; reject sorryAx or unspecified user axioms.
- Read the formal hypotheses, not merely the theorem names, when reporting proof coverage.
- A later refactor may prove the concavity-to-tail lemma and the existence lemma. Until then, these remain PENDING.

**Other requirements** (raw student prompts, physical handwritten work, final oral deck, PR merge and Issue #6 link submission) are tracked separately in the root README. A Lean theorem never substitutes for student handwriting or a presentation.


## Verified initial gate (22 November 2026)

The [Lean run #44970575150](https://github.com/alejandroventuraventurameza-tech/ai-01-aouad/actions/runs/44970575150) completed successfully at SHA 9f08e3244dabfc2c3edf6f0a4fa58fb9f2a27993 (8,926 jobs). The three original declarations printed exactly [propext, Classical.choice, Quot.sound] as their axiom dependencies, and the separate axiom-audit step passed. There is no sorryAx in these declarations. This does **not** prove the paper's tail-regularity-to-existence implication.

The **separately verified Jensen-concavity bridge** was compiled and axiom-audited on pinned [run #44970882111](https://github.com/alejandroventuraventurameza-tech/ai-01-aouad/actions/runs/44970882111), SHA `d57e87121153507f19238bcc16af5ff04c86ea94`, completing 8,927 jobs. `Aouad.netOutput_jensen_of_production_jensen`, `Aouad.rightTail_antitone_of_jensen` and `Aouad.selectedEffort_optimal_from_jensen` each report `[propext, Classical.choice, Quot.sound]`; no `sorryAx`. The automatic axiom audit examined nine declarations under `Aouad` and succeeded.


## Existence and limsup candidates (not yet certified)

- Aouad/GreatestMaximizer.lean attempts to prove existence of a **greatest global optimizer** under continuity and a strict right-tail bound. This makes the largest-argmax tie-break explicit using compactness.
- Pinned CI #44971654295 and #44971943041 failed on proof elaboration errors, not on an established mathematical contradiction. The candidate was corrected in commit 18e810d8780c82b2baad3bb27445cbe5a0f19418 and is submitted to [run #44972209796](https://github.com/alejandroventuraventurameza-tech/ai-01-aouad/actions/runs/44972209796). Do not promote to DEMONSTRADO until the exact run succeeds with clean axioms.
- Aouad/TailRegularity.lean attempts to turn a real-valued limsup gap into an eventual strict tail. It **retains an explicit eventual upper-boundedness premise** for p(x)/x. Its implication from concavity and p(0)>=0 is an additional proof obligation.
- These new candidates are separate from the six prior kernel-verified conditional results. Full Proposition 2.1 is NOT YET kernel-certified under the source assumptions.

**Planned proof sequence:** certify greatest optimizer from strict tail; certify strict tail from limsup; derive ratio boundedness from Jensen concavity; combine existence, effort optimality and gross output; audit exact axioms.
