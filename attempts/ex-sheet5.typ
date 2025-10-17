#import "../template.typ": *
#import "exsheet-template.typ": *
#import "@preview/physica:0.9.5": *
#import "@preview/ouset:0.2.0": *
#import "@preview/diagraph:0.3.6": raw-render

#show: exsheet.with(5)

#exercise() Let $(Omega, cal(F), P)$ be a probability space with filtration $FF = (cal(F)_k)_(k in NN_0)$.  Let $X = (X_k)_(k in NN_0)$ be an adapted and integrable process.

1. Find the _Doob decomposition_ of $X$, i.e.~prove that there exist a martingale $M = (M_k)_(k in NN_0)$ and an integrable and predictable process $A = (A_k)_(k in NN_0)$ that are both null at zero and such that

$ 
  X = X_0 + M + A quad P"-a.s."
$

#attempt[
  Define $A$ and $M$ as follows:

  $
    A_n = sum_(k=1)^n (E[X_k | cal(F)_(k-1)] - X_(k-1)) \
    M_n = X_0 + sum_(k=1)^n (X_k - E[X_k | cal(F)_(k-1)])
  $
  
  Easy to see that $A_n$ is predictable since it's always $cal(F)_(n-1)$-measurable.
  
  Easy to see that $M_n$ is adapted since it's always $cal(F)_n$-measurable.  Since $X$ is integrable, so is $M$.  The martingale property
  $E[M_n - M_(n-1)| cal(F)_(n-1)] = E[ X_n - E[X_n | cal(F)_(n-1)] | cal(F)_(n-1)] = 0$
  holds.  $qed$
]

2. Prove that $M$ and $A$ are $P$-a.s.~unique.

#attempt[
  Assume there exists another decomposition $X = X_0 + M' + A'$ that also satisfies $M'$ is a martingale and $A'$ is predictable.  Let $Y := M - M' = A' - A$, easy to see that $Y$ is a martingale and also predictable.  Then $E[Y_n | cal(F)_(n-1)] = Y_(n-1) = Y_n quad forall n in NN_+$.

  Since $A$ and $M$ are both null at zero, $Y_0 = M_0 - M'_0 = 0 = E[Y_1 | cal(F)_0] = Y_1$.  Iteratively this shows $Y equiv 0 quad P$-a.s., hence $M$ and $A$ are unique. $qed$
]

3. Suppose that the increments $(Delta X_k)_(k in NN)$ of $X$ are i.i.d.~with respect to $FF$.  Find $M$ and $A$ explicitly.

#attempt[
  Since $Delta X_n$ are i.i.d.~$forall n in NN_+$, $E[Delta X_n | cal(F)_(n-1)] = E[Delta X_n]$ is a constant $c$.

  $A_n = sum_(k=1)^n E[X_k - X_(k-1) | cal(F)_k-1] = sum_(k=1)^n E[ Delta X_k | cal(F)_(k-1) ] = n dot.op c. \
  M_n = X_n - n dot.op c.
  $
]

#exercise() Let $(Omega, cal(F), P)$ be a probability space with filtration $FF = (cal(F)_k)_(k=0,1,...,T)$.  Let $Q$ be a probability measure on $(Omega, cal(F))$ such that $Q approx P$, and let $Z = (Z_k)_(k=0,1,...,T)$ be the density process of $Q$ with respect to $P$.

1. Show that $1/Z$ is a positive $Q$-martingale with $E_Q [1/Z_0] = 1$.

#attempt[
  
]