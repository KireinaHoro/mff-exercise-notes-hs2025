#import "../template.typ": attempt, feedback
#import "exsheet-template.typ": *
#import "@preview/physica:0.9.5": *

#show: exsheet.with(2)

#exercise() Consider a probability space $(Omega, cal(F), P)$ with a filtration $FF = (cal(F)_k)_(k in NN_0)$.

1. Let $X$ be a martingale.  Show that for any bounded and convex function $f: RR -> RR$, the process $f(X) = (f(X_k))_(k in NN_0)$ is a submartingale.

#attempt[
  $E[X_l | cal(F)_k] = X_k quad Q"-a.s. for" k <= l.$ 

  With the Jensen's inequality, $f(X_k) = f(E[X_l | cal(F)_k]) <= E[f(X_l) | cal(F)_k] quad Q$-a.s. for $k <= l$.

  Therefore $f(X)$ is a submartingale.  $qed$
]

2. Let $X$ be a submartingale and $theta.alt = (theta.alt_k)_(k in NN_0)$ a bounded, nonnegative and predictable process.
   Show that the stochastic integral process $theta.alt circle.filled.small X$, defined by

   $ theta.alt circle.filled.small X_k := sum_(j=1)^k theta.alt_j Delta X_j = sum_(j=1)^k theta.alt_j (X_j - X_(j-1)) quad "for" k in NN_0, $

   is a submartingale.  Conclude that $E[theta.alt circle.small.filled X_k] >= 0$ for all $k in NN_0$.

#attempt[
    
]