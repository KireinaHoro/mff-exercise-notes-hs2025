#import "template.typ": *
#import "@preview/ouset:0.2.0": *
#import "@preview/physica:0.9.5": *
#import "@preview/diagraph:0.3.6": raw-render

= Exercise 11

== Recap: definition of the stochastic integral

#definition[
  $(Omega, cal(F), P)$ with $FF = (cal(F)_t)_(t>=0)$ satisfying the usual conditions.

  - $M$ is a local martingale null at 0, RCLL.
  - $H$ is predictable.

  Define $integral_0^t H_s dd(M_s)$ given $t >= 0$.
]

_Step 1_.  Given $H in b cal(E)$: 
$
  H = sum_(i=0)^(n-1) h_i bb(1)_((t_i, t_(i+1)]), h_i "bounded and " cal(F)_t_i "measurable".
$

$
  integral_0^t H_s dd(M_s) := sum_(i=0)^(n-1) h_i (M_(t_(i+1) and t) - M_(t_i and t)).
$

_Step 2_.  Given $M in cal(M)_0^2, H in L^2(M)$: $H$ is predictable and

$
  sqrt(E[integral_0^infinity H^2_s dd(\[M]_s)]) < infinity.
$

Define as the limit in the dense space $b cal(E)$.

_Step 3_. Given $M in cal(M)^2_(0,"loc"), H in L^2_"loc" (M)$: $H$ is predictable and

$
  integral_0^t H^2_s dd(\[M]_s) < infinity quad P"-a.s."
$

This is equivalent to the condition in _step 2_.  Expectation is finite easily implies this condition; for the other direction, take stopping times

$
  tau_n := inf{t >= 0 : integral_0^t H^2_s dd(\[M]_s) >= n}.
$

_Extension to semimartingales_.  $X$ is a semimartingale, $X = X_0 + M + A$ where $M in cal(M)^2_(0,"loc")$ and $A$ predictable.

== Feedback on Ex. 10

Recorded inline in the attempt sheet.

== Example exercise of using Ito's formula

Write $t^2 W_t$ as a stochastic integral.  Consider $f(t, x) = t^2 x$.  $partial_t f = 2 t x, partial_x f = t^2, partial^2_(x x) f = 0.$

$t^2 W_t = f(t, W_t)$ stays a semimartingale.

$
  t^2 W_t = f(t, W_t) &= 0 + integral_0^t 2s W_s dd(s) + integral_0^t s^2 dd(W_s) + 1/2 integral^t_0 partial^2_(x x) f(s, W_s) dd(s) \
  &= integral_0^t 2s W_s dd(s) + integral_0^t s^2 dd(W_s)
$

is not a local martingale.