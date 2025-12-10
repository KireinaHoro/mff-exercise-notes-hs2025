#import "../template.typ": *
#import "exsheet-template.typ": *
#import "@preview/physica:0.9.5": *
#import "@preview/ouset:0.2.0": *
#import "@preview/diagraph:0.3.6": raw-render

#show: exsheet.with(11)

#exercise() Let $(Omega, cal(F), P)$ be a probability space with a filtration $FF = (cal(F)_t)_(t>=0)$ satisfying the usual conditions.  Let $W = (W_t)_(t>=0)$ be a Brownian motion with respect to $P$ and $FF$.  For any $t >= 0$, using Itô's formula, write the following as stochastic integrals:

1. $W_t^2$.

#attempt[
  Take $f(x) := x^2 => f'(x) = 2x, f''(x) = 2$.

  $
    f(W_t) &= f(W_0) + integral_0^t f'(W_s) dd(W_s) + 1/2 integral_0^t f''(W_s) dd(\[W]_s) \
    W_t^2 &= 2 integral_0^t W_s dd(W_s) + t.
  $
]

2. $t^2 W_t$.
#attempt[
  Take $f(x, t) := t^2 x => f_x (x, t) = t^2, f_t (x, t) = 2 x t, f_(x x) (x, t) = 0.$
  $
    f(W_t, t) &= f(W_0, 0) + integral_0^t f_x (W_s, s) dd(W_s) + integral_0^t f_t (W_s, s) dd(s) + 1/2 integral_0^t f_(x x) (W_s, s) dd(\[W]_s) \
    t^2 W_t &= integral_0^t s^2 dd(W_s) + integral_0^t 2s W_s dd(s).
  $
]

3. $sin(2t - W_t)$.

#attempt[
  Take $f(x, t) :=sin(2t - x) => f_x (x, t) = -cos(2t-x), f_t (x, t) = 2cos(2t-x), f_(x x) (x, t) = -sin(2t-x).$

  $
    f(W_t, t) &= f(W_0, 0) + integral_0^t f_x (W_s, s) dd(W_s) + integral_0^t f_t (W_s, s) dd(s) + 1/2 integral_0^t f_(x x) (W_s, s) dd(\[W]_s) \
    sin(2t - W_t) &= -integral_0^t cos(2s - W_s) dd(W_s) + integral_0^t 2cos(2s - W_s) - 1/2 sin(2_s - W_s) dd(s).
  $
]

4. $exp(a t + b W_t)$, where $a, b in RR.$

#attempt[
  Take $f(x, t) := exp(a t + b x) => f_x (x, t) = b exp(a t + b x), f_t (x, t) = a exp(a t + b x), f_(x x) (x, t) = b^2 exp (a t + b x).$
  $
    f(W_t, t) &= f(W_0, 0) + integral_0^t f_x (W_s, s) dd(W_s) + integral_0^t f_t (W_s, s) dd(s) + 1/2 integral_0^t f_(x x) (W_s, s) dd(\[W]_s) \
    exp(a t + b W_t) &= 1 + integral_0^t b exp(a s + b W_s) dd(W_s) + integral_0^t (a + 1/2 b^2) exp(a s + b W_s) dd(s).
  $
]

#exercise() Let $(Omega, cal(F), P)$ be a probability space with a filtration $FF = (cal(F)_t)_(t>=0)$ satisfying the usual conditions.  Let $W = (W_t)_(t>=0)$ be a Brownian motion with respect to $P$ and $FF$.

1. Let $f in C(RR; RR).$  Show that the stochastic integral $(integral_0^t f(W_s) dd(W_s))_(t>=0)$ is a continuous local martingale.

#attempt[
  Take stopping times $tau_n := inf{t>0 :integral_0^t f(W_s)dd(W_s) >= n} and n$.  Approximate the stopped process $f(W_s)^(tau_n)$ with a series of processes $H^m in b cal(E)$, s.t.
  $
    lim_(m->infinity) E[ integral_0^infinity |H^m_s - f(W_s)^(tau_n)|^2 dd(W_s) ] = 0.
  $

  By Ito's isometry and Doob's inequality,

  $
    E[sup_(t in (0,T]) |integral_0^t H^m_s - f(W_s)^(tau_n) dd(W_s)|^2] &= E[sup_(t in (0,T]) integral_0^t |H^m_s - f(W_s)^(tau_n)|^2 dd(s) ] \
    &<= 4 E[(H^m - f(W))_T^2] -> 0.
  $

  Hence continuous $H^m$ ucp-converges to $f(W_s)^(tau_n)$, thus $f(W_s)^(tau_n)$ can have a continuous version.

  Since $b cal(E) in.rev H^m = sum_i H^m_i bb(1)_((t_i, t_(i+1)])$,

  $
    E[integral_u^t H^m dd(W_s) | cal(F)_u] &= E[sum_(t_i >= u) H^m_i (W_t_(i+1) - W_t_i) | cal(F)_u] \
    &= sum_(t_i >= u) E[H^m_i (W_t_(i+1) - W_t_i) | cal(F)_(t_i)] = 0.
  $

  With Itô's isometry, pass to the limit, we get $E[integral_u^t f(W_s)^(tau_n) dd(W_s) | cal(F)_u] = 0$.  Hence the local martingale property
  $
    E[integral_0^(t and tau_n) f(W_s)^(tau_n) dd(W_s) | cal(F)_u] = integral_0^(s and tau_n) f(W_s)^(tau_n) dd(W_s).
  $
  holds.  $qed$
]

2. Let $f in C^2(RR; RR).$  Show that $(f(W_t))_(t>=0)$ is a continuous local martingale if and only if $integral_0^t f''(W_s)dd(s) = 0 quad P$-a.s. for all $t>=0$.

#attempt[
  Apply Itô's formula:

  $
    f(W_t) - f(W_0) = integral_0^t f'(W_s) dd(W_s) + 1/2 integral_0^t f''(W_s) dd(s)
  $

  $f' in C(RR; RR)$, hence the first term on RHS is a continuous local martingale null at zero.  $integral_0^t f''(W_s) dd(s)$ is a normal Lebesgue integral and has finite variation.

  $f(W_t)$ is a continuous local martingale \
  $<=>$ LHS is a continuous local martingale null at 0 \
  $<=>$ second term on RHS is a continuous local martignale null at 0 \
  $<=>$ second term on RHS $= 0 quad P$-a.s. $qed$
]

3. Let $f in C^2(RR; RR).$  Using part (b), show that $(f(W_t))_(t>=0)$ is a continuous local martingale if and only if $f(x) = alpha x + beta$ for some $alpha, beta in RR$.

#attempt[
  We need to show $integral_0^t f''(W_s) dd(s) = 0 <=> f(x) = alpha x + beta$.  $arrow.l.double$ is trivial.

  $integral_0^t f''(W_s) dd(s) = 0 quad forall t > 0 => f''(W_t) equiv 0 => f''(x) equiv 0 => exists alpha, beta in RR : f(x) = alpha x + beta. quad qed$
]

#feedback[
  Need to explain more why $f''(W_t) equiv 0 => f''(x) equiv 0$: since $limsup W = infinity, liminf W = -infinity quad P$-a.s. and that $W$ is continuous, $forall x in RR, exists t "s.t." W_t = x quad P$-a.s.  Hence $f''(x) = 0$ a.e.  Since $f''$ is continuous, $f''(x) equiv 0$.
]

4. Using Itô's formula, establish which of the following processes are local martingales:
- $(sin W_t - cos W_t)_(t>=0)$.
  #attempt[
    Let $f(x) := sin x - cos x => f'(x) = cos x + sin x, f''(x) = -sin x + cos x.$
    
    $
      sin W_t - cos W_t = -1 + integral_0^t cos W_s + sin W_s dd(W_s) + 1/2 integral_0^t -sin W_s + cos W_s dd(s)
    $

    cannot be a local martingale since $f''(x) equiv.not 0$.
  ]

- $(exp(1/2 a^2t) cos(a W_t - b))_(t>=0)$, where $a, b in RR.$
  #attempt[
    Let $f(x, t) := exp(1/2 a^2t) cos(a x - b) => f_x (x, t) = -a exp(1/2 a^2t) sin(a x - b), f_t (x, t) = 1/2 a^2 exp(1/2 a^2 t) cos(a x-b),
    f_(x x) (x, t) = -a^2 exp(1/2 a^2 t) cos(a x - b).$

    $
      exp(1/2 a^2t) cos(a W_t - b)
      &=&& cos(b) + integral_0^t -a exp(1/2a^2s) sin(a W_s - b) dd(W_s) + \
      &&&integral_0^t (1/2 a^2 - 1/2 a^2) exp(1/2 a^2s) cos(a W_s - b) dd(s) \
      &=&& cos(b) + integral_0^t -a exp(1/2a^2s) sin(a W_s - b) dd(W_s)\
    $
    is a local martingale.
  ]

- $(W_t^3-3t W_t)_(t>=0).$
  #attempt[
    Let $f(x, t) := x^3 - 3t x => f_x (x, t) = 3x^2 - 3t, f_t (x, t) = -3x, f_(x x) (x, t) = 6x.$

    $
      W_t^3 - 3t W_t &= integral_0^t 3W_s^2 - 3s dd(W_s) + integral_0^t -3 W_s + 1/2 6W_s dd(s) \
      &= 3 integral_0^t W_s^2 - s dd(W_s)
    $
    is a local martignale.
  ]

#exercise() Let $(Omega, cal(F), P)$ be a probability space with a filtration $FF = (cal(F)_t)_(t>=0)$ satisfying the usual conditions.  Let $W = (W_t)_(t>=0)$ be a Brownian motion with respect to $P$ and $FF$
and $X = (X_t)_(t>=0)$ the process defined as $X_t := W^p_t - p t W_t$, for $p in NN$ with $p >= 2$.  Is $X$ a local martingale?  If so,
is it even a true martingale?
#attempt[
  Let $f(x, t) := x^p - p t x => f_x (x, t) = p x^(p-1) - p t, f_t (x, t) = -p x, f_(x x) (x, t) = p(p-1) x^(p-2).$

  Apply Itô's formula:

  $
    X_t = integral_0^t p W_s^(p-1) - p s dd(W_s) + integral_0^t -p W_s + 1/2p(p-1) W_s^(p-2) dd(s)
  $

  For $X_t$ to be a local martingale, the drift term must be identically zero:

  $
    -p W_s + 1/2p(p-1) W_s^(p-2) equiv 0 => p = 3.
  $

  When $p > 3$, the drift term is not zero, and $X$ is only a semimartingale and not a local martingale.

  When $p=3$, $X_t = W_t^3 - 3t W_t$ is a continuous local martingale: take the standard stopping times $tau_n := inf{t > 0 : |W_t| > n} and n$,
  since $X_t = integral_0^t 3 W_s^2 - 3s dd(W_s)$ and the integrand is bounded.  Hence 
  the martingale property holds:
  $
    E[X_(t and tau_n) | cal(F)_s] = X_(s and tau_n)
  $

  Since $X_(t and tau_n) = W_(t and tau_n)^3 - 3(t and tau_n) W_(t and tau_n)$ is bounded since $W^(tau_n)$ is:
  $
  W_(tau and tau_n) &<= sup_(0<=u<=t) |W_u| \
  &<= sup_(0<=u<=t) W_u - inf_(0<=u<=t) W_u \
  &ouset(=, d) 2|W_t|.
  $
  Take limit $n->infinity$:
  $
    lim_(n->infinity) E[X_(t and tau_n) | cal(F)_s] &= E[lim_(n->infinity) X_(t and tau_n) | cal(F)_s] && quad "(DCT)" \
    &= E[X_t | cal(F)_s] \
    &= lim_(n->infinity) X_(s and tau_n) \
    &= X_s && quad "(continuity of" X ")".
  $

  Hence $X$ is a true martingale when $p=3$.
]