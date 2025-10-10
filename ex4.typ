#import "template.typ": *

= Exercise 4

== Definition of a martingale

#definition[
  Let $(Omega, cal(F), P)$ be a probability space with filtration $FF=(cal(F)_k)_(k in NN_0)$.  Let $X = (X_k)_(k in NN_0)$ be a real-valued process.  $X$ is a martingale if:
  - $X$ is $FF$-adapted $-> X_k$ is $cal(F)_k$-measurable for every $k in NN_0$;
  - $X$ is integrable $-> X_k in L^1(P)$ for every $k in NN_0$
  - $E[X_(k+1)|cal(F)_k] = X_k quad P$-a.s. for every $k in NN_0$.

  _Also called a $(P, FF)$-martingale._
]

#corollary[
  Let $X$ be a submartingale, $tau$ a stopping time $-> X^tau$ is a submartingale.
]

_Proof sketch_: Calculate $X^tau = X_0 + sum_(j=1)^k bb(1)_{j <= tau}(X_j - X_(j-1))$.

== Example modelled after Ex.3.1

Let $S$ be a martingale and $U$ a concave, bounded function.  $phi^sup = (phi^0, theta.alt)$ trading strategies with $theta.alt$ bounded.  Calculate $E[U(G_T (theta.alt))]$.

*As in Ex.3.1 b)*: $(G_k (theta.alt))_(k=1,...,T)$ is a martingale, where $G_k (theta.alt) = theta.alt dot.op S_k$.

*As in Ex.3.1 a)*: $U(G_k (theta.alt))_(k=1,...,T)$ is a supermartingale.

_Proof sketch_: $E[U(G_T (theta.alt))] = E[E[U(G_T (theta.alt)) | cal(F)_0]]$.

Since $U(G)$ is a supermartingale, $E[U(G_T (theta.alt))|cal(F)_0] <= U(G_0 (theta.alt))$. 

Hence the expectation $<= E[U(G_0 (theta.alt))] = E[U(0)].$

== Exercises about local martingales

*Example (local martingale bounded from above):* Let $(X_k)_(k in NN_0)$ be a local martingale.  Let $(Y_k)_(k in NN_0)$ s.t. $|X_j| <= Y_k$ for every $j <= k, Y_k in L^1$.  Show that $X$ is a martingale.

_Proof sketch_: Since $X$ is a local martingale, there exists a localising sequence $(tau_n)_(n in NN)$  s.t. $X^(tau_n)$ is a martingale.

We need:
- $X$ is adapted (free from local martingale)
- $X_k in L^1$: from $E[ |X_k| ] <= E[ |Y_k| ] < infinity$.
- $E[X_(k+1) | cal(F)_k] = E[lim_(n -> infinity) X_((k+1) and tau_n) | cal(F)_k]$.  Take the limit out of the conditional expectation (possible thanks to the *dominated convergence theorem*: _if the process is bounded from above by an integrable r.v., then we can take the limit out_).

$= lim_(n -> infinity) E[X^(tau_n)_(k+1) | cal(F)_k] = lim_(n->infinity)X_k^(tau_n) = X_k quad P$-a.s.  $qed$

From the same proof holds that all integrable local martingales in discrete time are true martingales: take $Y_k := sum_(j=1)^k |X_j|$ be the upper bound.

*Example (local martingale $>= 0$):* $X=(X_k)_(k in NN_0)$ is a local martingale, $X>=0 quad P$-a.s., then $X$ is a true martingale.

_Proof sketch_: Use the *Fatou's lemma* to show integrability:

$ E[ |X_k| ] = E[lim_(n->infinity) |X_(k and tau_n)| ] = E[lim_(n->infinity) X_(k and tau_n) ] <= liminf_(n -> infinity) E[X_(k and tau_n)] = liminf_(n -> inf) E[X_(0 and tau_n)] = 0. $

*Exercise 3.3* was a exam question last year and has the same structure (correction written there as feedback).