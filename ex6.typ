#import "template.typ": *
#import "@preview/physica:0.9.5": *
#import "@preview/diagraph:0.3.6": raw-render

= Exercise 6

== Previous exam question

Take the following model.  $Omega = {1,2} crossproduct {1,2,3}.$

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
      N11[label="200"];
      N12[label="50"];
      }

      {rank=same;
      N21[label="300"];
      N22[label="100"];
      N23[label="70"];
      N24[label="50"];
      N25[label="30"];
      }

      N0 -> N11 [label="1/2"];
      N0 -> N12 [label="1/2"];
      
      N11 -> N21 [label="2/3"];
      N11 -> N22 [label="1/3"];
      
      N12 -> N23 [label="1/2"];
      N12 -> N24 [label="1/4"];
      N12 -> N25 [label="1/4"];
    }
  ```,
  math-mode: "math"
))

1. Write down $PP_e (S^1)$.

_Solution:_ $PP_e (S^1) = {Q^gamma : gamma in (0,1/2)}, Q^gamma [(x_1, x_2)] = q_x_1 q_(x_2 | x_1)$, where

$
  q_1=2/3, quad
  q_2 = 1/3, quad 
  q_(1|1) = gamma, quad
  q_(2|1)= 1-2gamma, quad 
  q_(3|1) = gamma, quad
  q_(1|2) = 1/2, quad
  q_(2|2) = 1/2, quad
  (q_(3|2) = 0)
$

3. $C = (S^1_2 - K)^+$ is not attainable for $50 <= K < 70$.

_Proof sketch:_ Prove $PP_e (S^1) in.rev Q |-> E_Q [C]$ is not constant.

_Solution:_ Compute $E_Q [C]$. Given $K in [50, 70)$, write the possible outcomes of the payoff at time 2:

#align(center, raw-render(
  ```dot
    digraph {
      rankdir=LR;
      edge [arrowsize=0.5];
      node [shape=none, width=0.05, labeldistance=2.5, label=""];

      {rank=same;
      N11;
      N12;
      }

      {rank=same;
      N21[label="300-K > 0"];
      N22[label="100-K > 0"];
      N23[label="70 - K > 0"];
      N24[label="0"];
      N25[label="0"];
      }

      N11 -> N12 [style=invis];

      N11 -> N21;
      N11 -> N22;
      
      N12 -> N23;
      N12 -> N24;
      N12 -> N25;
    }
  ```,
  math-mode: "math"
))

$E_Q [C] &= (300-K) q_2 q_(2|2) + (100-K) q_2 q_(1|2) + (70 - K) q_1 q_(3|1) \
&= (300-K) 1/6 + (100-K) 1/6 + (70-K) 2/3 gamma quad "given" gamma in (0,1/2) "is not constant."
$

*Caution:* when solving for replication strategies in a two-period model, 

$
  V^C (phi) = V_0 + theta.alt_1 Delta S^1_1 + theta.alt_2 Delta S^1_2
$

be careful that $theta.alt_2$ is *not* a constant but a random variable.  The system, even with $theta.alt_2$ correctly expanded, may still be overdeterminated!

== Exercise sheet 5

Recorded inline as feedback in Ex. sheet 5.
