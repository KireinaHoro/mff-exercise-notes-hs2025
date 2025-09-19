#import "template.typ": *
#import "@preview/diagraph:0.3.6": raw-render

= Exercise 1

Recap of key concepts plus several examples that will help with solving Exercise Sheet 1.  No actual exercise sheets were solved in the session.

== Recap of concepts

=== $sigma$-algebra

#definition[
  Let $Omega eq.not diameter$ be a set and let $cal(F) subset.eq 2^Omega$#footnote[$2^Omega$ denotes the power set of $Omega$.].  $cal(F)$ is called a *$sigma$-algebra* if:
  
  1. $diameter in cal(F)$
  2. $A in cal(F) arrow.r.double A^c in cal(F)$ #footnote[$A^c$ denotes the complement of $A$ (in the implicit full set $Omega$).]
  3. $(A_n)_(n in NN)$ s.t. $ A_n in cal(F) arrow.r.double union.big_(n in NN) A_n in cal(F) $
]

=== Mesurable space

#definition[
  $(Omega, cal(F))$ is called a *measurable space* where $cal(F)$ is a $sigma$-algebra on $Omega$.
]

=== Random variable

#definition[
  Let $(Omega, cal(F))$ and $(tilde(Omega), tilde(cal(F)))$ be two measurable spaces.
  A map $f : (Omega, cal(F)) arrow.r (tilde(Omega), tilde(cal(F)))$ is *measureable* if for every $B in tilde(cal(F))$#footnote[
    $B in tilde(cal(F)) arrow.r.double B subset.eq tilde(Omega)$.  Intuitively, $B$ is an _event_ in the $sigma$-algebra that defines _all events_.
  ], $ f^(-1)(B)#footnote[
    $f^(-1)(B)$ is *not* the inverse function $tilde(Omega) arrow.r Omega$, but the *preimage map* $2^(tilde(Omega)) arrow.r 2^Omega$.  When we only concern measurable maps (i.e. random variables), this decays to $tilde(cal(F)) arrow.r tilde(F)$.
  ] := { omega in Omega | f(omega) in B } in cal(F). $
]

#definition[
  A *random variable*#footnote[
    We talk about real-valued random variables here.
  ] is a measurable function $X(Omega, cal(F)) arrow.r (RR, B(RR))$#footnote[
    $B(RR)$ is the Borel $sigma$-algebra over $RR$.
  ].
]

Indicator function $bb(1)_A: Omega arrow.r RR$ is a handy random variable defined as:

$ bb(1)_A(omega) := cases(
    1 "if" omega in A,
    0 "otherwise"
) $

$bb(1)_A$ is $B(RR)$-measurable iff. $A in cal(F)$.

=== Probability

A measure $mu$ on $(Omega, cal(F))$ is a mapping, if $mu : cal(F) arrow.r [0, +infinity]$ s.t.:

1. $mu(diameter) = 0$
2. $(A_n)_(n in NN)$ s.t. $ A_n in cal(F), A_i inter A_j = diameter " " forall i eq.not j arrow.r.double mu(union.big_(n in NN) A_n) = sum_(n in NN)mu(A_n) $.

#definition[
  $P$ is a *probability* if it is a measure and $P(Omega)=1$.
]

== Probability space

#definition[
  $(Omega, cal(F), P)$ is a *probability space*.
]

$B in cal(F)$ happens $P$-a.s.#footnote[
  "$P$-a.s." stands for almost surely under $P$.  When the probability measure is unambiguous, we can simply use a.s.
] if $P(B) = 1$.

== Examples

Consider the following probability space:

$Omega := [0, 1] \
cal(F) := B([0, 1]) \
P := lambda(Omega)#footnote[
  $lambda(Omega)$ is the Lebesgue measure of $Omega$.
]$

=== Almost surely

- $X: Omega arrow.r RR$, $X(omega) := 1_{0}(omega)$ for every $omega in Omega$;

  $X$ is a random variable, since ${0} in cal(F)$ (therefore $X$ is $cal(F)$-measurable).

- $Y: Omega arrow.r RR$, $Y(omega) := 0$ for every $omega in Omega$.

Observations:
- $X = Y$ for every $omega in Omega$ is *false*
- $X = Y$ $P$-a.s. is *true*:
  
  $P(X = Y) = 1 - P(X eq.not Y) = 1$, since $lambda({0}) = 0$.
  
=== $P$-trivial

Take $cal(F)_0 subset.eq cal(F)$.  $cal(F)_0$ is $P$-trivial if $P(A) in {0, 1}$ for every $A in cal(F)_0$.

#corollary[
  $cal(F)_0$ is $P$-trivial iff. for every random variable $X$ that is $cal(F)_0$-measurable, $X$ is $P$-a.s. constant. 
]

_Proof_ $arrow.l.double$: let $A in cal(F)_0$, consider $bb(1)_A: Omega arrow.r RR$.  $bb(1)_A$ is a $cal(F)_0$-measurable random variable and is $P$-a.s. constant.  Since $bb(1)_A$ is 1 or 0,

- if $P(1_(A)(dot.op)=1)=1 arrow.r.double P(A)=1$;
- otherwise, $P(1_(A)(dot.op)=0)=1 arrow.r.double P(A)=0$.

$arrow.r.double P(A) in {0, 1}, qed.$

_Proof_ $arrow.r.double$: left as exercise.

=== 2-step binomial model

Take $Omega := {U U, U D, D U, D D}$, $cal(F) := 2^Omega, P(dot.op) := 1/4$.

Define $y_1, y_2:Omega arrow.r RR$, s.t.

$ y_1(U U) = y_1(U D) = 2, y_1(D U) = y_1(D D) = 1/2 $
$ y_2(U U) = y_2(D U) = 2, y_2(U D) = y_2(D D) = 1/2 $

Define $X := (X_k)_(k=0,1,2)$ s.t. $X_0 = 8$, $ X_k = X_0 product_(i=0)^k y_i $.

Progression of $X(omega)$ for different outcomes of $omega in Omega$:

#raw-render(
  ```dot
    digraph {
      rankdir=LR;
      edge [arrowhead=none];
      node [shape=circle, label="", width=0.05, style=filled, fillcolor=black, labeldistance=2.5];
      splines=line;

      C0[style=invis, width=0, label="", xlabel="X_0"];
      N0[xlabel="8"];
      {rank=same; C0; N0; }

      C1[style=invis, width=0, label="", xlabel="X_1"];
      N1[xlabel="16"];
      N2[xlabel="4"];
      {rank=same; C1; N1; N2; }

      C2[style=invis, width=0, label="", xlabel="X_2"];
      N3[xlabel="32"];
      N4[xlabel="8"];
      N5[xlabel="2"];
      {rank=same; C2; N3; N4; N5; }

      // align labels
      C0 -> C1 [style=invis, weight=10];
      C1 -> C2 [style=invis, weight=10];

      N0 -> N1 [label="UU, UD"];
      N0 -> N2 [label="DU, DD"];
      
      N1 -> N3 [label="UU"];
      N1 -> N4 [label="UD"];
      
      N2 -> N4 [label="DU"];
      N2 -> N5 [label="DD"];
    }
  ```
)

Define two $sigma$-algebras:

- $cal(F)_k = sigma(X_i : 0 lt.eq i lt.eq k)$
- $cal(G)_k = sigma(X_k)$

$cal(G)_0 = {diameter, Omega} = cal(F)_0$

$cal(G)_1 = sigma(X_1) = {diameter, {U U, U D}, {D U, D D}, Omega}$

$cal(F)_1 = sigma(X_0, X_1) = cal(G)_1$

$cal(G)_2 = sigma(X_2) = {diameter, Omega, {U U}, {D D}, {U D, D U}, {U U, D D}, {U U, U D, D U}, {D D, U D, D U}}$

$cal(F)_2 = sigma(X_0, X_1, X_2) = 2^Omega$

#definition[
  $FF = (cal(F)_k)_(k=0,1,2)$ is a *filtration*, when $cal(F)_i subset.eq cal(F)_j$ for all $i < j$.
]

$FF$ is a filtration (represents all information up to time $k$), while $GG$ is not.