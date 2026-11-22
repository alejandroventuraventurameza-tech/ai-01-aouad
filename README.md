# Repository 1 — Aouad, Lykouris & Zhong (2026)

**Assignment:** [AI-Econ-Modeling Issue #6](https://github.com/alexanderquispe/AI-Econ-Modeling/issues/6).  
**Assigned source:** [arXiv:2605.11350v1 (12 May 2026)](https://arxiv.org/pdf/2605.11350v1).  
**Later revision:** [arXiv:2605.11350v2 (17 October 2026)](https://arxiv.org/pdf/2605.11350v2).

> **DRAFT — PROVENANCE WARNING:** This repository was initialized from the [instructor's worked example](https://github.com/alexanderquispe/ai-01-aouad). The original instructor prompts and handwritten PDF have been removed from this branch; placeholders now mark the missing student evidence. The inherited paper/ and extra/ folders remain **instructor reference materials**, not student-authored work. An original Beamer source and its compiled PDF have replaced the instructor slides on this branch. Do not merge or submit until the actual raw conversation and handwritten derivation are supplied and checked.

## Research question

How can AI replace human effort in the short run while, through changing skill or reliability, lowering productivity in richer settings?

## Section 2 — the static decision

A worker with skill $s>0$ and deterministic AI assistance $a\geq 0$ chooses effort $e\geq 0$:
$$
\max_{e\geq0}\ U(e;s,a)=p(s+e+a)-\gamma e,
$$
where $\gamma>0$. The production function $p:[0,\infty)\to[0,\infty)$ is continuous, nondecreasing and concave (the paper additionally assumes twice differentiability). Human skill, effort and assistance are **perfect substitutes** in this baseline.

Define the concave net-output function $f(x)=p(x)-\gamma x$ and its **largest** global maximizer:
$$
x^\star=\max\operatorname{argmax}_{x\geq0}\{p(x)-\gamma x\}.
$$
The tail condition
$$
\limsup_{x\to\infty}\frac{p(x)}{x}<\gamma
$$
ensures the maximum exists and its argmax is bounded, given continuity.

**Proposition 2.1 (v1 and v2).** With the largest-maximizer tie-break, an optimal effort selection and the associated realized productivity are
$$
e^\star(s,a)=(x^\star-s-a)_+,\qquad
p^\star(s,a)=\max\{p(x^\star),p(s+a)\}.
$$

**Why:** Set $b=s+a$ and $x=b+e$. The worker maximizes $f(x)+\gamma b$ over $x\geq b$. If $b\leq x^\star$, the largest global maximizer is feasible; if $b>x^\star$, concavity makes $f$ decrease to the right of $x^\star$, so the best feasible point is $x=b$. This proof requires no derivative or interior FOC. See [the independent proof audit](docs/PROPOSITION_2_1_PROOF_AUDIT.md).

**Interpretation:** Effort falls one-for-one as skill plus assistance approaches the target; output is initially constant, then weakly increasing. This baseline *does not itself* establish a productivity paradox.



## Formal verification: Proposition 2.1

The [Lean 4 proof](Aouad/RatioBound.lean) now establishes the existence of a greatest global maximizer, optimality of the positive-part effort rule for all nonnegative skill/assistance/effort, and the gross-output identity. Its top-level declaration is **Aouad.proposition21_from_limsup_and_jensen**. It assumes continuity of p, Jensen concavity and monotonicity for nonnegative inputs, p(0) >= 0, and the real-valued Filter.limsup ratio gap. The proof itself establishes the ratio's eventual upper bound from Jensen concavity, rather than assuming it.

**Evidence:** [GitHub Actions Lean #44972813354](https://github.com/alejandroventuraventurameza-tech/ai-01-aouad/actions/runs/44972813354), SHA 482c2cf9291fa5b626ccf7a17660804db18ac095, **SUCCESS**; 8,930 jobs; axiom-audit of 14 declarations; only [propext, Classical.choice, Quot.sound] as dependencies, no sorryAx. See [formal ledger](docs/LEAN_FORMAL_SCOPE.md) and [reproducibility record](docs/REPRODUCIBILITY.md).

This result formalizes the static Proposition 2.1, **not** the long-run deskilling, unreliability or polarization results in Sections 3–5. A finished mathematical proof also does not replace the course's student-authored raw prompts and handwritten work.

## Broader mechanisms — reading only

- **§3:** effort-dependent skill accumulation (birth–death process) can produce long-run deskilling.
- **§4:** unreliable assistance and effort substitution can lower expected productivity.
- **§5:** heterogeneous AI literacy with endogenous skill can polarize the skill distribution.

No attempt is made here to reproduce the theorems of §§3–5. See [version-aware extension audit](extensions.md). The October v2 also analyzes forward-looking behavior; claiming that the paper never considers this would be inaccurate.

## Submission ledger

| Deliverable | Status |
|---|---|
| README with model and core result | Draft complete |
| Independent typed proof (docs/) | Complete for Proposition 2.1; independently reconstructed, with the exact kernel-checked counterpart described below |
| Raw student dialogue (prompts.md) | **Missing: file now contains an explicit authentic-export placeholder** |
| Student's physical handwritten derivation (hand/) | **Missing: copied PDF removed; hand/README.md specifies the required work** |
| Original Beamer presentation.tex and compiled presentation.pdf | **Verified: GitHub Actions [run #44970668988](https://github.com/alejandroventuraventurameza-tech/ai-01-aouad/actions/runs/44970668988) compiled six slides and committed the PDF** |
| Lean 4 proof of Section 2 | **Verified:** [run #44972813354](https://github.com/alejandroventuraventurameza-tech/ai-01-aouad/actions/runs/44972813354), theorem proposition21_from_limsup_and_jensen; 8,930 jobs, 14 declarations audited, no sorryAx |
| Branch → PR → merge / comment on Issue #6 | PR is draft; not submitted |

## Evidence rules

A compiled PDF shows LaTeX validity, not correctness of the mathematics. A green Lean CI certifies only the *exact statements in the compiled file*, under their explicit hypotheses. Instructor-template files are never offered as evidence of original student work.
