#import "../template.typ": *
#import "exsheet-template.typ": *
#import "@preview/physica:0.9.5": *
#import "@preview/ouset:0.2.0": *
#import "@preview/diagraph:0.3.6": raw-render

#show: exsheet.with(10)

#exercise() Consider a probability space $(Omega, cal(F), P)$ with a filtration $FF=(cal(F)_t)_(t>=0)$ satisfying the usual conditions.  Let $b > 0$.  Let $W = (W_t)_(t>=0)$ be a Brownian motion with respect to $FF$ and $tau: Omega -> [0, infinity]$ the function given by

$
  tau := inf{t>0:W_t>b}.
$

1. Show that $tau$ is a stopping time.

#attempt[
  We need to show that ${tau <= s} in cal(F)_s quad forall s>=0$.  We claim that
  
  $
    {tau <= t} = union.big_(q in (0, t] inter QQ) {W_q > b}.
  $
  
  This holds due to:
  - LHS $subset.eq$ RHS: $tau <= t => exists s <= t : W_s > b$.  Since $W$ has continuous trajectories, there exists a left-open neighborhood i.e. $exists delta "s.t." forall s' in (s-delta, s] : W_s' > b.$   As $QQ$ is dense, we can always find a $q in QQ inter (s-delta, s]$ where $W_q > b$.
  - RHS $subset.eq$ LHS: obvious, if $exists q in (0, t] inter QQ$ already holds $W_q > b$, then by definition $tau < t$.

  RHS of our claim is a countable union of sets in $cal(F)_t$ due to $W_q$ being measurable in $cal(F)_t$ given $q <= t$.  Hence LHS is also in $cal(F)_t$. $qed$

  _Note to TA: somehow I didn't use the right continuity of the filtration -- what's wrong?_
]

2. Compute the probabilities $P[tau > 0]$ and $P[tau < infinity]$.

#attempt[
  $P[tau > 0] = 1 - P[tau = 0] = 1 - P[W_0 > b] = 1.$

  $P[tau < infinity] = 1 - P[tau = infinity] = 1 - P[W_t <= b "for all" t] = 1.$
]

3. Find a predictable process $H = (H_t)_(t >= 0)$ satisfying both following properties:
  - $0 < integral_0^infinity H^2_t dd(t) < infinity quad P$-a.s
  - $integral_0^infinity H_t dd(W_t) = b quad P$-a.s.
  
#attempt[
  Take $H = bb(1)_{tau <= t}$.  Verify that:
  - $H$ is predictable due to $tau$ being a stopping time (as proved in (a)).
  - $integral_0^infinity H_t^2 dd(t) = integral_0^infinity bb(1)_{tau <= t}^2 dd(t) = integral_0^tau 1 dd(t) = tau in (0, infinity).$
  - $integral_0^infinity H_t dd(W_t) = integral_0^tau dd(W_s) = W_tau = b.$
]

#exercise() Consider a probability space $(Omega, cal(F), P)$ with a filtration $FF=(cal(F)_t)_(t>=0)$ satisfying the usual conditions.  Let $W = (W_t)_(t>=0)$ be a Brownian motion with respect to $FF$.

1. For any $m in NN$, prove that $(integral_0^t W_s^m dd(W_s))_(t>=0)$ is a square-integrable martingale, but not in $cal(M)_0^2$.

#attempt[
  Let $A^m_t := integral_0^t W_s^m dd(W_s)$.  Since $W^m$ is a square-integrable martingale, the integral is also a square-integrable martingale.
  
  Per Ito's isometry and dominated convergence,

  $
  E[(A^m_t)^2] &= E[integral_0^t W_s^(2m) dd(s)] \
   &= integral_0^t E[W_s^(2m)] dd(s) quad "is a polynomial of degree " m+1.
  $

  Thus $sup_(t in (0,infinity)) E[(A^m_t)^2] = infinity, A^m in.not cal(M)_0^2. quad qed$ 
]
2. For any local martingale $M = (M_t)_(t>=0)$ null at 0 and any stopping time $tau$, prove that $[M^tau] = [M]^tau$.

#attempt[
  We first consider when $M$ is a bounded martingale:

  Per definition of the square bracket, $(M^tau)^2 - [M^tau]$ is a martingale.

  In addition, $(M^tau)^2 - [M]^tau = M^2_(tau and t) - [M]_(tau and t)$ is also a martingale.  Since the bracket is unique,
  $[M^tau] = [M]^tau$.

  When $M$ is a local martignale, take $tau_n$ the localising sequence for $M$.

  $M^(tau_n)$ is a bounded martingale, hence $[M^(tau_n)]^tau = [(M^(tau_n))^tau] = [(M^tau)^(tau_n)]$.
  Take $n->infinity$ and apply M.C.T, we have $[M^tau]= [M]^tau$ when $M$ is a local martingale. $qed$
]

#exercise() Consider a probability space $(Omega, cal(F), P)$ with a filtration $FF=(cal(F)_t)_(t>=0)$ satisfying the usual conditions.  Let $W = (W_t)_(t>=0)$ and $B = (B_t)_(t>=0)$ be two independent Brownian motions.  Fix some constant $T > 0$.

1. Consider the process $X = (X_t)_(t>=0)$ defined by

  $
    X_t := integral_0^t s dd(W_s) + B_t.
  $
  
  Show that $X^T = (X_(t and T))_(t>=0) in cal(M)^2_0.$

#attempt[
  For $X^T in cal(M)^2_0$:
  - $X^T_0$ is a martingale starting at zero: obvious for $B$.  The stochastic integral with integrator $W$ is also a martingale starting at zero.
  - $sup_(t in [0, T]) E[(dot)^2] < infinity$:
    - for $B$: apply the Doob's maximal inequality with $p=2$ $sup E[B^2] <= 4 E[B_T^2] = 4T < infinity$.
    - for $integral_0^t s dd(W_s)$: apply the same inequality and Ito's isometry. $<= 4 E[(integral_0^T s dd(W_s))^2] = 4 integral_0^T s^2 dd(s) = 4T^3/3 < infinity.$
  Hence $sup E[(integral_0^t s dd(W_s) + B_s)^2] <= sup E[B^2] + sup E[(integral s dd(W_s))^2] < infinity.  quad qed$
]

2. Prove that $[X]_t = t^3/3 + t quad P$-a.s., for $t>=0$.

#attempt[
  $
    [X]_t &= [integral_0^t s dd(W_s)] + [B]_t + 2[integral_0^t s dd(W_s), B_t] \
          &= integral_0^t s^2 dd(s) + t + integral_0^t s dd(\[W_s\, B_s])\
          &= t^3 / 3 + t. quad  qed
  $
]

3. Deduce that $E[(X_T)^2 | cal(F)_t] = X_t^2 + (T^3-t^3)/3 + (T-t) quad P$-a.s., for $t in [0,T].$

#attempt[
  $
    E[(X_T^2) | cal(F)_t] &= E[(X_t + X_T - X_t)^2 | cal(F)_t] \
    &= X_t^2 + 2 X_t E[X_T - X_t | cal(F)_t] + E[(X_T - X_t)^2 | cal(F)_t] \
    &= X_t^2 + E[(X_T - X_t)^2] && quad (X_T - X_t perp cal(F)_t, "mean" 0) \
    &= X_t^2 + E[(B_T - B_t)^2] + E[(integral_t^T s dd(W_s))^2] && quad (B perp W) \
    &= X_t^2 + (T-t) + (T^3-t^3)/3.  quad qed
  $
]