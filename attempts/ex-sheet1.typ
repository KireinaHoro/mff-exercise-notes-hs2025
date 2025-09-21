#import "../template.typ": attempt, feedback
#import "exsheet-template.typ": *
#import "@preview/physica:0.9.5": *

#show: exsheet.with(1)

#exercise() Let $(Omega, cal(F))$ be the measurable space consisting of the sample space $Omega := {H, T}^2$ of all sequences of two coin tosses and the power set $cal(F) := 2^Omega$.  We consider the coordinate random variables

$ Omega in.rev omega = (omega_1, omega_2) |-> X_i (omega) := omega_i in {H, T} quad quad "for" i=1,2, $

and define $S=(S_k)_(k=0,1,2)$ by

$ S_0 := 0, quad S_1 := bb(1)_{X_1=H}, quad S_2 := sum_(i=1)^2 bb(1)_{X_i=H}. $

1. Write down explicitly the $sigma$-algebras $cal(F)_k := sigma(X_i : i=1, ..., k) "for" k = 1, 2$.

#attempt[
  $Omega := {H, T}^2 = {H H, H T, T H, T T} \
  X_1^(-1)({H}) = {{H H, H T}}, quad X_1^(-1)({T}) = {{T H, T T}} \
  cal(F)_1 := sigma(X_1) = { diameter, Omega, {H H, H T}, {T H, T T} } \
  cal(F)_2 := sigma(X_1, X_2) = { diameter, Omega, {H H, H T}, {T H, T T}, {H T, T T}, {H H, T H}, \
  quad {H T}, {H H, T H, T T}, {H H}, {H T, T H, T T}, \
  quad {T T}, {H H, H T, T H}, {T H}, {H H, H T, T T}, \
  quad {H H, T T}, {H T, T H}} = 2^Omega\
  $
]

2. Consider the collections of $sigma$-algebras $FF = (cal(F)_k)_(k=0,1,2)$ with $cal(F)_0 := {diameter, Omega}, cal(F)_1 "and" cal(F)_2$ as above, and $GG = (cal(G)_k)_(k=0,1,2)$, where $cal(G)_k := sigma (S_k)$.  Are $FF$ and $GG$ two filtrations of $(Omega, cal(F))$? Justify your answer.

#attempt[
  $FF$ is a filtration: $cal(F)_0 = {diameter, Omega}$ is the smallest $sigma$-algebra while $cal(F)_2 = 2^Omega$ is the largest, therefore $cal(F)_0 subset.eq cal(F)_1 subset.eq cal(F)_2$ trivially holds.
  
  Compute $GG$:

  $\
  cal(G)_0 := sigma(S_0) = { diameter, Omega } \
  cal(G)_1 := sigma(S_1) = { diameter, Omega, { H H, H T }, { T H, T T } } \
  cal(G)_2 := sigma(S_2) = { diameter, Omega, { T T }, { H H, H T, T H}, {H T, T H}, {H H, T T}, {H H}, {T T, H T, T H}} \
  $
  
  $GG$ is not a filtration: ${H H, H T} in cal(G)_1$ but $in.not cal(G)_2$, contradicting $cal(G)_1 subset.eq cal(G)_2$.
  
  Intuitively, neither of the two processes capture "all information" from previous steps, so they are not filtrations.
]

#pagebreak()

3. Express the event "there is at least one head among the two tosses" as a subset of $cal(F)$, and prove that it is both in $cal(F)_2$ and in $cal(G)_2$.

#attempt[
  Define "at least one head among two tosses" as $X = {H H, H T, T H} in cal(F)$.  $X in 2^Omega = cal(F)_2$ trivially holds.

  From (b), $cal(G)_2 := sigma(S_2) = { diameter, Omega, { T T }, { H H, H T, T H}, {H T, T H}, {H H, T T}, {H H}, {T T, H T, T H}} in.rev X. quad qed$
]

4. Express the event "the first toss is a head" as a subset of $cal(F)$.  Is it in $cal(F)_2$?  Is it in $cal(G)_2$?  Justify your answers.

#attempt[
  Define "first toss is a head" as $Y = {H H, H T} in cal(F) = cal(F)_2 = 2^Omega$, trivially holds.

  From (b), $cal(G)_2 := sigma(S_2) = { diameter, Omega, { T T }, { H H, H T, T H}, {H T, T H}, {H H, T T}, {H H}, {T T, H T, T H}} => Y in.not cal(G)_2.$ 

  Intuitively, since $cal(G)_2$ is the count of heads in both tosses, it's impossible to distinguish "only first toss is head" and "only second toss is head".
]

#exercise() Let $Omega$ be a non-empty set.

1. Suppose that $cal(F)_1$ and $cal(F)_2$ are $sigma$-algebras of $Omega$.  Prove that $cal(F)_1 inter cal(F)_2$ is also a $sigma$-algebra of $Omega$.

#attempt[
  Since $cal(F)_1$ and $cal(F)_2$ are $sigma$-algebras of $Omega$:
  - ${diameter, Omega} subset.eq cal(F)_k$ for $k=1,2$

    $=> {diameter, Omega} subset.eq cal(F)_1 inter cal(F)_2.$

  - $forall A in cal(F)_k quad A^c in cal(F)_k$ for $k=1,2$

    $=> forall tilde(A) in cal(F)_1 inter cal(F)_2 quad tilde(A)^c in cal(F)_1 inter cal(F)_2.$

  - $forall (A_n)_(n in NN) in cal(F)_k quad union.big_(n in NN) A_n in cal(F)_k$ for $k=1,2$

    $=> forall (tilde(A)_n)_(n in NN) in cal(F)_1 inter cal(F)_2 quad union.big_(n in NN) tilde(A)_n in cal(F)_1 inter cal(F)_2.$

  Hence $cal(F)_1 inter cal(F)_2$ is also a $sigma$-algebra of $Omega. quad qed$
]

2. Suppose that $cal(F)_1$ and $cal(F)_2$ are $sigma$-algebras of $Omega$.  Show by a counterexample that $cal(F)_1 union cal(F)_2$ is not necessarily a $sigma$-algebra. \
   _Hint:_ You may consider two $sigma$-algebras $cal(F)_1$ and $cal(F)_2$ of $Omega := {1,2,3}$.

#attempt[
  Take $Omega := {1,2,3}, cal(F)_1 := {diameter, Omega, {1}, {2, 3}}, cal(F)_2 := {diameter, Omega, {2}, {1, 3}}$.

  $cal(F)_1 union cal(F)_2 = {diameter, Omega, {1}, {2}, {2, 3}, {1, 3}} in.rev.not {1, 2} = {1} union {2}$, therefore it is not a $sigma$-algebra.
]

3. Let $cal(F)$ be a $sigma$-algebra of $Omega$ and $A_0 in cal(F)$ a set with the property that for any $A in cal(F)$, either $A_0 subset.eq A$ or $A_0 inter A = diameter$.  Prove that any random variable $X:Omega -> R$ is constant on $A_0$.

#attempt[
  Prove by contradiction.  Assume $exists X:Omega->R$ is a random variable on $Omega$ but not constant on $A_0$ \
  $=> exists omega_1, omega_2 in A_0 "s.t." X(omega_1) != X(omega_2) => omega_1 != omega_2.$  Take $A = {omega_1}$:
  - $|A_0|>=2 > 1 = |A| => A_0 subset.eq.not A$;
  - $omega_1 in A_0 inter A => A_0 inter A != diameter$.

  Contradicts $forall A quad A_0 subset.eq A or A_0 inter A = diameter. quad qed$
]

#exercise() Let $(Omega, cal(F), P)$ be a probability space, $X$ a real-valued and integrable random variable and $cal(G) subset.eq cal(F)$ a sub-$sigma$-algebra.  Then the $P$-a.s.~unique random variable $Z$ such that
- $Z$ is $cal(G)$-measurable and integrable,
- $E[X bb(1)_A]=E[Z bb(1)_A]$ for all $A in cal(G)$
is called the _conditional expectation of $X$ given $cal(G)$_ and is denoted by $E[X|cal(G)]$; see Section 8.2 of the lecture notes.

1. Show that if $X$ is $cal(G)$-measurable, then $E[X|cal(G)] = X$ $P$-a.s.

#attempt[
  _Lemma 1_: $E[X|cal(G)]$ is unique $P$-a.s.

  _Proof_: suppose $Z_1, Z_2$ both satisfy the definition i.e.~$E[Z_k bb(1)_A] = E[X bb(1)_A] quad forall A in cal(G)$ for $k=1,2$.  Hence,
  $0 = E[(Z_1 - Z_2) bb(1)_A]
     = integral_Omega (Z_1 - Z_2) bb(1)_A dd(P)
     = integral_A Z_1 - Z_2 dd(P)$.

  Let $A_n = {Z_1 - Z_2 > 1/n} quad n in NN$.

  $0 = integral_(A_n) Z_1 - Z_2 dd(P)
     >= integral_(A_n) 1/n dd(P)
     = 1/n P(A_n) \
  => P(A_n) = 0 quad forall n in NN. \
  => P(Z_1 - Z_2 > 0) = P(union.big_(n in NN) A_n) = 0.$
  
  Apply the same argument to $Z_2 - Z_1$, $P(Z_2 - Z_1 > 0) = 0 => P(Z_2 - Z_1 = 0) = 1$, hence $Z_1 = Z_2$ $P$-a.s.  $qed$

  #text(fill: red, style: "italic")[
    Note to TA: do we have to prove the lemma?  The question formulated as if it is part of the definition, but it can actually be proved.
  ]

  $X$ also satisfies the definition of $Z = E[X|cal(G)]$:
  - $X$ is $cal(G)$-measurable and integrable
  - $E[X bb(1)_A]$ = $E[X bb(1)_A] quad forall A in cal(G) $, by reflexivity
  $Z$ is $P$-a.s.~unique $=> P(X=Z)=1 => Z=E[X|cal(G)]=X$ $P$-a.s. $qed$
]

2. Show that $E[E[X|cal(G)]] = E[X]$.

#attempt[
  Let $A = Omega$.  $E[E[X|cal(G)]] = E[E[X|cal(G)] bb(1)_Omega] = E[X bb(1)_Omega] = E[X]. quad qed$
]

#pagebreak()

3. Show that if $P[A] in {0,1}$ for all $A in cal(G)$ (that is, if $cal(G)$ is $P$-trivial), then $E[X|cal(G)] = E[X]$ $P$-a.s.

#attempt[
  _Lemma 2 (other side of what's shown in the ex. session)_: $cal(G)$ is $P$-trivial $=> forall X$ that is $cal(G)$-measurable, $X$ is $P$-a.s.~constant.

  _Proof_: Since $cal(G)$ is $P$-trivial, $P(X <= t) in {0,1}$ and is monotone in $t$.
  Since X is real-valued, $exists t_1, t_2 "s.t." P(X <= t_1) = 0, P(X <= t_2) = 1$.

  Let $c := "inf"{t:P(X<=t)=1} => P(X <= c) = 1.$  Such a $c$ exists thanks to $t_1$ and $t_2$.  Therefore:
  - $P(X < c) = "lim"_(t->c) P(X <= t) = 0$
  - $P(X > c) = 1 - P(X <= c) = 0$

  Hence $P(X = c) = 1$, $X$ is $P$-a.s.~constant. $quad qed$

  Using _lemma 1_, $Z = E[X|cal(G)]$ is measurable in $cal(G)$ and therefore must be $P$-a.s.~constant $c$.  Take $A = Omega in cal(G)$:

  $E[bb(1)_Omega X] = E[bb(1)_Omega Z] => E[X] = integral_Omega Z dd(P)$

  Since $Z = c$ $P$-a.s., $E[X] = integral_Omega c dd(P) = c$ $P$-a.s., so $Z = E[X]$ $P$-a.s. $quad qed$
]

4. Consider a real-valued and integrable random variable $Y$ on $(Omega, cal(F), P)$ and let $a, b in RR$.  Show that $E[a X+b Y|cal(G)] = a E[X|cal(G)] + b E[Y|cal(G)]$ $P$-a.s.

#attempt[
  To simplify notation, let $Z_(X) := E[X|cal(G)]$ for all real-valued, integrable random variable $X$.  $Z(dot.op)$ is $cal(G)$-measurable by definition.  $forall A in cal(G)$:

  $E[Z_(a X + b Y) bb(1)_A] &= E[(a X + b Y) bb(1)_A] \
  &= a E[X bb(1)_A] + b E[Y bb(1)_A] \
  &= a E[Z_X bb(1)_A] + b E[Z_Y bb(1)_A] \
  &= E[(a Z_X + b Z_Y) bb(1)_A]. $

  $Z_(a X + b Y)$ and $a Z_X + b Z_Y$ both satisfy the definition of $E[a Z_X + b Z_Y | cal(G)]$ that is $P$-a.s.~unique, hence $Z_(a X + b Y) = a Z_X + b Z_Y$ $P$-a.s. $qed$
]

#pagebreak()

5. Suppose that $cal(G)$ is generated by a finite partition of $Omega$, that is, there exists a collection $(A_i)_(i=1,...,n)$ of sets $A_i in cal(F)$ such that $union.big_(i=1)^n A_i = Omega, A_i inter A_j = diameter$ for $i != j$ and $cal(G) = sigma(A_1, ..., A_n)$.  Additionally, assume that $P[A_i] > 0$ for all $i=1, ..., n$.  Show that

  $ E[X|cal(G)] = sum_(i=1)^n E[X|sigma(A_i)] bb(1)_A_i quad P"-a.s." $

  _Hint 1_: Recall that $E[X|sigma(A_i)] = E[X bb(1)_A_i] \/ P[A_i]$ and try to write $X$ as a sum of random variables each of which only takes non-zero values on a single $A_i$.

  _Hint 2_: Check that any set $A in cal(G)$ has the form $union.big_(j in J) A_j$ for some $J subset.eq {1, ..., n}$.

#attempt[
  From RHS, given $i in {1, ..., n}$, $E[X|sigma(A_i)] bb(1)_A_i = bb(1)_A_i / P[A_i] E[X bb(1)_A_i].$ 

  $X = sum_(i=1)^n (X bb(1)_A_i). $ With the linearity property proved in (d), $E[X|cal(G)] = sum_(i=1)^n E[X bb(1)_A_i | cal(G)].$  Therefore we just need to show:

  $ E[X bb(1)_A_i | cal(G)] = bb(1)_A_i / P[A_i] E[X bb(1)_A_i] quad forall i in {1, .., n}. $

  Since $E[dot.op | cal(G)]$ is $cal(G)$-mesurable and $cal(G) = sigma(A_i : i in {1, ..., n})$ is finite, there must $exists (c^i_j)_(j in {1, ..., n})$ s.t.
  $E[X bb(1)_A_i | cal(G)] = sum_(j=1)^n c^i_j bb(1)_A_j$.

  Per definition,
  $E[E[X bb(1)_A_i | cal(G)] bb(1)_A]
  = E[(sum_(j=1)^n c^i_j bb(1)_A_j) bb(1)_A]
  = E[X bb(1)_A_i bb(1)_A] quad forall A in cal(G)$.

  Since $A_i$ are pairwise disjoint, $ bb(1)_A_i bb(1)_A_j = cases(
    0         & "if" i!=j,
    bb(1)_A_i & "otherwise."
  ) $
  
  Take $A = A_k quad forall k in {1, ..., n}$.
  - When $k = i$, we have $E[c^i_i bb(1)_A_i] = P[A_i] c^i_i = E[X bb(1)_A_i]
  => c^i_i = 1/P[A_i] E[X bb(1)_A_i]$;
  - When $k != i$, we have $E[c^i_k bb(1)_A_k] = P[A_k] c^i_k = 0 => c^i_k = 0$.

  Therefore, $E[X bb(1)_A_i | cal(G)] = bb(1)_A_i / P[A_i] E[X bb(1)_A_i].  quad qed$
]