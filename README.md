# Repository 1 — Aouad, Lykouris & Zhong (2026)

**Course assignment:** [Issue #6](https://github.com/alexanderquispe/AI-Econ-Modeling/issues/6) · **Paper:** [Human-AI Productivity Paradoxes](https://arxiv.org/abs/2605.11350).

> **Work in progress.** This repository was initialized from [the instructor's worked-example template](https://github.com/alexanderquispe/ai-01-aouad). The inherited `prompts.md`, `hand/`, and presentation are **instructor example artifacts**, not evidence of this student's own prompts, handwriting, or presentation. They must be replaced or accurately attributed before submission. This notice must not be removed until that audit is complete.

## Question and model

How can more AI assistance reduce human effort, and when does its effect on realized output change?

A worker with skill \(s\geq0\), assistance \(a\geq0\), and effort \(e\geq0\) chooses
$
\max_{e\geq0}\;p(s+a+e)-\gamma e,
$
where \(\gamma>0\) and \(p\) is nondecreasing and concave on the relevant nonnegative domain. The model assumes perfect substitution across these three inputs and linear effort cost.

## Proposition 2.1 — precise optimizer convention

Let (f\(x\)=p\(x\)-\gamma x) on \(x\geq0\). Assume its maximum exists and let
$
x^* = \max\operatorname{argmax}_{x\geq0} f\(x\).
$
A sufficient tail regularity condition under the maintained continuity/concavity assumptions is
$
\limsup_{x\to\infty}\frac{p\(x\)}{x}<\gamma.
$
Then the **largest optimal effort** (important when \(f\) has a flat peak) is
$
e^*(s,a)=\(x^*-s-a\)_+,
\qquad
p^*(s,a)=\max\{p\(x^*\),p(s+a)\}.
$
The first formula is a **tie-broken selection** from potentially multiple optimal efforts; it does not imply every optimizer coincides with it.

### Proof skeleton \(no differentiation\)

Put \(b=s+a\) and \(x=b+e\). The feasible set is \(x\geq b\) and the objective is (f\(x\)+\gamma b). If \(b\leq x^*\), \(x^*\) is feasible and is the greatest maximizing \(x\). If \(b>x^*\), concavity and the fact that \(x^*\) is the greatest *global* maximizer imply \(f\) is strictly decreasing beyond \(x^*\); hence \(x=b\) is the unique maximizing feasible point. See [the detailed proof audit]\(docs/PROPOSITION_2_1_PROOF_AUDIT.md\).

## Coverage and evidence ledger

| Requirement | Current status |
|---|---|
| Research question, agent's problem, assumptions and Proposition 2.1 | **Drafted and audited** in this README and `docs/` |
| Original raw model-interaction transcript (`prompts.md`) | **Not yet supplied**; current file belongs to the instructor template |
| Student's own handwritten derivation (`hand/`) | **Not yet supplied**; current directory belongs to the instructor template |
| Student's 5-minute Beamer deck + compiled PDF | **Not yet produced**; current files belong to the instructor template |
| Optional Lean formalization | **Not yet compiled or kernel-verified** |
| Branch → pull request → merge | **Branch open; no merge** |
| Comment with repository link on Issue #6 | **Not yet posted** |

Sections 3–5 are intended for conceptual review only, as specified in Issue #6. No claim of new research contribution or mathematical formalization is made by copying the template.
