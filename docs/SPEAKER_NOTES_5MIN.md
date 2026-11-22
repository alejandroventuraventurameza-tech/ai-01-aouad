# Speaker notes — Repository 1 (five-minute target)

**Source:** arXiv:2605.11350v1, §2; second-version caution via arXiv:2605.11350v2. **This script is a prepared speaking aid, not evidence that a student has rehearsed or independently handwritten the proof.** Total planned speaking time: 5:00 (excluding questions).

## Slide 1 — Research focus (0:00–0:25)

The authors ask why assistance that appears productive can, in richer environments, create productivity losses. For this short exposition we focus only on their static benchmark. It is a disciplined effort-allocation problem, not yet a paradox.

## Slide 2 — Agent's problem (0:25–1:10)

The worker controls effort $e$ and takes skill $s$ and reliable AI assistance $a$ as given. Production depends on total input $x=s+e+a$. The parameter $\gamma>0$ measures the marginal effort cost. The choice is constrained by $e\geq0$. An increase in AI can substitute for worker effort because they enter additively, but the model's optimization must still be solved.

## Slide 3 — Critical level and assumptions (1:10–2:00)

Write $f(x)=p(x)-\gamma x$. The tail condition makes $f(x)\to-\infty$, and continuity guarantees a maximizer. Choose the largest maximizer $x^\star$ in case the net-output function has a flat top. This is not an innocuous convention: without it, the worker's optimal effort can be a set of values.

A first-order condition would work only under additional assumptions and does not independently certify the boundary case; we use a global argument.

## Slide 4 — Proof with cases (2:00–3:30)

Let $b=s+a$ and $x=b+e$. Maximizing $p(b+e)-\gamma e$ over $e\geq0$ is equivalent to maximizing $f(x)$ over $x\geq b$.

If $b\leq x^\star$, $x^\star$ is feasible, so choose $e^\star=x^\star-b$.

If $b>x^\star$, the worker cannot *reduce* $x$ by choosing negative effort. The concavity of $f$ and global optimality of $x^\star$ imply that $f$ is nonincreasing to the right of $x^\star$. In fact, the largest-argmax convention makes the right-hand decline strict beyond $x^\star$. Thus at $b$ the constraint binds and $e^\star=0$.

The auxiliary weighted-average inequality in the slide is the actual reason, not an undocumented appeal to a first-order condition.

## Slide 5 — Read the conclusion correctly (3:30–4:20)

The chosen effort is the positive part of the critical level less skill and AI assistance. More AI reduces effort one-for-one while the target $x^\star$ remains reachable; after that, effort reaches zero. Monotonicity of $p$ implies the stated **gross productivity** result. It is not the maximized net utility and does not itself imply a productivity paradox.

## Slide 6 — Scope and research hygiene (4:20–5:00)

Sections 3–5 add mechanisms—endogenous skill, unreliability and literacy—that can break the positive monotonicity of the baseline. We only read them conceptually, as required by Issue #6. It is a trap to claim convex effort costs as novel when Appendix D already covers them. Furthermore, the October v2 studies forward-looking effort; a comment about myopia being entirely unexplored applies, at most, to an earlier paper version.

**Close:** Correct assumptions, selected optimizers and exact source versions are prerequisites for meaningful computational formalization.

## Likely oral questions (backup)

**Q: Why largest argmax?** If $p(x)-\gamma x$ is flat at the maximum, multiple efforts may maximize net utility; the convention picks the largest total input and therefore largest effort.

**Q: Is $p^\star$ nondecreasing in assistance?** In this basic reliable-AI model, yes, because selected total input is $\max\{x^\star,s+a\}$ and $p$ is nondecreasing.

**Q: Why is there no paradox yet?** The paradoxes require dynamic skill responses, unreliability or related mechanisms, none of which are present in the §2 benchmark.

**Q: What exactly does Lean prove?** Check the exact currently compiled declarations. The initial candidate formalizes the optimization conditional on a global maximizer and a decreasing right tail; it does not yet prove existence or derive the right-tail property from concavity.
