# Repository 1 — Aouad, Lykouris & Zhong (2026)

**Paper:** *Human-AI Productivity Paradoxes: Modeling the Interplay of Skill, Effort, and AI Assistance* ([assigned arXiv v1](https://arxiv.org/pdf/2605.11350v1)). **Course task:** [Issue #6](https://github.com/alexanderquispe/AI-Econ-Modeling/issues/6).

**Question.** Why can AI replace human effort without immediately reducing output, and how can richer models produce longer-run productivity paradoxes?

## Section 2: the worker's problem

A worker chooses effort $e\geq0$, taking skill $s>0$, reliable AI assistance $a\geq0$ and effort cost $\gamma>0$ as given:
$$
\max_{e\geq0}\;\big[p(s+a+e)-\gamma e\big].
$$
In the static benchmark, $p$ is nondecreasing, continuous and concave on nonnegative inputs (the paper also assumes smoothness). Skill, effort and AI assistance are perfect substitutes. A technical condition is
$$
\limsup_{x\to\infty}\frac{p(x)}{x}<\gamma.
$$

Let $f(x)=p(x)-\gamma x$ and **choose the largest maximizer**
$$
x^\star=\max\operatorname{argmax}_{x\geq0} f(x).
$$

**Proposition 2.1.** With this tie-break, an optimal effort selection and its realized *gross* productivity satisfy
$$
e^\star(s,a)=\max\{x^\star-s-a,0\},\qquad
p^\star(s,a)=\max\{p(x^\star),p(s+a)\}.
$$

**Proof in one paragraph.** Set $b=s+a$ and $x=b+e$. The objective is $f(x)+\gamma b$ subject to $x\geq b$. The tail condition and continuity ensure that $f$ attains a maximum and the maximizer set has a largest member. If $b\leq x^\star$, choose $x=x^\star$; otherwise, concavity makes $f$ decrease to its right, so choose the corner $x=b$. Monotonicity of $p$ yields the output formula. **No differentiation is needed.** See [the detailed proof](docs/PROPOSITION_2_1_PROOF_AUDIT.md).

**Interpretation.** More reliable AI initially crowds out effort one-for-one without changing gross output. The static benchmark alone does **not** generate a productivity paradox; Sections 3–5 add dynamic skill and information mechanisms (reading only).

## Verified code and deliverables

- **Lean 4:** [kernel-verified Proposition 2.1](Aouad/RatioBound.lean), [CI #44972813354](https://github.com/alejandroventuraventurameza-tech/ai-01-aouad/actions/runs/44972813354), 8,930 jobs, 14 declarations axiom-audited, no sorryAx.
- **Presentation:** [original Beamer source](presentation.tex) and [compiled six-page PDF](presentation.pdf); [successful build](https://github.com/alejandroventuraventurameza-tech/ai-01-aouad/actions/runs/44970668988).
- **Research audit:** [scope](docs/LEAN_FORMAL_SCOPE.md), [reproducibility](docs/REPRODUCIBILITY.md), [version-aware extensions](extensions.md) (v1 assigned; [v2](https://arxiv.org/pdf/2605.11350v2) later).
- **Notas originales del iPad:** [PDF completo de siete páginas](hand/Prop_2_1_notas_ipad.pdf), conservado **byte por byte**. Evidencia manuscrita: [página 4 — concavidad](hand/prop-2-1-ipad-p4.png) y [página 5 — solución de esquina](hand/prop-2-1-ipad-p5.png).
- **Aún pendiente:** registro auténtico de prompts y respuestas en [prompts.md](prompts.md). [PR #1](https://github.com/alejandroventuraventurameza-tech/ai-01-aouad/pull/1) permanece en borrador; `main` no se modificó.

