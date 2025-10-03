#import "template.typ": *

= Exercise 2

First hour spent solving the first exercise sheet (see inlined feedback / solutions in the attempt folder).  Second hour spent giving hints on Exercise Sheet 2 covering stopping-time as well as giving three theorems or lemmas about conditional expectations that will be useful soon.

== Hint for Exercise Sheet 2

#definition[
  $(Omega, cal(F), P)$ with filtration $FF = (cal(F)_n)_(n=0,1,...)$.  $tau: Omega -> NN union {+ infinity}$ is a *stopping time* if ${tau <= n} in cal(F)_n.$.
]
_Beware trap_: over time horizon $T$, $FF = (cal(F)_n)_(n=0,1,...,T), tau: Omega -> {0, 1, ..., T}$ and $eta: Omega -> {0, 1, ..., T}$, then $tau + eta$ is *not* a stopping time, since it goes up to $2T$.  This is true for infinite time however.

*Example.* We consider a process $X = (X_n)_(n=0,1,...)$ that is adapted.  Prove that $rho := "inf"{n >= 0: |X_n| >= a}$ is a stopping time given $a in RR$.

_Proof._ Fix $n in NN$. Need to show ${rho <= n} in cal(F)_n$.

${rho <= n} = union_(j=0)^n { |X_j| >= a }$.  Since $X$ is adapted, ${ |X_j| >= a } in cal(F)_j$, therefore the entire union $in cal(F)_n$.

_If $X$ would be predictable, use $cal(F)_(j-1)$, same proof follows._

=== Hint for Ex. 2.4

$(Omega, cal(F), P)$ with finite time horizon $T >= 2$.  Take two assets $(S^0, S^1)$ with the first one being the bank account.  Assume that $S^0 eq.triple 1, S^1_k > 0 "for" k=1,...,T, S^1_0 = 1.$

Fix $0 < l < 1 < v, tau := "inf"{k = 0, ..., T : S^1_k <= l} and T$, $rho := inf{k = tau(omega), ..., T : S^1_k >= v} and T.$

1. Define $FF = (cal(F)_k)_(k=0,...,T)$ s.t. $cal(F)_k = sigma(S^1_k : i = 0, ..., k)$.  Prove that $tau$ and $rho$ are ($FF$-)stopping times.

_Proof._ Need to show ${tau <= n} in cal(F)_n arrow.double.l S^1 "is" FF"-adapted"$.  Same for $rho.$  (_More generally, so long as $S$ is $FF$-adapted, any condition that compares $S$ with a constant works._)

2. $theta = (theta_k)_(k=0,...,T)$ by $theta_k := bb(1)_{tau < k <= rho}$ for $k = 0,...,T$.  Prove that $theta$ is predictable.

_Proof._ Need to show $theta_k$ is $cal(F)_(k-1)$-measurable. $arrow.double.l {tau < k <= rho} in cal(F)_(k-1)$. $"LHS" = {tau < k} inter {rho >= k}$.

- ${tau < k} = {tau <= k-1} in cal(F)_(k-1)$.
- ${rho >= k} = {rho < k}^c = {rho <= k-1}^c in cal(F)_(k-1).$

Since $sigma$-algebra is closed under finite intersection (_not countable!_), $"LHS" in cal(F)_(k-1).  quad qed$

=== Self-financing strategy

$Delta C_k = 0$.

== Important for conditional expectation

Monotone convergence theorem, Dominated convergence theorem, Fatou's lemma.  _These were not given during the session due to lack of time._