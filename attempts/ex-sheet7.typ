#import "../template.typ": *
#import "exsheet-template.typ": *
#import "@preview/physica:0.9.5": *
#import "@preview/ouset:0.2.0": *
#import "@preview/diagraph:0.3.6": raw-render

#show: exsheet.with(7)

#exercise() Let $(Omega, cal(F), FF, P, tilde(S)^0, tilde(S)^1)$ be a 2-period binomial model on the canonical path space.  Specifically, $Omega := {1, 2}^2, cal(F):=2^Omega, FF=(cal(F)_0, cal(F)_1,cal(F)_2)$ with $cal(F)_0 := {diameter, Omega}, cal(F)_1 := sigma(tilde(S)^1_1)$ and $cal(F)_2 := cal(F)$.  We have

$
  tilde(S)^0_0 := 1, quad tilde(S)^1_0 := 100, quad tilde(S)^0_k := (1+r)^k, quad tilde(S)^1_k = 100 product_(j=1)^k Y_j quad "for" k=1,2,
$

where $Y_1$ and $Y_2$ are two independent random variables and only take two values $1+u$ and $1+d$ such that

$
  P[Y_j = 1+u] = p quad "and" P[Y_j = 1+d] = 1-p
$

with $0 < p < 1$.  We assume $u := 0.21, d := -0.01$ and $r := 0.1$.  It follows that the movements of the discounted stock price $S^1 := tilde(S)^1/S_0$ are described by the tree below:

#align(center, raw-render(
  ```dot
    digraph {
      rankdir=LR;
      edge [arrowsize=0.5];
      node [shape=none, width=0.05, labeldistance=2.5];

      {rank=same;
      N0[label="S^1: 100"];
      }

      {rank=same;
      N11[label="110"];
      N12[label="90"];
      }

      {rank=same;
      N21[label="121"];
      N22[label="99"];
      N23[label="99"];
      N24[label="81"];
      }

      N0 -> N11;
      N0 -> N12;
      
      N11 -> N21;
      N11 -> N22;
      N12 -> N23;
      N12 -> N24;
    }
  ```,
  math-mode: "math"
))

1. Is this market arbitrage-free?  Is it complete?

#attempt[
  The market is arbitrage-free and also complete since $d < r < u$.  
]

2. Let $H$ be the discounted payoff given by #h(1fr)
  $
    H := |S^1_2 - S^1_0|.
  $
  
  Is it attainable?  If so, compute a replicating strategy $phi hat(=) (V_0, (tha^1_1, tha^1_2)).$
  
#attempt[
  For $H$ to be attainable, we need to find a $phi hat(=) (V_0, (tha^1_1, tha^1_2)) =: (V_0, (tha_1, (theta_(2|u), theta_(2|d))))$ such that

  $
    cases(
      V_0 + 10 tha_1 + 11 tha_(2|u) &= 21,
      V_0 + 10 tha_1 - 11 tha_(2|u) &= 0,
      V_0 - 10 tha_1 + 9  tha_(2|d) &= 0,
      V_0 - 10 tha_1 - 9  tha_(2|d) &= 0,
    ) => cases(
      V_0 &= 21/4,
      tha_1 &= 21/40,
      tha_(2|u) &= 21/22,
      tha_(2|d) &= 0,
    )
  $
  
  Since the replication strategy exists, $H$ is attainable.
]

#feedback[
  $H$ is #text(fill: red)[*not*] a call option!  It's the absolute value instead of a $max(dot, 0)$.
  
  $
    cases(
      V_0 + 10 tha_1 + 11 tha_(2|u) &= 21,
      V_0 + 10 tha_1 - 11 tha_(2|u) &= 1,
      V_0 - 10 tha_1 + 9  tha_(2|d) &= 1,
      V_0 - 10 tha_1 - 9  tha_(2|d) &= 19,
    ) => cases(
      V_0 &= 21/2,
      tha_1 &= 1/20,
      tha_(2|u) &= 10/11,
      tha_(2|d) &= -1,
    )
  $
]

#exercise() Let $W = (W_t)_(t>=0)$ and $W' = (W'_t)_(t>=0)$ be two independent Brownian motions defined on some probability space $(Omega, cal(F), P)$.  Show that

1. $W^1 := -W$ is a BM.

#attempt[
  Three properties of a BM:
  - $W^1_0 = -W_0 = 0$ is trivial.
  - $W^1$ is a.s. continuous is trivial.
  - $forall s > t > 0, W^1_s - W^1_t ~ N(0, s-t)$ and are i.i.d.:
    $W_s^1 - W_t^1 = -W_s + W_t = - (W_s - W_t) ~ N(0, s-t)$ and are i.i.d.  $qed$
]

2. $W^2_t := W_(T+t) - W_T, "for" t >= 0$, is a BM for any $T>0$.

#attempt[
  Three properties of a BM:
  - $W^2_0 = W_T - W_T = 0$ is trivial.
  - $W^2$ is a.s. continuous is trivial.
  - $forall s > t > 0, W^2_s - W^2_t ~ N(0, s-t)$ and are i.i.d.:
    $W_s^2 - W_t^2 = W_(T+s) - W_T - (W_(T+t) - W_T) = W_(T+s) - W_(T+t) ~ N(0, s-t)$ and are i.i.d.  $qed$
]

3. $W^3 := alpha W + sqrt(1-alpha^2) W'$ is a BM for any $alpha in [0,1]$.

#attempt[
  Three properties of a BM:
  - $W^3_0 = alpha W_0 + sqrt(1-alpha^2) W'_0 = 0$ is trivial.
  - $W^3$ is a.s. continuous is trivial.
  - $forall s > t > 0, W^3_s - W^3_t ~ N(0, s-t)$ and are i.i.d.:
    $W_s^3 - W_t^3 = alpha (W_s - W_t) + sqrt(1-alpha^2) (W'_s - W'_t).$ Since $W$ and $W'$ are independent, $W_s - W_t ~ N(0, s-t)$ and $W'_s - W'_t ~N(0, s-t)$ and are i.i.d.
    Hence, $W^3_s - W^3_t ~ N(0, (alpha^2 + (1-alpha^2)) (s-t)) = N(0, s-t).  quad qed$
]

4. Show that the independence of $W$ and $W'$ in (c) cannot be omitted, i.e., if $W$ and $W'$ are not independent, then $W^3$ need not be a BM.  Give a counterexample.

#attempt[
  Take $W' := -W, alpha = 1/sqrt(2)$.  $W^3 = 1/sqrt(2) W + 1/sqrt(2) W' equiv 0$ is not a BM, since $forall s>t>0, W^3_s-W^3_t equiv 0$ is not a normal deviate.
]

#exercise() Let $W = (W_t)_(t>=0)$ be a Brownian motion defined on some probability space $(Omega, cal(F), P)$.

1. Let $s <= t$.  Compute $E[W_s W_t^2]$.

#attempt[
  $E[W_s W_t^2] &= E[W_s (W_t - W_s + W_s)^2] \
  &= E[W_s (W_t-W_s)^2] + 2 E[W_s^2 (W_t-W_s)] + E[W_s^3] \
  &= 0.$
]

2. Let $a in RR$.  Compute $lim_(t -> infinity) E[bb(1)_{W_t <= a}]$.

#attempt[
  $
  lim_(t->infinity) E[bb(1)_{W_t <= a}] &= lim_(t->infinity) integral_Omega bb(1)_{W_t <= a} (omega) dd(P(omega)) \
  &= lim_(t->infinity) integral_(-infinity)^a 1 p_W_t (x) dd(x) \
  &= lim_(t->infinity) integral_(-infinity)^a 1/sqrt(2 pi t) exp(-x^2/(2t)) dd(x) \
  &= integral_(-infinity)^a (lim_(t->infinity) 1/sqrt(2pi t) exp(-x^2/(2t))) dd(x)  quad quad & "(M.C.T.)"\
  &= 0.
  $
]