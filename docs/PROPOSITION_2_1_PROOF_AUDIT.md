# Proposition 2.1 — exact mathematical audit

Source: Aouad, Lykouris & Zhong (2026), *Human-AI Productivity Paradoxes*, §2; scope specified in [course Issue #6](https://github.com/alexanderquispe/AI-Econ-Modeling/issues/6). This is an independently written **typed derivation**, not the student's required handwritten evidence.

## 1. The feasible change of variables

Assume $s,a\geq0$, $γ>0$, and a continuous, concave, nondecreasing production function $p:[0,\infty$\to\mathbb R). Define $b=s+a$, $x=b+e$, and (f(x)=p(x)-γ x). Then
$$
p(b+e)-γ e=f(x)+γ b,\qquad e\geq0\iff x\geq b.
$$
The term $γ b$ is constant, hence choosing effort is equivalent to maximizing the **concave** function (f) over $[b,\infty$).

## 2. Why an argmax exists

The tail condition
$$
L:=\limsup_{x\to\infty}p(x)/x<γ
$$
implies that for some $ε>0$ and $M<\infty$,
(p(x)/x\leq γ-ε) for all $x\geq M$. Consequently,
$$
f(x)=p(x)-γ x\leq-ε x\to-\infty.
$$
Because (f) is continuous, it attains a finite maximum on a sufficiently large compact interval. Its argmax is a nonempty compact set and therefore contains a largest element, denoted
$$
x^*=\max\operatorname{argmax}_{x\geq0}f(x).
$$
The tail condition is sufficient, rather than necessary, for this existence assertion.

## 3. Interior-versus-corner proof, without derivatives

**Case A: $b\leq x^*$.** The unconstrained maximizer $x^*$ is feasible. No feasible (x) can improve on its globally maximal value. Because $x^*$ is the *largest* global maximizer, it is also the largest constrained maximizer. Therefore the selected effort is $e^*=x^*-b\geq0$.

**Case B: $b>x^*$.** Fix any (y>b). Concavity gives, with
(b=(1-t)x^*+ty), (t=$b-x^*$/$y-x^*$\in(0,1)),
$$
f(b)\geq(1-t)f$x^*$+t f(y).
$$
Since (f$x^*$\geq f(b)), we have
$$
f(b)-f(y)\geq(1-t)(f$x^*$-f(y))\geq0.
$$
Moreover, $y>x^*$ is not a global maximizer by the largest-maximizer definition, so (f$x^*$>f(y)), and hence (f(b)>f(y)). Thus (b) is the unique maximizer on $[b,\infty$), and $e^*=0$.

Combining the cases,
$$
\boxed{e^*(s,a)=$x^*-s-a$_+.}
$$

## 4. Realized output

At the selected optimum, total input is
$$
b+e^*=\max\{b,x^*\}.
$$
Because (p) is nondecreasing,
$$
\boxed{p^*(s,a)=p$\max\{s+a,x^*\}$=\max\{p(s+a),p$x^*$\}.}
$$
The last equality requires monotonicity of (p), not just concavity.

## 5. Audit of subtle points

1. **Tie-breaking is substantive.** If (f) is constant on a nontrivial maximizing interval, there are multiple optimal efforts when (b) lies below the interval. The displayed effort formula selects the **largest** optimizer; it cannot be asserted to describe all optimizers.
2. **Do not silently replace global optimization with the FOC** (p'$x^*$=γ). The optimum may be a corner, or there may be a flat maximizing interval. The proof above requires no differentiability.
3. **Do not call convex effort cost an unexplored extension.** The paper's Appendix D already studies strictly convex cost. Consult the actual appendix before identifying open extensions.
4. **Output is different from objective value.** (p^*(s,a)) is realized gross production, not the maximized net utility (p$b+e^*$-γ e^*).
5. **Finite vs. infinite domain.** The displayed regularity condition assumes (x) can grow without bound. On a different production domain, the existence hypotheses must be reformulated accordingly.

## 6. Validation boundary

This document is a human-readable mathematical argument, **not** a Lean-kernel certification. No Lean build or CI result is claimed. It does not prove the Markov-chain, risk-aversion or Bayesian results of §§3–5, which are reading-only for this assignment.
