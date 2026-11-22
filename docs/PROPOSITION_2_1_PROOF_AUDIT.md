# Proposition 2.1 — derivative-free reconstruction and proof audit

**Source:** Aouad, Lykouris & Zhong, *Human-AI Productivity Paradoxes*, [arXiv v1](https://arxiv.org/pdf/2605.11350v1), §2, Proposition 2.1. The October [v2](https://arxiv.org/pdf/2605.11350v2) retains Proposition 2.1. This document is a new **typed mathematical reconstruction**, **not** student handwriting and **not** a kernel-checked theorem.

## Assumptions and notation

Let $s>0$, $a\geq0$, $\gamma>0$ and $p:[0,\infty)\to[0,\infty)$ be continuous, concave and nondecreasing. Twice differentiability, assumed by the paper, is not needed in the following proof. Assume
$$
\limsup_{x\to\infty}\frac{p(x)}{x}<\gamma.
$$
Write $b=s+a\geq0$ and $f(x)=p(x)-\gamma x$.

## Existence and tie-breaking

Choose $\varepsilon>0$ small enough that, for all sufficiently large $x>0$,
$$
\frac{p(x)}{x}\leq \gamma-\varepsilon.
$$
Thus $f(x)\leq-\varepsilon x\to-\infty$. By continuity $f$ attains its maximum on a sufficiently large compact interval. Its maximizer set is nonempty, compact, and hence has a largest element
$$
x^\star=\max\operatorname{argmax}_{x\geq0}f(x).
$$
**This is the largest optimal total input, not necessarily the only one.** Without the tie-break the selected effort can be nonunique when $f$ has a plateau.

## Reduction

For any $e\geq0$, let $x=b+e\geq b$. The objective satisfies
$$
p(b+e)-\gamma e=f(x)+\gamma b.
$$
Since $\gamma b$ is constant, we maximize $f(x)$ over $x\geq b$.

## Case 1 — feasible critical level, $b\leq x^\star$

The point $x^\star$ is feasible and globally maximizes $f$. It is also the largest *feasible* maximizer, because no maximizer of $f$ exceeds $x^\star$. The corresponding selected effort is
$$
e^\star=x^\star-b\geq0.
$$

## Case 2 — binding nonnegativity constraint, $b>x^\star$

We prove that $b$ maximizes $f$ over $[b,\infty)$ using concavity, not differentiation.

Take any $y>b$ and define
$$
t=\frac{b-x^\star}{y-x^\star}\in(0,1).
$$
Then $b=(1-t)x^\star+ty$, so concavity implies
$$
f(b)\geq(1-t)f(x^\star)+t f(y).
$$
By global optimality $f(x^\star)\geq f(b)$; hence
$$
f(b)\geq (1-t)f(b)+t f(y)
\quad\Rightarrow\quad f(b)\geq f(y).
$$
In fact $f(x^\star)>f(y)$ because $y>x^\star$ and $x^\star$ is the **largest** global maximizer. Thus $f(b)>f(y)$; $b$ is the unique constrained maximizer and
$$
e^\star=0.
$$

Combining both cases yields
$$
\boxed{e^\star(s,a)=\max\{x^\star-s-a,0\}.}
$$

## Realized output, not net utility

Selected total input is $b+e^\star=\max\{b,x^\star\}$, so monotonicity of $p$ gives
$$
\boxed{p^\star(s,a)=\max\{p(x^\star),p(s+a)\}.}
$$
This $p^\star$ is **gross productivity**; the objective net of effort cost is a different quantity.

## Internal consistency audit

1. The tail condition ensures existence and finiteness; it is sufficient, not a necessary condition for all possible $p$.
2. Concavity underpins the corner case. Monotonicity of $p$ is used **separately** to convert the optimal total input into the max expression for gross output.
3. The largest-argmax convention prevents ambiguity when $f$ has a flat maximum.
4. Differentiating $p$ or imposing the FOC $p'(x^\star)=\gamma$ is unnecessary, and the FOC alone would miss corners and tie-breaking.
5. This does not establish the nonlinear/dynamic paradoxes of §§3–5.
6. **Verification:** the proof is mathematical prose; no claim of Lean-kernel verification is made here.
