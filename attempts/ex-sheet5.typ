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

#feedback[
  If forgot how the decomposition is, just take $Delta X_n = Delta M_n + Delta A_n$ and then take $E[dot.op | cal(F)_(n-1)]$.
]

2. Prove that $M$ and $A$ are $P$-a.s.~unique.

#attempt[
  Assume there exists another decomposition $X = X_0 + M' + A'$ that also satisfies $M'$ is a martingale and $A'$ is predictable.  Let $Y := M - M' = A' - A$, easy to see that $Y$ is a martingale and also predictable.  Then $E[Y_n | cal(F)_(n-1)] = Y_(n-1) = Y_n quad forall n in NN_+$.

  Since $A$ and $M$ are both null at zero, $Y_0 = M_0 - M'_0 = 0 = E[Y_1 | cal(F)_0] = Y_1$.  Iteratively this shows $Y equiv 0 quad P$-a.s., hence $M$ and $A$ are unique. $qed$
]

3. Suppose that the increments $(Delta X_k)_(k in NN)$ of $X$ are i.i.d.~with respect to $FF$.  Find $M$ and $A$ explicitly.

#attempt[
  Since $Delta X_n$ are i.i.d.~$forall n in NN_+$, $E[Delta X_n | cal(F)_(n-1)] = E[Delta X_n]$ is a constant $c$.

  $A_n = sum_(k=1)^n E[X_k - X_(k-1) | cal(F)_(k-1)] = sum_(k=1)^n E[ Delta X_k | cal(F)_(k-1) ] = n dot.op c. \
  M_n = X_n - n dot.op c.
  $
]

#feedback[
  *Don't forget about $X_0$!* $M_n = X_n - X_0 - n dot.op c$.
]

#exercise() Let $(Omega, cal(F), P)$ be a probability space with filtration $FF = (cal(F)_k)_(k=0,1,...,T)$.  Let $Q$ be a probability measure on $(Omega, cal(F))$ such that $Q approx P$, and let $Z = (Z_k)_(k=0,1,...,T)$ be the density process of $Q$ with respect to $P$.

1. Show that $1/Z$ is a positive $Q$-martingale with $E_Q [1/Z_0] = 1$.

#attempt[
  $1/Z$ is obviously $Q$-adapted, integrable, and positive.

  Apply the Bayes formula, $E_Q [1/Z_k | cal(F)_(k-1)] = 1/Z_(k-1) E_P [Z_k dot.op 1/Z_k | cal(F)_(k-1)] = 1/Z_(k-1)$ satisfies the martingale property, hence $1/Z$ is a $Q$-martingale.

  $E_Q [1/Z_0] = E_P [cal(D) dot.op 1/Z_0] = E_P [cal(D) dot.op 1 \/ E_P [cal(D) | cal(F)_0]] = 1. quad qed$
]

2. Show that for every $k=0,1,...T$ and every $A in cal(F)_k$, we have that

$
  P[A] = E_Q [1/Z_k bb(1)_A].
$

#attempt[
  $E_Q [1/Z_k bb(1)_A] = E_P [cal(D) dot.op 1 \/ E_P [cal(D) | cal(F)_k] dot.op bb(1)_A] = E_P [bb(1)_A] = P[A].  quad qed$
]

#exercise() Let $(Omega, cal(F), P)$ be a probability space and $Y tilde cal(N)(0,1)$ a standard normal variable.  Fix a constant $beta in RR$.

1. Consider the random variable

  $
    Z := exp(-(1/2 - beta) Y - (1/2 - beta)^2 / 2).
  $

  Define the map $Q : cal(F) -> RR$ by $Q[A] := E[Z bb(1)_A]$.  Prove that $Q$ is a probability measure on $(Omega, cal(F))$ and that it is equivalent to $P$.

#attempt[
  Per definition, $Z > 0$.  Since $Y tilde cal(N)(0, 1)$, the PDF of $Y$ $p_Y (x) = 1/sqrt(2pi) exp (-x^2 / 2).$
  
  To prove $Q$ is a probability:
  - Nonngeative: $Q[A] = E[Z bb(1)_A] >= 0$.
  - Null empty set: $Q[diameter] = E[Z bb(1)_diameter]= 0$.
  - Countable additivity: $Q[union_(n in NN) A_n] = E[Z sum_(n in NN) bb(1)_(A_n)] = sum_(n in NN) E[Z bb(1)_(A_n)] = sum_(n in NN) Q[A_n]$ per the monotone convergence theorem.
  - Total mass 1: 
  $
    Q[Omega] = E[Z] &= integral_Omega Z(omega) dd(P(omega)) \
    &= integral_RR exp(-(1/2 - beta) x - (1/2 - beta)^2 / 2) 1/sqrt(2pi) exp(-x^2/2) dd(x) \
    &= integral_RR 1/sqrt(2pi) exp(-1/2 (x + 1/2 - beta)^2) dd(x) = 1.
  $

  To prove $Q approx P$:
  - $forall A$ where $P[A]=0$, $Q[A] = E[Z bb(1)_A] = 0$;
  - $forall A$ where $Q[A]=E[Z bb(1)_A] = 0$, since $Z > 0$, $bb(1)_A$ must be $diameter$, hence $P[A] = 0$. $qed$
]

#feedback[
  Important to apply the monotone convergence theorem!  Take the partial sums and apply the limit.
]

2. Set 
  $
    S^1_0 := e^beta quad "and" quad S^1_1 := e^Y.
  $

  Prove that $S^1 = (S^1_0, S^1_1)$ is a $(Q, FF)$-martingale, where $FF = (cal(F)_0, cal(F)_1)$ is the filtration given by $cal(F)_0 := {diameter, Omega}$ and $cal(F)_1 := cal(F)$.

#attempt[
  $S^1$ is obviously $FF$-adapted and integrable.

  $
    E_Q [S^1_1 | cal(F)_0] = E_Q [S^1_1] &= E[Z e^Y] \
    &= E[exp(-(1/2-beta) Y - (1/2-beta)^2 / 2 + Y)] \
    &= E[exp(beta) exp((beta + 1/2) Y - (1/2 - beta)^2 / 2 - beta)] \
    &= e^beta integral_RR 1/sqrt(2pi) exp(-x^2/2) exp((beta + 1/2) x - (1/2 - beta)^2 / 2 - beta) dd(x) \
    &= e^beta integral_RR 1/sqrt(2pi) exp(-x^2/2 + (beta + 1/2)x - (1/2 + beta)^2 / 2) dd(x) \
    &= e^beta integral_RR 1/sqrt(2pi) exp(-1/2 (x - 1/2 - beta)^2) dd(x) = e^beta. quad qed 
  $
]

3. Show that $log S^1_1$ has under $Q$ a normal distribution with mean $beta - 1/2$ and variance 1.

#attempt[
  Compute the PDF of $Y$ given the probability measure $Q$:

  $
    q_Y (x) = "d"/dd(x) Q[Y <= x] &= "d"/dd(x) E_P [Z bb(1)_{Y <= x}] \
    &= "d"/dd(x) integral_Omega Z(omega) bb(1)_{Y(omega) <= x} dd(P(omega)) \
    &= "d"/dd(x) integral_(-infinity)^x exp(-(1/2-beta) y - (1/2-beta)^2 / 2) 1/sqrt(2pi) exp(-y^2/2) dd(y) \
    &= "d"/dd(x) integral_(-infinity)^x exp(-1/2 (y-(beta-1/2))^2) dd(y) \
    &= exp(-1/2(x - (beta - 1/2))^2) tilde cal(N)(beta - 1/2, 1). quad qed
  $
]