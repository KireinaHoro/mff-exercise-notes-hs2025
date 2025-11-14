#import "template.typ": *
#import "@preview/ouset:0.2.0": *
#import "@preview/physica:0.9.5": *
#import "@preview/diagraph:0.3.6": raw-render

= Exercise 9

Session started with feedback on Ex. Sheet 8.  These are recorded inline in the attempt sheet.

== Related exercises

*Ex. 1*. Let $(W_t)_(t>=0)$ be a BM.  Let 

$
  A_infinity := integral_0^infinity exp(sigma W_t + m t) dd(t), sigma > 0, m < -sigma^2/2.
$

1. Calculate $E[A_infinity]$.

  _Solution sketch_.

  $
    E[A_infinity] &= E[integral_0^infinity exp(sigma W_t + m t) dd(t) ] \
    &= integral_0^infinity E[exp(sigma W_t + m t)] dd(t)  && quad "(D.C.T.)" \
    &= integral_0^infinity exp(sigma^2/2 t + m t) dd(t) && quad "(" exp(sigma W_t - sigma^2/2 t) "is a martingale)" \
    &= -(sigma^2/2 + m)^(-1). 
  $

2. Show that $A_infinity ouset(=, d) B_infinity := 1/sigma^2 integral_0^infinity exp(W_t + m/sigma^2 t) dd(t).$ 

  _Solution sketch_.  Let $u := sigma^2 t$

  $
    A_infinity &ouset(=, d) integral_0^infinity exp(sigma (W_(sigma^2 t) / sigma) + m t) dd(t) && quad "(".1/sigma W_(sigma^2 t) "is a BM)" \
    &= integral_0^infinity exp (W_(sigma^2 t) + m t) dd(t) \
    &= integral_0^infinity exp (W_u + m u/sigma^2) 1/sigma^2 dd(u).
  $

== Exercises about $[M]$ and $al M ar$.

#definition[
  Let $M$ be a local martingale null at 0.  The *optional quadratic variation* $[M]$ is the unique, adapted, increasing, RCLL process null at zero s.t.
  - $Delta [M] = (Delta M)^2$, and
  - $M^2 - [M]$ is a local martingale.
]

*Ex. 2* _(multiple choice)_. Let $W$ a BM, $N$ a Poisson process.

1. Define $M$ s.t. $M_t = sum_(k=0)^N_t (W_(k+1) - W_k)$.  Which of the following is correct?
  1. $[M]_t = sum_(k=0)^N_t (W_(k+1)-W_k)^2, [M]_0 = 0.$
  2. $[M]_t = N_t.$
  3. $[M]_t = N_t W_(N_t + 1)^2.$
  
  _Solution sketch_: compute

  $Delta M_t &= sum_(k=0)^N_t (W_(k+1)-W_k) - sum_(k=0)^N_(t-)(W_(k+1)-W_k) \
&= cases(
  0 & quad "if" Delta N_t = 0,
  W_(N_t+1)-W_N_t &quad "if" Delta N_t = 1
) = (W_(N_t+1)-W_N_t) Delta N_t.$

  Compute $Delta [M]_t$ for the three options:

  - $Delta[M]_t = (W_(N_t+1)-W_N_t)^2 Delta N_t$
  - $Delta[M]_t = Delta N_t$
  - $Delta[M]_t = N_t W_(N_t+1)^2 - N_(t-) W_(N_(t-)+1)^2$

2. Which of the following process is not a martingale?
  1. $X_t = N_t^2 - [N]_t$
  2. $X_t = W_t^2 - t$
  3. $X_t = t^2W_t^2 - t^3$

  _Solution sketch_: First two are martingales (_need to prove $N$ is a local martingale_).  The last one is not:

$E[t^2 W_t^2 - t^3 | cal(F)_s] = t^2 E[W_t^2 - t|cal(F)_s] = t^2 (W_s - s) != s^2 W_s^2 - s^3.$

3. $M$ is a local martingale. Which one is not true?
  1. $[M]$ is $P$-a.s. increasing and RCLL;
  2. there exists an increasing function $g : RR_+ -> RR_+$ s.t. $[M]_t = g(t) forall t >= 0$ (like with BM);
  3. the paths of $[M]$ are of finite variation $P$-a.s.
  
  _Solution sketch_.  First and third one are correct obviously.  A counterexample for the second one is the Poisson process.

== Tips for Ex. Sheet 9

*Ex. 9.3*. $M$ is a local martingale.

1. Show that if $M$ is uniformly bounded from below, $M$ is a true supermartingale.

  _Hint_.  $M$ needs to be integrable and satisfy the martingale property.  Consider $E[lim_(n->infinity) |M^(tau_n)_t| ]$ with D.C.T. and $E[lim_(n->infinity) M^(tau_n)_t | cal(F)_s]$ with Fatou's lemma.

2. Show that if $sup_(t in [0,T]) |M_t| in L^2$ for some $T > 0$, then $M$ is a true martingale on $[0,T].$

  _Hint_.  Use D.C.T. and the $sup$ as the bounding sequence.
  
== Old exam question

*Ex 3*. Let $M$ be a square-integrable martingale s.t. $M_t - M_s perp cal(F)_s$, $M_t - M_s ouset(=, d) M_(t-s)$ for $t>=s$, and
$E[M_t^2] = t E[M_1^2]$.  Show that $al M ar = t E[M_1^2].$ 

  _Solution sketch_.  Recall the definition of $al M ar$:

  #definition[
    For square-integrable martingale $M$, there exists a unique increasing predictable integrable $al M ar$ s.t. $[M] - al M ar$ is a martingale.
  ]
  
  Hence $M^2 - al M ar$ is a martingale.  Let $A := t E[M_1^2]$, we need to show $M^2-A$ is a martingale, i.e. $E[M_t^2 - M_s^2 | cal(F)_s] = E[A_t-A_s | cal(F)_s].$

  $"LHS" &= E[(M_t - M_s)^2 | cal(F)_s] && quad "(" M "square integrable)" \
  &= E[(M_t - M_s)^2] && quad "(independence)" \
  &= E[M_(t-s)^2] = (t-s) E[M_1^2] = A_t - A_s. quad qed
  $