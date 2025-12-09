#import "../template.typ": *
#import "exsheet-template.typ": *
#import "@preview/physica:0.9.5": *
#import "@preview/ouset:0.2.0": *
#import "@preview/diagraph:0.3.6": raw-render

#show: exsheet.with(12)

#exercise() Let $(Omega, cal(F), P)$ be a probability space with a filtration $FF = (cal(F)_t)_(t>=0)$ satisfying the usual conditions.  Let $X = (X_t)_(t>=0)$ and $Y = (Y_t)_(t>=0)$ be two continuous semimartingales.  Show that

$
  X_t^2 Y_t^2 = &X_0^2 Y_0^2 + 2 integral_0^t X_s Y_s^2 dd(X_s) + 2 integral_0^t X_s^2 Y_s dd(Y_s) \
  &+ integral_0^t Y_s^2 dd(\[X]_s) + integral_0^t X_s^2 dd(\[Y]_s) + 4 integral_0^t X_s Y_s dd(\[X\,Y]_s) quad P"-a.s., for" t >=0.
$

#attempt[
  Apply Ito's formula to $X^2$ and $Y^2$:
  
  $
    dd(X^2_t) = 2X_t dd(X_t) + dd(\[X]_t) \
    dd(Y^2_t) = 2Y_t dd(Y_t) + dd(\[Y]_t)
  $
  
  Apply product's rule:

  $
    dd(X_t^2 Y_t^2) &= Y^2_t dd(X^2_t) + X^2_t dd(Y^2_t) + dd(\[X^2\,Y^2]_t) \
    &= 2 X_t Y_t^2 dd(X_t) +  Y_t^2 dd(\[X]_t) + 2 X_t^2 Y_t dd(Y_t) + X_t^2 dd(\[Y]_t) + 4X_t^2 Y_t^2 dd(\[X\,Y]_t)
  $
  
  Rewrite the differential notation as integrals from 0 to $t$ gives the result.  $qed$
]

#exercise() Let $(Omega, cal(F), P)$ be a probability space with a filtration $FF = (cal(F)_t)_(t>=0)$ satisfying the usual conditions.  Let $X = (X_t)_(t>=0)$ be a continuous semimartingale null at 0.  We define the process $Z=(Z_t)_(t>=0)$ by

$
  Z_t := cal(E) (X)_t := exp(X_t - 1/2 [X]_t).
$

1. Show via Ito's formula that

  #[
  #set math.equation(numbering: "(1)")
  $
    Z_t = 1 + integral_0^t Z_s dd(X_s) quad P"-a.s., for" t >= 0.
  $ <z-sde>
  ]
  
  Conclude that $Z$ is a continuous local martingale if and only if $X$ is a continuous local martingale.
  
  #attempt[
    Let $f(x, t) := exp(x - 1/2t)$.  Apply Ito's formula:

    $
      dd(exp(X_t-1/2 [X]_t)) &= exp(X_t - 1/2[X]_t) dd(X_t) + (-1/2 + 1/2)exp(X_t - 1/2[X]_t) dd(\[X]_t) \
      &= exp(X_t - 1/2[X]_t) dd(X_t).
    $
    
    Write as integral form:

    $
      exp(X_t - 1/2[X]_t) = 1 + integral_0^t Z_s dd(X_s).
    $
    
    Since $1$ is a constant and thus a continuous local martingale, $Z$ is a continuous local martingale $<=> integral Z dd(X)$ is a continuous local martingale $<=> X$ is a continuous local martingale. $qed$
  ]

2. Prove that $Z = cal(E)(X)$ is the unique solution of @z-sde.

  #attempt[
    Assume $Z'$ also satisfies $dd(Z') = Z' dd(X)$.  Compute $dd(Z'/Z)$:

    $
      dd(Z'/Z) 
      &= 1/Z dd(Z') - Z' dd(1/Z) + [Z', 1/Z] \
      &= 1/Z dd(Z') - Z'/Z^2 dd(Z) + Z'/Z^3 dd(\[Z]) - 1/Z^2 dd(\[Z\,Z']) \
      &= Z'/Z dd(X) - Z'/Z dd(X) - Z'/Z dd(\[X]) + Z'/Z dd(\[X]) = 0.
    $
    
    Hence $Z'/Z equiv c != 0$.  Since $Z'_0 = Z_0 = 1$, $Z' equiv Z$, thus the solution is unique. $qed$
  ]
  
3. Let $Y = (Y_t)_(t>=0)$ be another continuous semimartingale null at 0.  Prove _Yor's formula_
  $
    cal(E)(X)cal(E)(Y) = cal(E)(X + Y + [X,Y]) quad P"-a.s."
  $
  
  #attempt[
    $"LHS" = exp(X - 1/2[X]) exp(Y - 1/2[Y]) = exp(X + Y - 1/2([X] + [Y])).$

    $"RHS" = exp(X + Y + [X, Y] - 1/2 [X + Y + [X, Y]])$.
    
    Hence we need to show $-1/2 ([X] + [Y]) = [X, Y] - 1/2 [X+Y+[X, Y]]$, which is just $[X + Y + [X,Y]] = [X] + [Y] + 2[X, Y]$, holds since $[X, Y]$ has finite variation.  $qed$
  ]
  
#exercise() Fix $T > 0$.  We consider a probability space $(Omega, cal(F), P)$ with a filtration $FF = (cal(F)_t)_(t in [0,T])$ satisfying the usual conditions and two independent Brownian motions $W^1 =(W^1_t)_(t in [0,T])$ and $W^2 = (W^2_t)_(t in [0,T])$ with respect to $P$ and $FF$.  Fix some $beta_1, beta_2 in RR.$

1. Define the continuous martingale
  $
    L^((beta_1, beta_2)) := beta_1 W^1 + beta_2 W^2.
  $
  Show that the stochastic exponential $Z^((beta_1, beta_2)) := cal(E)(L^((beta_1, beta_2)))$ is a true martingale on $[0, T]$.

  #attempt[
    $Z^((beta_1, beta_2)) = exp(beta_1 W^1 + beta_2 W^2 - 1/2(beta_1^2 + beta_2^2) t) = M_1 M_2$, where $M^dot := exp(beta_dot W^dot - beta_dot^2/2 t).$
    To show $Z^((beta_1, beta_2))$ is a true martingale, we just need to show $M^dot$ is a true martingale.  Take $0<=t<=s$:

    $
      E[M_t^dot | cal(F)_s] &= M_s^dot E[M^dot_(t-s) | cal(F)_s] \
      &= M_s^dot E[exp(beta_dot W^dot_(t - s) - beta_dot^2/2 (t-s)) | cal(F)_s] \
      &= M_s^dot E[exp(beta_dot W^dot_(t - s))] exp(- beta_dot^2/2 (t-s)) \
      &= M_s^dot.
    $
    
    Apparently $M_t^dot$ is also adapted and integrable, hence $M^dot$ is a true martingale.  Hence $Z^((beta_1, beta_2))$ is the product of two martingales and thus a martingale as well. $qed$
  ]
  
2. Define the probability measure $Q^((beta_1, beta_2))$ by
  $
    dd(Q^((beta_1, beta_2))) = Z^((beta_1, beta_2))_T dd(P).
  $
  Using Girsanov's theorem, prove that the two processes $tilde(W)^1$ and $tilde(W)^2$ given by $tilde(W)^1_t := W^1_t - beta_1 t$ and $tilde(W)^2_t := W^2_t - beta_2 t$ are local $Q^((beta_1, beta_2))$-martingales on $[0, T]$.  Moreover, define $B := alpha W^1 + sqrt(1-alpha^2) W^2$ for some $alpha in (-1, 1)$, and prove that
  $
    tilde(B)_t := B_t - (alpha beta_1 + sqrt(1-alpha^2) beta_2) t, quad t in [0, T],
  $
  is also a local $Q^((beta_1, beta_2))$-martingale on $[0, T]$.
  
  #attempt[
    Density process of $Q^((beta_1, beta_2))$ $Z^((beta_1, beta_2)) = cal(E)(L^((beta_1, beta_2)))$, where $L^((beta_1, beta_2)) = beta_1 W^1 + beta_2 W^2.$ Therefore $tilde(W)^1 = W^1 - beta_1 t = W^1 - beta_1 [W^1] = W^1 - [beta_1 W^1 + beta_2 W^2, W^1]$ is a local martingale null at 0 (Girsanov).  Same argument applies to $tilde(W)^2$.

    For $tilde(B)$, we need to show

    $
      [alpha W^1 + sqrt(1-alpha^2) W^2, beta_1 W^1 + beta_2 W^2] = (alpha beta_1 + sqrt(1-alpha^2) beta_2) t.
    $
    
    $"LHS" = [alpha W^1, beta_1 W^1] + [sqrt(1-alpha^2) W^2, beta_2 W^2] = "RHS". quad qed$
  ]