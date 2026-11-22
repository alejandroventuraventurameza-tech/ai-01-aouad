# Lean formalization ledger — exact reach of the current candidate

**Paper:** Aouad, Lykouris & Zhong (2026), arXiv:2605.11350v1, §2, Proposition 2.1.  
**Source file:** [Aouad/Proposition21.lean](../Aouad/Proposition21.lean).  
**Environment:** Lean 4.34.0; Mathlib v4.34.0 via Lake.  
**Rule:** compile status is established only by the exact GitHub Actions run at a definite commit SHA.

## Dependency chain for Proposition 2.1

1. **Existence:** the source tail-regularity assumption implies that $f(x)=p(x)-\gamma x$ is eventually coercive downward. Continuity then produces a nonempty compact global argmax. **Lean status: PENDING.**
2. **Greatest selection:** since the argmax is compact, $x^\star=\max\operatorname{argmax} f$ exists; if a plateau occurs this makes the largest effort choice unambiguous. **Lean status: PENDING.**
3. **Right-tail monotonicity:** concavity plus global optimality implies that $f$ is nonincreasing for $x\geq x^\star$; greatest selection strengthens the decline beyond $x^\star$. **Lean status: NEW CANDIDATE** in Aouad/ConcavityBridge.lean, submitted at SHA d57e87121153507f19238bcc16af5ff04c86ea94; kernel run not yet certified.
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

The newer Jensen-concavity bridge is tracked independently and must not inherit this success merely because it imports the verified module.
