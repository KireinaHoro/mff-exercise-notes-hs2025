#import "../template.typ": *
#import "exsheet-template.typ": *
#import "@preview/physica:0.9.5": *
#import "@preview/ouset:0.2.0": *
#import "@preview/diagraph:0.3.6": raw-render

#show: exsheet.with(8)

#exercise() Let $W = (W_t)_(t>=0)$ be a Brownian motion defined on some probability space $(Omega, cal(F), P)$ with a filtration $FF := (cal(F)_t)_(t>=0)$ satisfying the usual conditions.

1. Introduce the adapted process $(Z_t)_(t>=0)$ defined by
  $
    Z_t := W_t - integral_0^t W_u/u dd(u).
  $

  Show that it is not a Brownian motion with respect to the filtration $FF$.

#attempt[
  Three properties of BM:
  - $Z_t$ is $cal(F)_t$-measurable: follows easily.
  - $Z_t$ is null at zero: $Z_0 = W_0 - integral_0^0 W_u/u dd(u) = 0$.
  - $Z_t$ is continuous: follows by both $W_t$ and the integral being continuous.
  - $Z_t$ has independent increments in $FF <=> Z_t - Z_s perp cal(F)_s$ given $t >= s$.  This does *not* hold -- given $t > s >= v > 0$,
    $
      E[(Z_t-Z_s)W_v] &= E[W_v (W_t - W_s - integral_s^t W_u/u dd(u))] \
      &= -E[W_v integral_s^t W_u/u dd(u)] \
      &= -E[W_v integral_s^t (W_u - W_v)/u dd(u) + integral_s^t W_v^2/u dd(u)] \
      &= -(E[integral_s^t (W_v (W_u - W_v))/u dd(u)] + E[W_v^2] integral_s^t 1/u dd(u)) \
      &= -(integral_s^t E[W_v (W_u - W_v)]/u dd(u) + v/2(1/s^2 - 1/t^2)) quad "(D.C.T.)" \
      &= -v/2(1/s^2 - 1/t^2) < 0.
    $

  Hence $Z_t$ is not a BM in $FF. quad qed$
]

2. Let $t >= 0$.  Prove, without explicitly computing the values, that
  $
    E[sup_(s in [0,t]) W_s] = sqrt(t) E[sup_(s in [0,1]) W_s].
  $

#attempt[
  $
    sup_(s in [0,t]) W_s &= sup_(s in [0,1]) W_(t s) \
    &ouset(=, d) sup_(s in [0,1]) sqrt(t) dot W_s.
  $
  Hence the equality holds. $qed$
]

#exercise() Let $W = (W_t)_(t>=0)$ be a Brownian motion defined on some probability space $(Omega, cal(F), P)$ with a filtration $FF := (cal(F)_t)_(t>=0)$ satisfying the usual conditions.  For some constants $S_0 > 0, m in RR$ and $sigma > 0$, we define the geometric Brownian motion $S = (S_t)_(t>=0)$ as

$
  S_t := S_0 e^(m t + sigma W_t).
$

1. Compute $lim_(t->infinity) S_t$ when $m != 0$.  Determine whether the limit exists if $m = 0$.

#attempt[
  Let $f(t) := m t + sigma W_t = t(m + sigma W_t / t)$.  Under the law of large numbers for BMs, $sigma W_t/t -> 0$ for $t -> infinity => exists T > 0$ s.t. $|sigma W_t/t| < (|m|)/2, forall t>T$.

  Take $m > 0$: $f(t) >= t m/2 -> infinity, forall t > T => lim_(t->infinity) S_t = S_0 lim_(t->infinity) exp(f(t)) = +infinity$.

  Take $m < 0$: $f(t) <= t m/2 -> -infinity, forall t > T => lim_(t->infinity) S_t = S_0 lim_(t->infinity) exp(f(t)) = 0$.

  When $m=0$:

  - $liminf_(t->infinity) S_t = S_0 liminf_(t->infinity) exp(sigma W_t) = 0$;
  - $limsup_(t->infinity) S_t = S_0 limsup_(t->infinity) exp(sigma W_t) = infinity$.

  Hence the limit does not exist.
]

2. Under which conditions on $m$ and $sigma$ is $S$ a sub-/super-/martingale?

#attempt[
  Given $t > u >= 0$:

  $E[S_t / S_u | cal(F)_u] &= E[exp(m(t-u) + sigma(W_t - W_u)) | cal(F)_u] quad quad quad \
  &= exp(m(t-u)) E[exp(sigma (W_t - W_u))]  && (W_t - W_u perp cal(F)_u) \
  &= exp(m(t-u)) exp(1/2 (t-u) sigma^2) && "(mgf of " W_t-W_u ~ N(0, t-u) ")"\
  &= exp((t-u)(m+1/2 sigma^2)) =: g(m, sigma).$

  For $S$ to be a:
  - supermartingale: $g(m, sigma) <= 1 => m + 1/2 sigma^2 <= 0 => m <= -1/2 sigma^2;$
  - submartingale: $g(m, sigma) >= 1 => m + 1/2 sigma^2 >= 0 => m >= -1/2 sigma^2;$
  - martingale: $g(m, sigma) = 1 => m + 1/2 sigma^2 = 0 => m = -1/2 sigma^2.$

  _Note to TA: can we directly invoke the moment-generating function?  Or do we have to calculate $E[exp(sigma(W_t-W_u))]$ as an integral?_
]

3. Suppose that $S$ is a martingale.  Show that
  $
    lim_(t->infinity) E[S_t] != E[lim_(t->infinity) S_t].
  $

#attempt[
  $lim_(t->infinity) E[S_t] &= S_0 lim_(t->infinity) exp(m t) E[exp(sigma W_t)] \
  &= S_0 lim_(t->infinity) exp(m t) exp(1/2 t sigma^ 2) \
  &= S_0 lim_(t->infinity) exp(t(m + 1/2 sigma^2)) = S_0 != 0.$

  $E[lim_(t->infinity) S_t] = 0$ from (a).  $qed$
]

#exercise() Let $W = (W_t)_(t>=0)$ be a Brownian motion defined on some probability space $(Omega, cal(F), P)$ with a filtration $FF := (cal(F)_t)_(t>=0)$ satisfying the usual conditions.

1. Let $f: RR->RR$ be an arbitrary convex function.  Show that if the process $(f(W_t))_(t>=0)$ is integrable, then it is a submartingale.

#attempt[
  Since $f(W_(dot))$ is integrable, $E[ |f(W_t)| ] < +infinity => E[f(W_t)]$ exists.

  Given $0 <= u < t$ and $f$ convex:

  $E[f(W_t) | cal(F)_u] &>= f(E[W_t | cal(F)_u]) \
  &= f(E[W_t - W_u | cal(F)_u] + E[W_u | cal(F)_u]) \
  &= f(W_u). quad qed$
]

#feedback[
  Need to prove that $(f(W_t))_(t>=0)$ is adapted!
]

2. Given a martingale $(M_t)_(t>=0)$ and a measurable function $g: RR_+ -> RR$, show that the process
  $
    (M_t + g(t))_(t>=0)
  $
  is a supermartingale if and only if $g$ is decreasing, and a submartingale if and only if $g$ is increasing.

#attempt[
  Given $0 <= u < t$, $psi(g) := E[(M_t + g(t)) - (M_u + g(u)) | cal(F)_u] = g(t)-g(u)$.

  To have a supermartingale $<=> psi(g) = g(t) - g(u) < 0 <=> g$ is decreasing.

  To have a submartingale $<=> psi(g) = g(t) - g(u) > 0 <=> g$ is increasing.  $qed$
]

#feedback[
  Show adaptedness and integrability!
]

3. Show that the following processes are submartingales, but not martingales:
  1. $W^2$.
  #attempt[
    Given $0<=u<t$:

    $E[W_t^2 - W_u^2 | cal(F)_u] &= E[(W_t-W_u)(W_t-W_u+2W_u) | cal(F)_u] \
    &= E[(W_t - W_u)^2 + 2 W_u (W_t - W_u) | cal(F)_u] \
    &= t-u > 0.$

    Hence $W^2$ is a submartingale but not martingale. $qed$
  ]
  
  #feedback[
    If showing submartingale directly, need to show integrability and adaptedness.  Alternatively, use the conclusions from sub questions before:
    - $x |-> x^2$ is convex.
  ]

  2. $e^(alpha W)$ for any $alpha in RR$.

  #attempt[
    Given $0<=u<t$:

    $E[exp(alpha W_t) / exp(alpha W_u) | cal(F)_u] &= E[exp(alpha (W_t - W_u)) | cal(F)_u] \
    &= exp(1/2 alpha^2 (t-u)) > 1.$

    Hence $exp(alpha W)$ is a submartingale but not martingale. $qed$
  ]
  
  #feedback[
    Same as above, use $x |-> exp(alpha x)$ is convex.
  ]