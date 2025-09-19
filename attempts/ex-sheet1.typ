#import "../template.typ": attempt, feedback

= Submission Exercise Sheet 1

== Exercise 1.1

Let $(Omega, cal(F))$ be the measurable space consisting of the sample space $Omega := {H, T}^2$ of all sequences of two coin tosses and the power set $cal(F) := 2^Omega$.  We consider the coordinate random variables

$ Omega in.rev omega = (omega_1, omega_2) |-> X_i (omega) := omega_i in {H, T} quad quad "for" i=1,2, $

and define $S=(S_k)_(k=0,1,2)$ by

$ S_0 := 0, quad S_1 := bb(1)_{X_1=H}, quad S_2 := sum_(i=1)^2 bb(1)_{X_i=H}. $

1. Write down explicitly the $sigma$-algebras $cal(F)_k := sigma(X_i : i=1, ..., k) "for" k = 1, 2$.

#attempt[
  $Omega := {H, T}^2 = {H H, H T, T H, T T} \
  X_1^(-1)({H}) = {{H H, H T}}, quad X_1^(-1)({T}) = {{T H, T T}} \
  cal(F)_1 := sigma(X_1) = { diameter, Omega, {H H, H T}, {T H, T T} } \
  cal(F)_2 := sigma(X_2) = { diameter, Omega, {H T, T T}, {H H, T H} } \
  $
]

2. Consider the collections of $sigma$-algebras $FF = (cal(F)_k)_(k=0,1,2)$ with $cal(F)_0 := {diameter, Omega}, cal(F)_1 "and" cal(F)_2$ as above, and $GG = (cal(G)_k)_(k=0,1,2)$, where $cal(G)_k := sigma (S_k)$.  Are $FF$ and $GG$ two filtrations of $(Omega, cal(F))$? Justify your answer.

#attempt[
  $FF$ is not a filtration: ${H H, H T} in cal(F)_1$ but $in.not cal(F)_2$, contradicting $cal(F)_1 subset.eq cal(F)_2$.
  
  Compute $GG$:

  $\
  cal(G)_0 := sigma(S_0) = { diameter, Omega } \
  cal(G)_1 := sigma(S_1) = { diameter, Omega, { H H, H T }, { T H, T T } } \
  cal(G)_2 := sigma(S_2) = { diameter, Omega, { T T }, { H H, H T, T H}, {H T, T H}, {H H, T T}, {H H}, {T T, H T, T H}} \
  $
  
  $GG$ is not a filtration: ${H H, H T} in cal(G)_1$ but $in.not cal(G)_2$, contradicting $cal(G)_1 subset.eq cal(G)_2$.
  
  Intuitively, neither of the two processes capture "all information" from previous steps, so they are not filtrations.
]

3. Express the event "there is at least one head among the two tosses" as a subset of $cal(F)$, and prove that it is both in $cal(F)_2$ and in $cal(G)$.

#attempt[

]

4. Express the event "the first toss is a head" as a subset of $cal(F)$.  Is it in $cal(F)_2$?  Is it in $cal(G)_2$?  Justify your answers.

#attempt[
  
]