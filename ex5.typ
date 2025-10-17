#import "template.typ": *
#import "@preview/physica:0.9.5": *

= Exercise 5

Take probability space $(Omega, cal(F), P)$.

== Useful results

=== Jensen inequality

#theorem[
  Let $X$ be a real-valued integrable r.v.~and $f : RR -> RR$ a convex function.  Then,
  $
    f(E[X]) <= E[f(x)].
  $
]

_Also holds for conditional expectations._

=== Fatou's lemma

#theorem[
  Let $(X_k)_(k in NN)$ be a sequence of nonnegative r.v.  Then,
  $
    E[liminf_(n->infinity) X_n] <= liminf_(n -> infinity) E[X_n].
  $
]

_No need to say $X_k$ is integrable since they are nonnegative and can always be integrable._

_Same result if the r.v.~is bounded from below i.e.~$X_n >= -a => X_n + a >= 0$._

=== Monotone convergence theorem

#theorem[
  Let $(X_n)_(n in NN)$ be a sequence of r.v.~s.t.~$0<=X_1 <= X_2 <= ... <= X_n <= X_(n+1) <= ...$
  Let $X$ s.t.~$X_n -> X quad P$-a.s.
  Then,
  $
    E[lim_(n->infinity) X_n] = lim_(n->infinity) E[X_n].
  $
]

=== Dominated convergence theorem

#theorem[
  Let $(X_n)_(n in NN)$ be a sequence of r.v.~s.t.~$|X_n| <= Y$ where $Y$ is an integrable r.v.
  Let $X$ s.t.~$X_n -> X quad P$-a.s.
  Then,
  $
    E[X] = E[lim_(n->infinity) X_n] = lim_(n->infinity) E[X_n].
  $
]

== Solving exercise sheet 4.3

Notes recorded inline as feedback.

== Tips for exercise sheet 5.3 c)

Try to compute the density of $Y$ given the measure $Q$.  Density can be computed by:

$
  "d" / dd(t) Q[Y <= t] = "d"/dd(t) E[Z bb(1)_{Y <= t}]
$

Use $Y tilde.op cal(N)(0, 1).$