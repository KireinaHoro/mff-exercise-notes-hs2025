#import "../template.typ": *
#import "exsheet-template.typ": *
#import "@preview/physica:0.9.5": *
#import "@preview/ouset:0.2.0": *
#import "@preview/diagraph:0.3.6": raw-render

#show: exsheet.with(6)

#exercise() Let $(Omega, cal(F), P)$ be a probability space with filtration $FF = (cal(F)_k)_(k=0,1,...,T)$.

1. Give an example of an adapted and integrable process $S^1$ such that $PP_e (S^1) = diameter$, where $PP_e (S^1)$ denotes the set of all equivalent martingale measures for $S^1$.

#attempt[
  Find an adapted and integrable process $S^1$, but is not a martingale, s.t.~$PP_e (S^1) = diameter$.  Take the following binomial model:

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
        N11[label="120"];
        N12[label="140"];
        }

        N0 -> N11 [label="q"];
        N0 -> N12 [label="1-q"];
        
      }
    ```,
    math-mode: "math"
  ))
  
  $E_Q [S^1_1 | cal(F)_0] = q dot.op 140 + (1-q) dot.op 120 = 120 + 20q > 100 = S^1_0 quad forall q in (0,1)$, hence $S^1$ is not a martingale, $PP_e (S^1) = diameter$.
]

2. Consider the market $(S^0, S^1)$, where $S^0 equiv 1$ represents a bank account and $S^1$ is the asset from part (a).  For your choice of $S^1$, is $(S^0, S^1)$ arbitrage-free?  If not, construct an explicit arbitrage opportunity.

#attempt[
  At time 0, short 100 units of $S^0$ and buy 1 unit of $S^1$.

  At time 1, sell $S^1$.

  $V_1 = cases(
    40 quad "up state",
    20 quad "down state",
  ) > 0 quad P$-a.s., hence $(S^0, S^1)$ admits arbitrage.
]

#exercise() Let $(Omega, cal(F), FF, P, tilde(S)^0, tilde(S)^1)$ be a single-period trinomial model on the canonical path space.  More specifically, $Omega := {1,2,3}, cal(F) := 2^Omega, FF=(cal(F)_0, cal(F)_1)$ with $cal(F)_0 := {diameter, Omega}$ and $cal(F)_1 := cal(F)$.  We have that

$
  tilde(S)^0_0 := 1, quad tilde(S)^0_1 := 1+r quad "and" tilde(S)^1_0 := 10, quad tilde(S)^1_1 := 10Y,
$

where $Y$ is a random variable such that

$
  P[Y=1+d] = p_1, quad P[Y=1+m] = p_2, quad "and" quad P[Y=1+u] = p_3
$

with $p_1,p_2,p_3 > 0$ and $p_1 + p_2 + p_3 = 1$.  We assume $d=-0.2,m=0.1=r$ and $u=0.3$.

1. Find the set $PP_e (S^1)$ of equivalent martingale measures for $S^1 := tilde(S)^1 \/ tilde(S)^0.$

#attempt[
  Take $PP_e (S^1) in.rev Q = (q_1, q_2, q_3)$, then the following must hold:

  $
    cases(
      q_1 + q_2 + q_3 = 1,
      1.3/1.1 q_1 + q_2 + 0.8/1.1 q_3 = 1,
      q_1\,q_2\,q_3 in (0,1)
    ) => cases(
      q_1 = (2q_3 + 1)/3,
      q_2 = (2 - 5q_3)/3,
      q_3 in (0, 2/5)
    )
  $
  
  Hence $PP_e (S^1) = { ((2q+1)/3, (2-5q)/3, q) : q in (0,2/5)}$.
]

2. Show that the set $PP_e (S^1)$ is convex.

#attempt[
  $PP_e (S^1)$ is convex $<=> forall q_1, q_2 in (0, 2/5)$, the middle point
  $
    1/2 (((2q_1 + 1)/3, (2-5q_1)/3, q_1) + ((2q_2 + 1)/3, (2-5q_2)/3, q_2)) in PP_e (S^1).
  $
  
  $"LHS" = ((q_1+q_2+1)/3, (2-5/2(q_1+q_2))/3, (q_1+q_2)/2)$.  Let $q'=(q_1+q_2)/2$.

  Obviously $q' in (0,2/5)$, hence LHS $in PP_e (S^1)$.  $qed$
]

#feedback[
  $PP_e (S^1)$ is convex $=>$ given $Q^1, Q^2 in PP_e (S^1) -> lambda Q^1 + (1-lambda) Q^2 in PP_e (S^1)$ for $lambda in [0,1]$.  Three things to show:
  - probability measure,
  - equivalent to $P$,
  - $S^1$ is a $Q^lambda$-martingale.
]

3. Show that

  $
    sup_(Q in PP_e (S^1)) E_Q [(tilde(S)^1_1 - 11)^+/(1+r)] = E_hat(Q) [(tilde(S)^1_1 - 11)^+/(1+r)]
  $

  for some probability measure $hat(Q)$ on $(Omega, cal(F)).$. Is $hat(Q) in PP_e (S^1)$?

#attempt[
  $
    ((tilde(S)^1_1 - 11)^+)/(1+r) = cases(
      2/1.1 &quad "up state",
      0 &quad "otherwise"
    ) \
    => E_Q [dot.op] = 2/1.1 dot.op (2q+1)/3 + 0 dot.op (dot.op)= (4q+2)/3.3 "where" q in (0, 2/5). \
    sup E_Q [dot.op] = sup (4q+2)/3.3 |_(q in (0,2/5)) = 12/11. \
    hat(Q) = ((2q'+1)/3, (2-5q')/3, q')|_(q'=2/5) = (0.6, 0, 0.4).
  $
  
  Easy to see that $hat(Q) in.not PP_e (S^1)$ since $q' in.not (0, 2/5)$.
]

4. Show that $PP_e (S^1) = PP_(e,"loc")(S^1)$, where $PP_(e,"loc")(S^1)$ is the set of all equivalent local martingale measures for $S^1$.

#attempt[
  We need to prove that $PP_(e,"loc")(S^1) subset.eq PP_e (S^1).$ 
  
  Given $Q in PP_(e,"loc") (S^1)$, $S^1$ is a $Q$-local martingale $=> exists (tau_n)_(n in )$ the localising sequence, and $(S^1)^(tau_n) = (S^1_(k and tau_n))_(k=0,1)$ is a $Q$-martingale.
  
  Hence, $E_Q [S^1_(1 and tau_n) | cal(F)_0] = S^1_(0 and tau_n) = S^1_0$.  Per definition of $S^1$, $|S^1| <= 10 (1+u)$ is bounded.  Take the limit of the LHS and apply the dominated convergence theorem:

  $
    lim_(n -> infinity) E_Q [S^1_(1 and tau_n) | cal(F)_0] = E_Q [lim_(n -> infinity) S^1_(1 and tau_n) | cal(F)_0] = E_Q [S^1_1 | cal(F)_0] = lim_(n->infinity) S^1_0 = S^1_0.
  $
  
  Hence $S^1$ is also a $Q$-martingale, i.e.~$Q in PP_e (S^1). => PP_(e,"loc") (S^1) subset.eq PP_e (S^1). quad qed$
]

#exercise() Let $(Omega, cal(F), FF, P, tilde(S)^0, tilde(S)^1)$ be a single-period trinomial model on the canonical path space.  Assume that $u > m = r > d > -1$ and $tilde(S)^1_0 = s_0 > 0$.

1. Determine for which $K>=0$ the (undiscounted) payoff
  $
    tilde(H) := (tilde(S)^1_1 - K)^+
  $
  is attainable.  Construct a replicating strategy when it is.
  
#attempt[
  Take a replicating strategy $phi$ (that is self-financing) where the first period is $(phi_1, theta.alt_1)$.  The value of the replicating strategy
  $
    tilde(V)^tilde(H)_1 = cases(
      (1+r) phi_1 + (1+u) s_0 theta.alt_1 & quad "up case",
      (1+r) phi_1 + (1+m) s_0 theta.alt_1 & quad "mid case",
      (1+r) phi_1 + (1+d) s_0 theta.alt_1 & quad "down case",
    )
  $
  
  There are 4 possible cases of $K$:
  - $K >= (1+u)s_0$: $tilde(H) equiv 0$, trivially replicable, take $phi_1=0, theta.alt_1 = 0$.
  - $K <= (1+d)s_0$: $tilde(H) = tilde(S)^1_1 - K$, linear to $tilde(S)^1_1$, take $phi_1 = -K/(1+r), theta.alt_1 = 1$.
  - $K in [(1+m)s_0, (1+u)s_0)$:
    $
      cases(
        (1+r)phi_1 + (1+u)s_0 theta.alt_1 &= (1+u)s_0 - K,
        (1+r)phi_1 + (1+m)s_0 theta.alt_1 &= 0,
        (1+r)phi_1 + (1+d)s_0 theta.alt_1 &= 0,
      )
    $
    
    Subtract the second and third equations: $theta.alt_1 = 0$.  Substitute this into the first and third equations: $phi_1 = ((1+u)s_0 - K)/(1+r) = 0$, contradition!
  - $K in ((1+d)s_0, (1+u)s_0)$: 
    $
      cases(
        (1+r)phi_1 + (1+u)s_0 theta.alt_1 &= (1+u)s_0 - K,
        (1+r)phi_1 + (1+m)s_0 theta.alt_1 &= (1+m)s_0 - K,
        (1+r)phi_1 + (1+d)s_0 theta.alt_1 &= 0,
      )
    $
    
    Subtract the first and second equations: $theta.alt_1 = 1$.  Substitute this into the first and third equations: $phi_1 = (-(1+d)s_0)/(1+r) = -K/(1+r)$, contradition!
    
  Hence for $tilde(H)$ to be attainable, $K$ must be $>= (1+u)s_0$ or $<= (1+d)s_0$.
]

#feedback[
  Be explicit with the notations!  Calculate $V_0$ in $phi hat(=)(V_0, theta.alt)$ explicitly instead of going with $phi^0_1$.  Use the formula $V = V_0 + Delta S_1 theta.alt_1 + ...$
]

2. Compute the set of all arbitrage-free prices for the (undiscounted) payoff
  $
    tilde(H) := bb(1)_{tilde(S)^1_1 > s_0(1+r)}.
  $
  Show that $tilde(H)$ is not attainable.
  
#attempt[
  $E_Q [tilde(H)] = 1 dot.op q_1 + 0 dot.op q_2 + 0 dot.op q_3 = q_1$, where $q_1,q_2,q_3$ satisfies:

  $
    cases(
      q_1 + q_2 + q_3 = 1,
      u q_1 + m q_2 + d q_3 = r
    ) => cases(
      q_1 = (r-d)/(u-r) q_3     & in (0,1),
      q_2 = 1 - (u-d)/(u-r) q_3 & in (0,1)
    ) => q_3 in (0, (u-r)/(u-d)).
  $
  Hence the arbitrage-free prie range is $[0, (r-d)/(u-d)]$.  This is not a single point, hence $tilde(H)$ is not attainable.
  
  _Question to the TA: is this enough to show that $tilde(H)$ is not attainable?  Or do we have to construct $phi$ and find a contradiction, same as in (a)?_
]