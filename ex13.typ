#import "template.typ": *
#import "@preview/ouset:0.2.0": *
#import "@preview/physica:0.9.5": *
#import "@preview/diagraph:0.3.6": raw-render

= Exercise 13

== Exam composition

5 problems:

- multiple choice
- discrete time model (binomial model), with topics on filtration, equivalent martingale measure, no arbitrage, complete market, hedging
- discrete or continuous time model
- discrete or continuous time model
- hedging in continuous time

== Hedging in continuous time

Bank account and stock:

$
  dd(tilde(S)^0_t) = tilde(S)^0_t r dd(t),\
  dd(tilde(S)^1_t) = tilde(S)^1_t (mu dd(t) + sigma dd(W_t)),\
  S^1 = tilde(S)^1 / tilde(S)^0.
$

Hedge (replicate) any payoff $phi(S)$ with $V_0 = E_(Q^*) [phi(S)]$.  Steps:

- Find $S$
- Find EMM $Q^* -> W^*$
- Find $V_0 = E_(Q^*) [dot]$:

  $V_t = E_(Q^*) [phi(S)_T | cal(F)_t]$
  
_Find $S$_.  Let $f(x, y) := x/y$.  $[tilde(S)^dot_t, tilde(S)^0_t] = 0$.

$
  dd(S_t) &= 1/tilde(S)^0_t dd(tilde(S)^1_t) - tilde(S)^1_t / (tilde(S)^0_t)^2 dd(tilde(S)^0_t) \
  &= S_t (mu dd(t) + sigma dd(W_t)) - S_t r dd(t) \
  &= S_t (sigma dd(W_t) + (mu - r) dd(t)) \
  => S_t &= S_0 exp(sigma W_t + (mu - r - sigma^2/2) dd(t)).
$

Useful trick: take $Y_t := log(S_t), f(x) = log(x), f' = 1/x, f''= 1/x^2$.

$
  dd(Y_t) &= 1/S_t dd(S_t) - 1/2 1/S_t^2 dd(\[S]_t) \
  &= (sigma dd(W_t) + (mu - r) dd(t)) - 1/2 dd(\[sigma W_t]) \
  &= sigma dd(W_t) + (mu - r - sigma^2/2) dd(t).
$

_Find EMM $Q^*$_.  $Z_t = dd(Q)/dd(P)|_t = cal(E)(-integral_0^t psi_s dd(W_s) =: cal(E)(L)$.

Apply Girsanov: $W$ is a $P$-BM $=> tilde(W) := W - [L, W]$ is a $Q$-BM.  In our case, set $psi_s = (mu - r)/sigma$, which we can obtain via 

$
  dd(tilde(W)) = dd(W) + psi_t dd(t) \
  => dd(S_t) = S_t (sigma (dd(tilde(W)_t) - psi_t dd(t)) + (mu - r) dd(t)) \
  => mu - r - psi_t sigma = 0.
$

Hence

$
  dd(S_t) = S_t sigma dd(tilde(W)_t) => S_t = S_0 exp(sigma tilde(W)_t - 1/2 sigma^2 t).
$

_Find the replication strategy_.  Take $phi(S) = (S_T)^alpha.$

$
  V_0 &= E_(Q^*) [phi(S)] = E_(Q^*) [S_T^alpha] \
  &= E_(Q^*) [exp(sigma alpha tilde(W)_t - alpha sigma^2 1/2 t)] \
  &= exp(1/2 sigma^2 alpha^2 - alpha sigma^2 1/2 t) = exp(t/2 sigma^2 alpha (alpha-1)).
$

== Exam hedging example.

Take $tilde(S)^0_0 = 1, tilde(S)^1_0 = s > 0$.

1. $Z_t = log(tilde(S)^0_t + tilde(S)^1_t)$.  Find the SDE with only these random variables: $Z, r t$.

  _Solution sketch_. Let $Delta := tilde(S)^0_t + tilde(S)^1_t$.

  $
    dd(Z_t) &= 1/Delta (dd(tilde(S)^0_t) + dd(tilde(S)^1_t)) - 1/2 1/Delta^2 (dd(\[tilde(S)^0]_t) + dd(\[tilde(S)^1]_t) + 2dd(\[tilde(S)^0\,tilde(S)^1]_t)) \
    &= 1/Delta (tilde(S)^0_t r dd(t) + tilde(S)^1_t (u-r) dd(t)) - 1/(2 Delta^2) ((tilde(S)^1_t)^2 sigma^2 dd(t)).
  $

  Substitute in $exp(Z_t) = tilde(S)^0_t + tilde(S)^1_t, tilde(S)^0_t = exp(r t) => tilde(S)^1_t = exp(Z_t) - exp(r t)$.

2. Hedge $tilde(H)_n = (tilde(S)^1_t)^(1/n)$.

  _Solution sketch_.  Take $Q$ EMM, let $Z_t := cal(E)(-integral_0^t (mu - r)/sigma dd(W_s)), dd(Q)/dd(P)|_t = Z_t.$

  Apply Girsanov, $tilde(W) := W_t + (mu - r)/sigma t$ is a $Q$-Brownian motion. $dd(S_t) = S_t (sigma dd(tilde(W)_t)) => Q in PP_"e,loc" (S).$

  Given $tilde(S)^0_t = exp(r t), tilde(S)^1_t = exp(sigma tilde(W)_t - 1/2 sigma^2 t)$, find $V^(H^n)_t$:

  $
    V^(H^n)_t &= E_Q [(tilde(S)^1_T)^(1/n) | cal(F)_t] \
    &= E_Q [(S_T)^(1/n) (tilde(S)^0_T)^(1/n) | cal(F)_t] \
    &= exp(r/n) E_Q [exp(sigma tilde(W)_T - 1/2 sigma^2 T) | cal(F)_t] \
    &= exp(r/n) E_Q [exp(sigma (tilde(W)_T - tilde(W)_t) + sigma tilde(W)_t  - 1/2 sigma^2 T) | cal(F)_t] \
    &= exp(r/n - 1/2 sigma^2 T + sigma tilde(W)_t + 1/2 sigma^2(T-t)) \
    &= exp(r/n - 1/2 sigma^2 t + sigma tilde(W)_t).
  $

3. Let $X_t := integral_0^t W_s dd(W_s) (= (W_t^2 - t)/2)$, where $W$ is a $P$-BM.  Let $dd(hat(Q))/dd(P) = cal(E)(X)_t = cal(E)(integral_0^t W_s dd(W_s))$.  Find SDE of $tilde(S)^1$ under $hat(Q)$-BM and show that $E_(hat(Q)) [W_t] = 0.$

  _Solution sketch_.  Let

  $
    hat(W)_t &:= W_t - [integral_0^t W_s dd(W_s), W_s] \
    &= W_t - integral_0^t W_s dd(s) => dd(hat(W)_t) = dd(W_t) - W_t dd(t). \
    dd(tilde(S)^1_t) &= tilde(S)^1_t ((mu - r) dd(t) + sigma dd(W_t)) \
    &= tilde(S)^1_t ((mu - r + W_t) dd(t) + sigma dd(hat(W)_t)). \

    f(t) := E_(hat(Q)) [W_t] &= E_hat(Q) [hat(W)_t + integral_0^t W_s dd(W_s)] \
    &= integral_0^t E_Q [hat(W)_s] dd(W_s)
  $
  
  We can see $f(t) = integral_0^t f(s) dd(s), f(0) = 0 => f(t) = c exp(t) = 0.$
  
== Hull-White of BS
