#import "../template.typ": attempt, feedback
#import "exsheet-template.typ": *
#import "@preview/physica:0.9.5": *

#show: exsheet.with(2)

#exercise()

1.

#attempt[

]

2.

#attempt[
  $C(phi)$ is constant over time $<=> Delta C_k (phi) = (phi^0_k - phi^0_(k-1)) S^0 + (theta_k - theta_(k-1)) S^1_(k-1) = 0 quad forall k = 1, ..., T.$
  
  $Delta dash(C)_k (phi) &= (phi^0_k - phi^0_(k-1)) dash(S)^0_(k-1) + (theta_k - theta_(k-1)) dash(S)^1_(k-1) \
  &= D_(k-1) Delta C(phi)$

  $dash(C) (phi)$ is constant over time $<=> Delta dash(C)_k (phi) = 0 <=> Delta C_k (phi) = 0 <=>$ $C(phi)$ is constant over time.  $qed$
]

#exercise() Consider a probability space $(Omega, cal(F), P)$ with a filtration $FF = (cal(F)_n)_(n=0,1,2,...)$ and let $tau,sigma : Omega -> NN union {infinity}$ be stopping times.  Recall that $tau : Omega -> NN union {infinity}$ is a stopping time if ${tau <= k} in cal(F)_k$ for all $k in NN_0 := {0, 1, 2, ...}.$

1. Show that $tau and sigma := min{tau, sigma}$ and $tau or sigma := max{tau, sigma}$ are stopping times.

#attempt[
  ${tau and sigma <= k} = {tau <= k} union {sigma <= k} in cal(F)_k => tau and sigma$ is a stopping time.
  
  ${tau or sigma <= k} = {tau <= k} inter {sigma <= k} in cal(F)_k => tau and sigma$ is a stopping time. $qed$
]

2. Show that $alpha tau$ is also a stopping time for any $alpha in NN$.

#attempt[
  ${alpha tau <= k} = {tau <= k / alpha <= k} in cal(F)_k => alpha tau $ is a stopping time.  $qed$
]

3. Suppose $0 < alpha < 1$.  Is $alpha tau$ a stopping time?

#attempt[
  Not necessarily: take $alpha = 1/2$ and ${tau <= T} in cal(F)_T$, ${tau <= 2T} in.not cal(F)_T.$
]

4. Show that a function $sigma:Omega->NN union {infinity}$ is an $FF$-stopping time if and only if ${sigma = k} in cal(F)_k$ for all $k in NN$.

#attempt[
  Need to show ${sigma <= k} in cal(F)_k quad forall k in NN <=> {sigma = k} in cal(F)_k quad forall k in NN.$

  $=>$: Prove by induction.
  - ${sigma = 0} = {sigma <= 0} in cal(F)_0.$
  - ${sigma <= k - 1} in cal(F)_(k-1) subset.eq cal(F)_k$ and ${sigma <= k} = {sigma <= k-1} union {sigma = k} in cal(F)_k => {sigma = k} in cal(F)_k. quad qed$
  
  $arrow.double.l$: Prove by induction.
  - ${sigma <= 0} = {sigma = 0} in cal(F)_0.$
  - ${sigma <= k-1} in cal(F)_(k-1) subset.eq cal(F)_k$ and ${sigma = k} in cal(F)_k => {sigma <= k} in cal(F)_k. quad qed$
]

5. Show that $tau + sigma$ is a stopping time.

#attempt[
  For all $k_1, k_2 in NN, {tau <= k_1} in cal(F)_(k_1) subset.eq cal(F)_k$ and ${sigma <= k_2} in cal(F)_(k_2) subset.eq cal(F)_k.$

  ${tau + sigma <= k} = union_(k_1 + k_2 = k) {tau <= k_1 and sigma <= k_2} in cal(F)_k. quad qed$
]

6. Suppose $tau >= sigma$.  Is $tau - sigma$ a stopping time?

#attempt[
  Not necessarily: 
]