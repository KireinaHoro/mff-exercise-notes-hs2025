#import "../template.typ": *
#import "exsheet-template.typ": *
#import "@preview/physica:0.9.5": *
#import "@preview/ouset:0.2.0": *
#import "@preview/diagraph:0.3.6": raw-render

#show: exsheet.with(9)

#exercise() Let $(Omega, cal(F), P)$ a probability space.  We consider a sequence $(Y_k)_(k in NN)$ of square-integrable and i.i.d. random variables with

$
  mu := E[Y_1] in RR quad quad "and" quad quad sigma^2 := "Var"[Y_1]>0.
$

We define the process $X=(X_n)_(n in NN_0)$ by

$
  X_n := sum_(k=1)^n Y_k.
$

Let $FF = (cal(F)_k)_(k in NN_0)$ be the filtration given by $cal(F)_0 = {diameter, Omega}$ and $cal(F)_k = sigma(Y_1, ..., Y_k)$ for $k in NN$.  Note that $X$ is adapted to $FF$ and integrable.  Let

$
  X = M + A quad P"-a.s."
$

be the Doob decomposition of $X$ into a martingale $M = (M_n)_(n in NN_0)$ and a predictable and integrable process $A = (A_n)_(n in NN_0)$ that are both null at zero.

1. Show that $M$ and $A$ are square-integrable.

#attempt[
  $X_n = sum_(k=1)^n Y_k$ where $Y_k$ are i.i.d and $~ N(mu, sigma^2) => X_n ~ N(n mu, n sigma^2).$

  Hence $E[X_n^2] = E[A_n^2 + 2 M_n A_n + M_n^2] = n sigma^2 + (n mu)^2 < infinity$.  

  Consider

  $
  Delta (M_n A_n) &= M_n A_n - M_(n-1) A_(n-1)\
  &= M_n A_n - M_n A_(n-1) + M_n A_(n-1) - M_(n-1) A_(n-1)\
  &= M_n Delta A_n + Delta M_n A_(n-1).
  $

  Take expectation on both sides:

  $
    E[Delta (M_n A_n)] &= E[M_n Delta A_n] + E[Delta M_n A_(n-1)] \
    &= E[ Delta A_n E[M_n | cal(F)_0] + E[ A_(n-1) E[Delta M_n | cal(F)_(n-1)] ] && quad "("A "predictable)" \
    &= 0. && quad "(" M "martingale)"
  $

  Hence $E[M_n A_n] = E[M_0 A_0] + sum_(k=1)^n E[Delta (M_k A_k)] = 0.$

  Therefore $E[X_n^2] = E[A_n^2] + E[M_n^2] = n sigma^2 + (n mu)^2 < infinity$, both $M$ and $A$ are square-integrable. $qed$
]

2. Find the optional quadratic variation $[M] = ([M]_n)_(n in NN_0)$ of the square-integrable martingale $M$.

#attempt[
  Per the Doob decomposition:

  $
    M_n &= X_0 + sum_(k=1)^n (X_k - E[X_k | cal(F)_(k-1)]) \
        &= sum_(k=1)^n (X_k - E[Y_k | cal(F)_(k-1)] - E[X_(k-1) |cal(F)_(k-1)]) \
        &= sum_(k=1)^n (Delta X_k - mu) = X_n - n mu.
  $

  Hence

  $
    [M]_n = sum_(k=1)^n (M_k - M_(k-1))^2 = sum_(k=1)^n (Y_k - mu)^2.
  $
]

3. Explicitly derive the predictable quadratic variation $al M ar = (al M ar_n)_(n in NN_0)$ of the square-integrable martingale $M$.

#attempt[
  $al M ar$ is predictable and satisfies $[M] - al M ar$ is a martingale, Hence

  $
    && E[[M]_n - al M ar_n | cal(F)_(n-1)] &= [M]_(n-1) - al M ar_(n-1) \
    => quad && E[[M]_n | cal(F)_(n-1)] - al M ar_n &= [M]_(n-1) - al M ar_(n-1) \
    => quad && Delta al M ar_n &= E[Delta [M]_n | cal(F)_(n-1)] \
    => quad && al M ar_n &= sum_(k=1)^n E[Delta [M]_n | cal(F)_(n-1)] \
    &&&= sum_(k=1)^n E[(Y_n - mu)^2] = n sigma^2.
  $
]

#exercise() Let $(Omega, cal(F), P)$ be a probability space with a filtration $FF = (cal(F)_t)_(t>=0)$ satisfying the usual conditions.

1. Let $X$ be an adapted process and $tau$ a stopping time.  Show that if $X^tau$ is a martingale, then so is $X^sigma$ for any stopping time $sigma$ with $sigma <= tau quad P$-a.s.

#attempt[
  Take $s <= t$.  Since $X^tau := X_(tau and t)$ is a martingale, $E[X_(tau and t) | cal(F)_s] = X_(tau and s)$.

  $
    E[X_(sigma and t) | cal(F)_s] &= E[X_(sigma and tau and t) | cal(F)_s] \
    &= E[X_(tau and (sigma and t)) | cal(F)_s] \
    &= X_(tau and (sigma and t) and s) = X_(sigma and s). quad qed
  $
]

2. Let $M$ and $N$ be two local martingales.  Show that the linear combination $alpha M + beta N$ is a local martingale for any $alpha, beta in RR$.

#attempt[
  Since $M$ and $N$ are local martingales, there exist localising sequences $tau_n, sigma_n$ where $M^(tau_n)$ and $N^(sigma_n)$ are martingales.  Let $gamma_n := tau_n and sigma_n$ is also a sequence of stopping times and $M^(gamma_n)$ and $N^(gamma_n)$ are also martingales (result from (a)).
  Hence $(alpha M + beta N)^(gamma_n)$ is also a martingale, thus $alpha M + beta N$ is a local martingale with $gamma_n$ as the localising sequence.  $quad qed$
]

#exercise() Consider a probability space $(Omega, cal(F), P)$ with a filtration $FF = (cal(F)_t)_(t>=0)$ satisfying the usual conditions.  Let $M = (M_t)_(t>=0)$ be a local martingale null at 0.

1. Suppose that $M$ is uniformly bounded from below.  Show that $M$ is then a supermartingale.

#attempt[
  For $M$ to be a supermartingale:
  - null at 0, adapted: obviously hold since $M$ is a local martingale;
  - integrable: need to show $E[ |M_t| ] < infinity quad forall t >= 0$.

    Take a localising sequence $tau_n$.  Since $M$ is uniformly bounded from below,
    exists a r.v. $Y$ s.t. $M_t >= Y quad forall t >= 0$.
    
    $
      E[M_t] &= E[lim_(n->infinity) M^(tau_n)_t ] \
      &= E[lim_(n->infinity) (M^(tau_n)_t - Y) + Y] \
      &<= liminf_(n->infinity) E[M^(tau_n)_t - Y] + E[Y] && quad "(Fatou)" \
      &= liminf_(n->infinity) E[M^(tau_n)_t] = E[M_0] = 0 < infinity.
    $

    Then we can decompose $M_t$ into $M_t^+ - M_t^-$ s.t. $|M_t| = M_t^+ + M_t^-$.  Since $M_t >= Y$, $M_t^- >= Y^- => E[M_t^-] < infinity => E[M_t^+] < infinity => E[ |M_t| ] < infinity$, $M$ is integrable.

  - martingale property: need to show $E[M_t | cal(F)_s] = M_s quad forall 0 <= s <= t$.
    $
      E[M_t | cal(F)_s] &= E[liminf_(n->infinity) M^(tau_n)_t | cal(F)_s] \
      &<= liminf_(n->infinity) E[M^(tau_n)_t | cal(F)_s] && quad "(Fatou)" \
      &= liminf_(n->infinity) M^(tau_n)_s = M_s. quad qed
    $

  _Note to TA: can we use the $E[M_t|cal(F)_s] = M_s$ to prove integrability?  Intuitively it should be possible to take $s=0$, but $cal(F)_0$ might not be trivial and thus $E[M_t|cal(F)_0]$ need not be $E[M_t]$..._
]

2. Suppose that $M$ satisfies $sup_(0<=t<=T) |M_t| in L^2$ for some $T > 0$. Show that $M$ is then a square-integrable martingale on $[0,T]$.

#attempt[
  Let $A := sup_(0<=t<=T) |M_t|$, we have $E[A^2] < infinity$.

  Take $tau_n$ as the localising sequence of the local martingale $M$.  Given $t in [0,T]$:
  $
    E[M_t^2] &= E[lim_(n->infinity) (M^(tau_n)_t)^2] \
    &= E[lim_(n->infinity) M_(tau_n and t)^2]\
    &= lim_(n->infinity) E[M_(tau_n and t)^2] && quad "("(M_(tau_n and t)^2 <= A^2 "integrable, D.C.T)" \
    &<= lim_(n->infinity) E[A^2] = E[A^2] < infinity.
  $
  Hence $M_t$ is square-integrable.  The martingale property also holds:

  $
    E[M_t | cal(F)_s] &= E[lim_(n->infinity) M_(tau_n and t) | cal(F)_s] \
    &= lim_(n->infinity) E[M_(tau_n and t) | cal(F)_s] && quad "(" M_(tau_n and t) <= A "integrable, D.C.T)" \
    &= lim_(n->infinity) M_(tau_n and s) = M_s. quad qed
  $
]