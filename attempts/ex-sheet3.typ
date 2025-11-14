#import "../template.typ": attempt, feedback
#import "exsheet-template.typ": *
#import "@preview/physica:0.9.5": *
#import "@preview/ouset:0.2.0": *

#show: exsheet.with(3)

#exercise() Consider a probability space $(Omega, cal(F), P)$ with a filtration $FF = (cal(F)_k)_(k in NN_0)$.

1. Let $X$ be a martingale.  Show that for any bounded and convex function $f: RR -> RR$, the process $f(X) = (f(X_k))_(k in NN_0)$ is a submartingale.

#attempt[
  $E[X_l | cal(F)_k] = X_k quad Q"-a.s. for" k <= l.$ 

  With the Jensen's inequality, $f(X_k) = f(E[X_l | cal(F)_k]) <= E[f(X_l) | cal(F)_k] quad Q$-a.s. for $k <= l$.

  Therefore $f(X)$ is a submartingale.  $qed$
]

#feedback[
  Also has to argue why $f(X_k)$ is adapted and $in L^1$ (integrable)!
]

#let cdot = $circle.filled.small$

2. Let $X$ be a submartingale and $theta.alt = (theta.alt_k)_(k in NN_0)$ a bounded, nonnegative and predictable process.
   Show that the stochastic integral process $theta.alt cdot X$, defined by

   $ theta.alt cdot X_k := sum_(j=1)^k theta.alt_j Delta X_j = sum_(j=1)^k theta.alt_j (X_j - X_(j-1)) quad "for" k in NN_0, $

   is a submartingale.  Conclude that $E[theta.alt cdot X_k] >= 0$ for all $k in NN_0$.

#attempt[
    Given $l >= k$, \
    $E[theta.alt cdot X_l | cal(F)_k ] &= E[sum_(j=1)^l theta.alt_j (X_j - X_(j-1)) | cal(F)_k] \
    &= sum_(j=1)^k theta.alt_j Delta X_j + sum_(j=k+1)^l E[theta.alt_j Delta X_j].$

    Given $j >= k+1$, \
    $E[theta.alt_j Delta X_j | cal(F)_k] = E[E[theta.alt_j Delta X_j | cal(F)_(j-1)] | cal(F)_k] = E[theta.alt_j E[Delta X_j | cal(F)_(j-1)] | cal(F)_k].$

    Since $X$ is a submartingale, $E[Delta X_j | cal(F)_(j-1)] = E[X_j | cal(F)_(j-1)] - X_(j-1) >= 0$, hence $theta.alt_j E[Delta X_j | cal(F)_(j-1)] >= 0$ $P$-a.s.  Therefore $E[theta_j Delta X_j | cal(F)_k] >= 0$ given $l >= k+1$.

    Therefore $E[theta.alt cdot X_l | cal(F)_k] >= theta.alt cdot X_k. quad qed$
]

#feedback[
  Same as above, also has to argue why $f(X_k)$ is adapted and $in L^1$ (integrable)!
]

3. Let $X$ be a submartingale and $tau$ a stopping time.  Show that the stopped process $X^tau = (X^tau_k)_(k in NN_0)$, defined by $X^tau_k = X_(k and tau)$, is a submartingale.

#attempt[
    Take $l >= k$.  Rewrite $X_(l and tau) = X_(k and tau) + sum_(j=k+1)^l bb(1)_{tau >= j} Delta X_j$.  Hence:

    $E[X_(l and tau) | cal(F)_k] &= E[X_(k and tau) | cal(F)_k] + sum_(j=k+1)^l E[bb(1)_{tau >= j} Delta X_j  | cal(F)_k] \
    &= X_(k and tau) + sum_(j=k+1)^l E[E[bb(1)_{tau >= j} Delta X_j | cal(F)_j] | cal(F)_k].$

    Since ${r >= j}$ and $Delta X_j$ are both $cal(F)_j$-measurable, $E[bb(1)_{tau >= j} Delta X_j | cal(F)_j] >= 0 quad P$-a.s., hence each  $E[dot.op | cal(F)_k]$ in the sum $>= 0$, hence $E[X_(l and tau) | cal(F)_k] >= X_(k and tau)$ for $l >= k. quad qed$
]

#exercise() Consider a probability space $(Omega, cal(F), P)$ with a filtration $FF = (cal(F)_k)_(k=0,...,T),$ where $cal(F)_0 := {diameter, Omega}$.  Let $X = (X_k)_(k=0,...,T)$ be a supermartingale.  Show that

$ X_0 >= E[X_T] quad P"-a.s.," $

and that $X_0 = E[X_T]$ if and only if $X$ is a martingale.

#attempt[
    Since $X$ is a supermartingale, $E[X_T] = E[X_T | cal(F)_0] <= X_0.$

    $=>$: $X$ is a martingale $=> E[X_T] = E[X_T | cal(F)_0] = X_0. quad qed$

    $arrow.l.double$: $E[X_T] = X_0$.  As in the Doob decomposition theorem, define two processes $A$ and $M$ as follows:

    $ A_n = sum_(k=1)^n (E[X_k | cal(F)_(k-1)] - X_(k-1)) \
      M_n = X_0 + sum_(k=1)^n (X_k - E[X_k | cal(F)_(k-1)])
    $

    Easy to see that $X = A + M$.  $M$ satisfies the martingale property as
    $E[M_n - M_(n-1) | cal(F)_(n-1)] = E[X_n - E[X_n | cal(F)_(n-1)] | cal(F)_(n-1)] = 0 quad P$-a.s.

    $E[X_n] = E[A_n + M_n] = E[A_n] + E[M_0] = E[A_n] + X_0 => E[A_n] = 0.$
    
    Since $forall k in NN_0 quad E[X_k|cal(F)_(k-1)] <= X_(k-1) => A_n <= 0 $ and is non-increasing $=> A_n = 0 quad P$-a.s., therefore $X_n = M_n$ is a martingale $P$-a.s.  $qed$
]

#exercise() Let $(Omega, cal(F), P)$ be a probability space.  We consider a random variable $Z$ that is symmetric around 0 and not integrable, that is, 

$ Z ouset(=, d) -Z quad "and" quad E[Z^+] = E[Z^-] = +infinity. $

We consider the filtration

$ cal(F)_0 := {diameter, Omega}, quad cal(F)_1 := sigma(|Z|), quad cal(F)_k := sigma(Z) quad "for" k=2,3,... $

1. For any $n in NN$, we define
   $ tau_n := bb(1)_{|Z|>n} + infinity bb(1)_{|Z|<=n}. $
   Prove that $tau_n$ is a stopping time.  Compute the limit $lim_(n->infinity) tau_n$.

#attempt[
  ${tau_n <= 0} = diameter in cal(F)_0.$
  
  Given $1 <= k < infinity$, ${tau_n <= k} = {|Z| > n} in sigma(|Z|) = cal(F)_1 subset.eq cal(F)_k => tau_n$ is a stopping time.  $qed$
  
  $lim_(n->infinity) tau_n = lim_(n->infinity) (bb(1)_{|Z| > n} + infinity bb(1)_{|Z| <= n}).$
  
  Since for random variables are finite $P$-a.s., $lim_(n->infinity) bb(1)_{|Z|>n} = 0$ and $lim_(n->infinity) bb(1)_{|Z| <= n} = 1.$
  Hence the limit is $infinity$.
]

2. Let $X = (X_k)_(k in NN_0)$ be such that $X_0 = X_1 = 0$ and $X_k = Z$ for $k=2,3,...$ Prove that $X$ is a local martingale.

#attempt[
  $lim_(n->infinity) tau_n = infinity$, hence $tau = (tau_n)_(n in NN_0)$ is a sequence of stopping times increasing to $infinity$ stationarily.
  
  Hence to show $X$ is a local martingale, we need to show $X^(tau_n) = (X_(k and tau_n))_(k in NN_0)$ is a martingale.
  
  Since $tau_n$ are stopping times, ${tau_n <= k} in cal(F)_k.$

  $E[X_(k and tau_n) | cal(F)_k]
  &= E[bb(1)_{k < tau_n} X_k + bb(1)_{k >= tau_n} X_(tau_n) | cal(F)_k] \
  &= bb(1)_{k < tau_n} X_k + bb(1)_{k >= tau_n} E[X_tau_n | cal(F)_k] \
  &= bb(1)_{k < tau_n} X_k + bb(1)_{k >= tau_n} X_tau_n = X_(k and tau_n).  quad qed$
]

#feedback[
  *Proved the wrong thing!*  Showed $E[X_(k and tau_n) | text(fill: #red, cal(F)_k)] = X_(k and tau_n)$, not $cal(F)_(k-1).$

  _Correct solution:_ compute $X^(tau_n)$: $X^(tau_n)_0 = X^(tau_n)_1 = 0,$  
  
  $ X^(tau_n)_k = X_(k and tau(n)) = cases(
    0 & "if" tau_n = 1 "i.e." (|Z| > n),
    Z & "if" tau_n = infinity
  ) = Z bb(1)_{|Z| <= n} in cal(F)_k = sigma(Z). $
  
  We then also need to show integrability: $E[ |X^(tau_n)_k| ] = E[ |Z| bb(1)_{|Z| <= n}] <= n.$
  
  We then show $E[X_(k+1)^(tau_n) | cal(F)] = X_k^(tau_n) quad P$-a.s.
  - $k = 0$: $E[X_1 | cal(F)_0] = 0 = X_0 = X_0^(tau_n).$
  - $k >= 2$: $E[X^(tau_n)_(k+1) | cal(F)] = E[Z bb(1)_{|Z| <= n} | cal(F)_k] = X_k^tau(n)$.
  - $k = 1$: $E[Z bb(1)_{|Z| <= n} | sigma(|Z|)] = 0 = X^(tau_n)_1$, use the condition that $Z$ is symmetrical around 0.
]

3. Is $X$ a martingale?

#attempt[
  No: although the martingale property $E[X_l | cal(F)_k] = X_k$ holds (since $X_j$ is $cal(F)_2$-measurable) holds for $X$, it is not integrable: $E[X_k] = infinity$ for $k=2,...$ Hence $X$ is not a martingale.
]

#feedback[
  Solution is correct, but $E[X_l | cal(F)_k]$ is not definable since it's not integrable; hence no way of saying
  if the "martingale property" holds or not.  This reflects the importance of arguing that the process has to be 
  integrable (i.e.~$in L^1$).
]