#import "../template.typ": *
#import "exsheet-template.typ": *
#import "@preview/physica:0.9.5": *
#import "@preview/ouset:0.2.0": *
#import "@preview/diagraph:0.3.6": raw-render

#show: exsheet.with(6)

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
  
  Is it attainable?  If so, compute a replicating strategy $phi hat(=) (V_0, (theta^1_1, theta^1_2)).$
  
#attempt[
  
]