#import "template.typ": *
#import "@preview/diagraph:0.3.6": raw-render

= Exercise 3

Properties of conditional expectations for intuition, atoms.

== Projection in $L^2$

*Example.* $(Omega, cal(F), P)$, random variable $X in L^2$ (i.e.~$E[ |X|^2] < infinity$, $L^2$-norm).  $cal(G)$ is a sub-$sigma$-algebra.  Then holds:

$ E[ |X - E[X|cal(G)]|^2] <= E[ |X-omega|^2] quad forall omega: Omega -> RR "s.t." omega "is" cal(G)"-measurable". $

_Proof._ Let $Z := E[X|cal(G)]$ and $omega$ be any $cal(G)$-measurable random variable.

$E[ |X-omega|^2|cal(G)] &= E[ |X-Z+Z-omega|^2 | cal(G)] \
&= E[ |X-Z|^2 | cal(G)] + E[ |Z-omega|^2 | cal(G)] + 2 E[ (X-Z)(Z-omega) | cal(G)] \
&= E[ |X-Z|^2 | cal(G)] + |Z-omega|^2 + 2 (Z-omega) E[ X-Z | cal(G)] \
&= E[ |X-Z|^2 | cal(G)] + |Z-omega|^2 >= E[ |X-Z|^2 | cal(G)].
$

Take (non-conditional) expectation on both sides (_using the *tower property*_), we have $E[ |X - omega|^2] >= E[ |X - E[X|cal(G)]|^2].  quad qed$

#corollary[
  *Tower property*: $E[E[X|cal(G)]|cal(H)] = E[X|cal(H)]$ where $cal(G)$ and $cal(H)$ are sub-$sigma$-algebras and $cal(H) subset.eq cal(G).$
]

== Atom

#definition[
  $A$ is an atom of a sub-$sigma$-algebra $cal(F)$ if:
  - $A in cal(F)$,
  - $P(A) > 1$,
  - $forall C in cal(F) "with" C subset A$, it holds that either $P(C) = 0$ or $P(C) = P(A).$
]

Take $(Omega, cal(F), P), cal(G) subset.eq cal(F)$ is a sub-$sigma$-algebra.  $(A_i)_(i=1,...,n)$ are atoms of $cal(G)$.

$ X in L^1 => E[X|cal(G)] = sum_(i=1)^n z_(A_i) bb(1)_A_i "where" z_A_i in RR. $

#pagebreak()

*Example.* Trinomial model: take risky asset $S$ and bank account.  Bank account starts as 1, i.e.~discounted value coincides with real value.

$Omega := {u, m, d} times {u, d}, cal(F)=2^Omega, P "s.t." P({x_1, x_2}) = P_x_1 P_(x_2,x_1) "for" x_1 in {u,m,d}, x_2 in {u,d}.$

#raw-render(
  ```dot
    digraph {
      rankdir=LR;
      edge [arrowhead=none];
      node [shape=circle, label="", width=0.05, style=filled, fillcolor=black, labeldistance=2.5];
      splines=line;

      {rank=same;
      C0[style=invis, width=0, label="", xlabel="S_0"];
      N0[xlabel="100"];
      }

      {rank=same;
      C1[style=invis, width=0, label="", xlabel="S_1"];
      N11[xlabel="125"];
      N12[xlabel="120"];
      N13[xlabel="90"];
      }

      {rank=same; 
      C2[style=invis, width=0, label="", xlabel="S_2"];
      N21[xlabel="175"];
      N22[xlabel="100"];
      N23[xlabel="168"];
      N24[xlabel="96"];
      N25[xlabel="126"];
      N26[xlabel="72"];
      }

      C0 -> C1 [style=invis, weight=10];
      C1 -> C2 [style=invis, weight=10];

      // align labels
      N0 -> N11 [label="p_u"];
      N0 -> N12 [label="p_m"];
      N0 -> N13 [label="p_d"];
      
      N11 -> N21 [label="0.5"];
      N11 -> N22 [label="0.5"];

      N12 -> N23 [label="0.4"];
      N12 -> N24 [label="0.6"];

      N13 -> N25 [label="0.5"];
      N13 -> N26 [label="0.5"];
    }
  ```
)

Compute $E[S_2 | cal(F)_1].$

_Solution._ $cal(F)_1 = sigma(S_1) = sigma({(u,u), (u,d)}, {(m,u),(m,d)}, {(d,u),(d,d)}).$

$E[S_1 | cal(F)_1] = S_1 : Omega -> RR quad omega |-> S_1(omega) quad P$-a.s.  $S_1$ is _piecewise-constant_ since it can only take three values (125, 120, 90), or as a formula:

$ S_1 = E[S_1 | cal(F)_1] =
 125 dot.op bb(1)_{omega = (x_1, x_2): x_1 = u} +
 120 dot.op bb(1)_{omega = (x_1, x_2): x_1 = m} +
 90 dot.op bb(1)_{omega = (x_1, x_2): x_1 = d}
  $
  
$E[S_2 | cal(F)_1] : Omega -> RR $ is also _piecewise-constant_ taking three values, one for each atom:

$
E[S_2 | cal(F)_1](u,dot.op) &= 175 dot.op 0.5 + 100 dot.op 0.5, \
E[S_2 | cal(F)_1](m,dot.op) &= 168 dot.op 0.4 + 96 dot.op 0.6, \
E[S_2 | cal(F)_1](d,dot.op) &= 126 dot.op 0.5 + 72 dot.op 0.5. \
$
 