// ─── Color Palette ───────────────────────────────────────────────────────────

#let body-color = luma(26)
#let rule-color = luma(180)
#let thm-stroke-color = luma(140)
#let thm-fill = luma(252)
#let rmk-fill = rgb("#FDFBF7")

// ─── Document Metadata ──────────────────────────────────────────────────────

#set document(
  title: "The Harmonic Range and Maximum Entropy",
  author: "theurgi",
)

// ─── Page Layout ─────────────────────────────────────────────────────────────

#set page(
  paper: "a4",
  margin: (x: 3cm, y: 3.25cm),
  numbering: "1",
  number-align: center,
)

// ─── Typography ──────────────────────────────────────────────────────────────

#set text(font: "Libertinus Serif", size: 11pt, fill: body-color)
#show math.equation: set text(font: "Libertinus Math", size: 11pt)
#set par(justify: true, leading: 0.75em, spacing: 1em)
#set heading(numbering: "1.1.")

// Generous breathing room around display equations
#show math.equation.where(block: true): set block(above: 1.2em, below: 1.2em)

// ─── Heading Styles ──────────────────────────────────────────────────────────

#show heading.where(level: 1): it => {
  v(1.8em)
  text(size: 13.5pt, weight: 600, fill: body-color, it)
  v(0.8em)
}

#show heading.where(level: 2): it => {
  v(1.2em)
  text(size: 11.5pt, weight: 600, fill: body-color, it)
  v(0.5em)
}

#show heading.where(level: 3): it => {
  v(0.8em)
  text(size: 11pt, weight: 600, fill: body-color, it)
  v(0.3em)
}

// ─── Theorem-like Environments ───────────────────────────────────────────────

#let thmbox(kind, title, body) = block(
  width: 100%,
  inset: (x: 1.1em, y: 0.85em),
  stroke: (left: 2.5pt + thm-stroke-color),
  fill: thm-fill,
  radius: (right: 2pt),
  [
    #text(weight: "bold")[#kind]#if title != "" [#text(weight: "bold")[ (#text(style: "italic")[#title])]]#text(
      weight: "bold",
    )[.]
    #h(0.5em)
    #text(style: "italic")[#body]
  ],
)

#let theorem(title: "", body) = thmbox("Theorem", title, body)
#let proposition(title: "", body) = thmbox("Proposition", title, body)
#let corollary(title: "", body) = thmbox("Corollary", title, body)

#let definition(title: "", body) = block(
  width: 100%,
  inset: (x: 1.1em, y: 0.85em),
  stroke: (left: 2.5pt + thm-stroke-color),
  fill: thm-fill,
  radius: (right: 2pt),
  [
    #text(weight: "bold")[Definition]#if title != "" [#text(weight: "bold")[ (#text(style: "italic")[#title])]]#text(
      weight: "bold",
    )[.]
    #h(0.5em)
    #body
  ],
)

#let remark(title: "", body) = block(
  width: 100%,
  inset: (x: 1.1em, y: 0.75em),
  fill: rmk-fill,
  radius: 2pt,
  [
    #text(weight: 600, size: 10.5pt)[Remark.]
    #h(0.4em)
    #body
  ],
)

#let proof(body) = block(
  width: 100%,
  inset: (x: 1.1em, y: 0.6em),
  [
    #text(style: "italic")[Proof.]
    #h(0.5em)
    #body #h(1fr, weak: true) $square.filled$
  ],
)

// ─── Section Divider ─────────────────────────────────────────────────────────

#let section-divider = {
  v(0.5em)
  line(length: 100%, stroke: 0.4pt + rule-color)
  v(0.5em)
}

// ─── Table and Figure Styling ────────────────────────────────────────────────

#set table(stroke: 0.4pt + rule-color)
#show figure.caption: it => {
  set text(size: 10pt, fill: luma(80))
  it
}

// ─── Title ───────────────────────────────────────────────────────────────────

#v(2.5em)
#align(center)[
  #text(size: 15pt, weight: 600, fill: body-color, tracking: 0.3pt)[
    The Harmonic Range and Maximum Entropy
  ]
  #v(0.4em)
  #text(size: 11.5pt, weight: 400, fill: luma(80), style: "italic")[
    A Projective-Geometric Characterization
    of the Logistic Map at $r = 4$
  ]
  #v(1.2em)
  #text(size: 12pt, weight: 500)[theurgi] \
  #text(size: 9pt, fill: luma(100))[
    #link("https://orcid.org/0009-0002-2782-6614")[
      ORCID: 0009-0002-2782-6614
    ]
  ]
]
#v(2.5em)

// ─── Abstract ────────────────────────────────────────────────────────────────

#block(
  width: 100%,
  inset: (x: 2.5em, y: 1.2em),
)[
  #align(center)[#text(weight: 600, size: 10pt, tracking: 0.5pt)[ABSTRACT]]
  #v(0.6em)
  #set text(size: 10.5pt)
  #set par(leading: 0.7em)
  The logistic map $f_r (x) = r x(1-x)$ at parameter~$r = 4$ is distinguished
  by a well-known constellation of dynamical properties: surjectivity on
  $[0,1]$, maximal topological entropy $log 2$, an absolutely continuous
  invariant measure, and postcritical finiteness. We observe that these
  properties are equivalent to a classical condition in projective geometry: the
  four structurally distinguished points of $f_r$ on $bb(C P)^1$ --- the
  critical point, critical value, non-trivial fixed point, and the point at
  infinity --- form a _harmonic range_ (cross-ratio $-1$) if and only if
  $r = 4$. This characterization emerges naturally from the realization of $f_4$
  as a quotient of the doubling map on the circle by complex conjugation, whose
  symmetry group is the Klein four-group $V_4 tilde.equiv ZZ slash 2 times
  ZZ slash 2$. The same group is the universal stabilizer of the cross-ratio
  in $S_4$ and underlies the enhanced $D_4$ symmetry specific to the harmonic
  value $lambda = -1$. The harmonic condition is moreover equivalent to $f_4$
  being the unique
  non-trivial Belyi map in the logistic family --- its critical values lie in
  ${0, 1, infinity}$ --- connecting the dynamical characterization to arithmetic
  geometry and the moduli space~$cal(M)_(0,4)$.

  #v(1em)
  #text(size: 8.5pt, fill: luma(100))[
    *MSC 2020:* 14H25, 37B40, 37E05, 37E10, 37F10, 51A05 \
    *Keywords:* logistic map, harmonic range, cross-ratio, Klein four-group, Belyi map, projective geometry, dynamical systems
  ]
]

#section-divider

// ─── 1. Introduction ─────────────────────────────────────────────────────────

= Introduction

The logistic family $f_r (x) = r x(1-x)$, $r in [0,4]$, is among the most
studied objects in dynamical systems. At the endpoint $r = 4$, the map achieves
maximum complexity in a precise sense: it is semiconjugate to the full one-sided
shift on two symbols, its topological entropy equals $log 2$, and it admits an
absolutely continuous invariant measure --- the arcsine distribution. These
facts have been understood since at least the work of Ulam and von Neumann~@UvN47.
For modern treatments, see @dMvS93 and @Mil06.

The purpose of this article is to observe a projective-geometric condition that
belongs naturally on this list. The four dynamically distinguished points of
$f_r$ on the Riemann sphere $bb(C P)^1$ --- the critical point $c$, the
critical value $v$, the non-trivial fixed point $p$, and the point $infinity$
--- form a *harmonic range* (cross-ratio equal to $-1$) if and only if $r = 4$.
This condition is equivalent to the statement that $p$ is the affine midpoint of
$c$ and $v$, or equivalently, that the unique Möbius involution fixing $p$ and
$infinity$ sends $c$ to $v$.

The harmonic range is the most symmetric non-degenerate configuration of four
points on a projective line, with an enhanced stabilizer under permutation: the
dihedral group $D_4$ of order 8, which contains the Klein four-group
$V_4 = ZZ slash 2 times ZZ slash 2$ as a normal subgroup. This same $V_4$
appears
independently as the symmetry group of the doubling map $z mapsto z^2$ on the
unit circle, whose quotient by complex conjugation yields $f_4$. Both
manifestations of $V_4$ trace to the degree-2 structure of the underlying map.

We further observe that the harmonic condition is equivalent to $f_4$ being a
_Belyi map_ --- a rational map whose critical values lie in ${0, 1, infinity}$.
This places the characterization in the setting of arithmetic geometry: by
Belyi's theorem, such maps correspond to algebraic curves defined over number
fields, and their combinatorial data (dessins d'enfants) carry an action of the
absolute Galois group $op("Gal")(overline(QQ) \/ QQ)$. The postcritical set
$op("PC")(f_4) = {0, 1, infinity}$ coincides with the boundary divisor
$partial overline(cal(M))_(0,4)$ of the Deligne--Mumford compactification of the
moduli space of four marked points on $bb(C P)^1$, a relationship that the
Belyi perspective clarifies.

The article is organized as follows. Section 2 recalls the semiconjugacy between
the doubling map and $f_4$ via the quotient by complex conjugation. Section 3
identifies the full Klein four-group of symmetries and its quotients. Section 4
defines the four structural points, computes the cross-ratio, and proves the
harmonic range characterization. Section 5 connects the harmonic condition to
the Belyi property and the moduli space~$cal(M)_(0,4)$. Section 6 discusses
entropy, surjectivity, and the variational principle. Section 7 synthesizes the
full equivalence and offers concluding remarks.

#section-divider

// ─── 2. The Doubling Map and Its Quotient ────────────────────────────────────

= The Doubling Map and Its Quotient

== The doubling map on $S^1$

On the unit circle $S^1 = {z in CC : |z| = 1}$, the *doubling map* is

$ D: S^1 -> S^1 , wide D(z) = z^2 , $

or equivalently $D(e^(i theta)) = e^(2 i theta)$. This is the fundamental
chaotic system of degree 2:

- Every point has exactly two preimages ($z$ and $-z$).
- Lebesgue measure $frac(d theta, 2 pi)$ on $S^1$ is invariant and ergodic.
- The topological entropy is $h_("top")(D) = log 2$.
- The symbolic dynamics, via the partition
  $S^1 = {e^(i theta) : theta in [0, pi)} union {e^(i theta) : theta in [pi, 2pi)}$,
  is the full one-sided shift on ${0,1}^(NN)$.

== The quotient by complex conjugation

Complex conjugation restricts to an involution on $S^1$:

$ beta : S^1 -> S^1 , wide beta(z) = macron(z). $

Since $|z| = 1$ implies $overline(z) = z^(-1)$, this identifies $e^(i theta)$
with $e^(-i theta)$. Crucially, $beta$ *commutes* with $D$:

$ D(overline(z)) = overline(z)^2 = overline(z^2) = overline(D(z)). $

The quotient $S^1 \/ chevron.l beta chevron.r$ (where
$chevron.l beta chevron.r = {e, beta}$ denotes the subgroup generated by
$beta$) is homeomorphic to $[0, pi]$ via
$e^(i theta) mapsto theta in [0, pi]$, and the doubling map descends to a map
on this interval. Under the change of variable

$ x = sin^2 lr((theta / 2)) = frac(1 - cos theta, 2), $

which maps $[0, pi]$ homeomorphically onto $[0,1]$, the descended map takes the
form

$ f_4 (x) = 4x(1-x). $

*Verification.* Starting from $x = frac(1 - cos theta, 2)$:

$
  f_4 (x) = 4 dot frac(1 - cos theta, 2) dot frac(1 + cos theta, 2)
  = 1 - cos^2 theta
  = sin^2 theta
  = frac(1 - cos 2 theta, 2).
$

This is the value of $x$ at $2 theta$, confirming that $f_4$ is the descent of
$theta mapsto 2 theta$. $square$

== Inherited properties

The quotient inherits the dynamical properties of the doubling map:

#figure(
  table(
    columns: (1fr, 1fr),
    align: left,
    table.header([*Property on $S^1$*], [*Inherited property on $[0,1]$*]),
    [Lebesgue measure $frac(d theta, 2 pi)$], [Arcsine measure $mu_4 = frac(d x, pi sqrt(x(1-x)))$],
    [Topological entropy $log 2$], [Topological entropy $log 2$],
    [Full shift on ${0,1}^(NN)$], [Full shift on ${0,1}^(NN)$],
    [2-to-1 covering], [2-to-1 on $(0,1)$, with fold at $x = 1/2$],
  ),
  caption: [Dynamical properties inherited by the quotient.],
)

The invariant measure $mu_4$ is the pushforward of normalized Lebesgue measure
under $x = sin^2(theta \/ 2)$. By the change-of-variables formula,
$d theta = frac(d x, sqrt(x(1-x)))$, and normalization over $[0,1]$ introduces
the factor $1\/pi$.

#remark[
  The semiconjugacy $h(theta) = sin^2(theta\/2)$ satisfies
  $h circle.small D = f_4 circle.small h$, and $h$ is exactly 2-to-1 except at
  the fixed points $theta = 0$ and $theta = pi$ of $beta$. The map $f_4$ is the
  unique quadratic polynomial semiconjugate to the doubling map via a quotient
  by an involution commuting with $D$. The coefficient $r = 4$ is forced: it
  equals $(max_([0,1]) x(1-x))^(-1) = (1\/4)^(-1) = 4$, ensuring that
  $f_4 ([0,1]) = [0,1]$.
]

#section-divider

// ─── 3. The Klein Four-Group ─────────────────────────────────────────────────

= The Klein Four-Group

== Symmetries of the doubling map

The doubling map $D(z) = z^2$ on $CC^* = CC without {0}$ admits a group of four
symmetries:

$ V_4 = {e, alpha, beta, alpha beta}, $

where

- $alpha: z mapsto -z$ (the *deck transformation*: $D(alpha(z)) = D(z)$),
- $beta: z mapsto z^(-1)$ (the *commuting involution*:
  $D(beta(z)) = beta(D(z))$; agrees with complex conjugation on $S^1$),
- $alpha beta: z mapsto -z^(-1)$ (the composition).

These satisfy $alpha^2 = beta^2 = (alpha beta)^2 = e$ and
$alpha beta = beta alpha$, so $V_4 tilde.equiv ZZ\/2 times ZZ\/2$. On the
circle $S^1$, the actions in angular coordinates are:

#figure(
  table(
    columns: (auto, auto, 1fr),
    align: (center, center, left),
    table.header([*Element*], [*Action on $theta$*], [*Geometric meaning*]),
    [$e$], [$theta$], [Identity],
    [$alpha$], [$theta + pi$], [Antipodal map],
    [$beta$], [$-theta$], [Reflection],
    [$alpha beta$], [$pi - theta$], [Complementary reflection],
  ),
  caption: [Actions of $V_4$ in angular coordinates on $S^1$.],
)

#remark[
  The symmetry group is exactly $V_4$ and no larger. The deck group of $D$ has
  order $deg(D) = 2$, contributing one $ZZ\/2$ factor. The unique non-trivial
  automorphism of $S^1$ commuting with $D$ and compatible with the real
  structure is $beta$, contributing the other. The product
  $2 times 2 = 4 = |V_4|$ is thus forced by the degree.
]

== Subgroups and quotients

The Klein four-group has exactly three subgroups of order 2. Two of them yield
clean quotient dynamical systems:

*Quotient by $chevron.l beta chevron.r$* ($z tilde.op z^(-1)$, i.e.,
$theta tilde.op -theta$). The quotient space is $[0,1]$ and the descended map is
the *logistic map* $f_4 (x) = 4x(1-x)$, as shown in Section 2.

*Quotient by $chevron.l alpha chevron.r$* ($z tilde.op -z$, i.e.,
$theta tilde.op theta + pi$). The quotient space is again a circle $S^1$,
parameterized by $w = z^2$, and the descended map is $w mapsto w^2$ --- the
*doubling map* again (or equivalently, the *power map* on the quotient circle).

Both descended systems have topological entropy $log 2$, full shift symbolic dynamics,
and equivalent invariant measures.

#remark[
  The third involution $alpha beta: theta mapsto pi - theta$ does _not_ commute
  with $D$, nor is it a deck transformation; one checks that
  $D circle.small (alpha beta) = beta circle.small D != (alpha beta) circle.small D$.
  Consequently, $D$ does not descend to a well-defined map on
  $S^1 \/ chevron.l alpha beta chevron.r$. However, the identity
  $D circle.small (alpha beta) = beta circle.small D$ shows that $D$ intertwines
  the $alpha beta$- and $beta$-quotients. On the $beta$-quotient $[0,1]$
  (parameterized by $x = sin^2(theta\/2)$), the homeomorphism
  $phi(x) = (2\/pi) arcsin(sqrt(x))$ of $[0,1]$ conjugates $f_4$ to the tent
  map $T(x) = 1 - |2x - 1|$, i.e., $phi circle.small f_4 = T circle.small phi$.
  This conjugacy straightens the arcsine measure to Lebesgue measure.
]

#section-divider

// ─── 4. The Harmonic Range Characterization ───────────────────────────────────

= The Harmonic Range Characterization

== The four structural points

For $r in (2, 4]$, the quadratic map $f_r (z) = r z(1-z)$, viewed as a
rational map of degree 2 on $bb(C P)^1$, has four dynamically distinguished
points:

#figure(
  table(
    columns: (auto, auto, 1fr),
    align: (center, center, left),
    table.header([*Point*], [*Value*], [*Role*]),
    [$c$], [$1\/2$], [$f'_r (c) = 0$ (critical point)],
    [$v$], [$r\/4$], [$f_r (c)$ (critical value)],
    [$p$], [$1 - 1\/r$], [Non-trivial fixed point (multiplier $f'_r (p) = 2 - r$)],
    [$infinity$], [$infinity$], [Superattracting fixed point ($f_r (infinity) = infinity$, local degree 2)],
  ),
  caption: [The four dynamically distinguished points of $f_r$.],
)

These four points are distinct for $r in (2,4]$ (at $r = 2$, we have
$c = p = 1\/2$). Their configuration on the projective line $bb(C P)^1$ is
governed by the cross-ratio.

== The cross-ratio

Using the standard convention for cross-ratio with one point at infinity:

$ (c, v; p, infinity) = frac(c - p, v - p). $

Substituting the values:

$
  lambda(r) & = frac(1\/2 - (1 - 1\/r), r\/4 - (1 - 1\/r)) \
            & = frac((2-r)\/(2r), (r-2)^2\/(4r)) \
            & = frac(4(2-r), 2(r-2)^2) \
            & = frac(-2, r-2).
$

Thus:

$
  #box(stroke: 0.6pt + thm-stroke-color, inset: (x: 0.7em, y: 0.7em), radius: 2pt)[$lambda(r) = (c, v; p, infinity) = frac(-2, r-2).$]
$

This is a Möbius function of $r$, taking the values:

#figure(
  table(
    columns: (auto, auto, 1fr),
    align: (center, center, left),
    table.header([*$r$*], [*$lambda(r)$*], [*Configuration*]),
    [$2$], [$plus.minus infinity$], [Degenerate ($c = p$)],
    [$3$], [$-2$], [Generic],
    [$4$], [$-1$], [*Harmonic*],
  ),
  caption: [Cross-ratio values at distinguished parameters.],
)

== The characterization

#proposition(title: "4.3")[
  Among the logistic maps $f_r$ with $r in (2, 4]$, the four structural points
  $(c, v; p, infinity)$ form a harmonic range --- that is, their cross-ratio
  equals $-1$ --- if and only if $r = 4$.
]

#proof[
  Setting $lambda(r) = -1$:
  $ (-2)/(r - 2) = - 1 ==> r - 2 = 2 ==> r = 4 . $
]

#corollary[
  At $r = 4$, the non-trivial fixed point is the affine midpoint of the
  critical point and the critical value:
  $ p = frac(c + v, 2) = frac(1\/2 + 1, 2) = frac(3, 4). $
  This is equivalent to the harmonic range condition when one of the four points
  is $infinity$.
]

#proof[
  When $D = infinity$, the cross-ratio $(A, B; C, infinity) = frac(A-C, B-C)$
  equals $-1$ if and only if $C = frac(A+B, 2)$.
]

== The other fixed point

The logistic map $f_r$ has _two_ finite fixed points: the non-trivial fixed
point $p = 1 - 1\/r$ used above, and the trivial fixed point $q = 0$. One may
ask whether the harmonic geometry depends on this choice.

Computing the cross-ratio with $q$ in place of $p$:

$ (c, v; q, infinity) = frac(c - q, v - q) = frac(1\/2 - 0, r\/4 - 0) = frac(2, r). $

At $r = 4$, this evaluates to $1\/2$. The anharmonic orbit of the harmonic
cross-ratio $-1$ is

$ {-1, 1\/2, 2}, $

obtained by applying the six Möbius transformations
$lambda mapsto {lambda, 1\/lambda, 1-lambda, 1\/(1-lambda), lambda\/(lambda-1), (lambda-1)\/lambda}$
to $lambda = -1$ (see, e.g.,~@Ber87). Since $1\/2$ belongs to this orbit,
the four points $(c, v; q, infinity)$ also form a harmonic range at $r = 4$.

This is not coincidental. The cross-ratio $(c, v; q, infinity) = 1\/2$ lies in
the same anharmonic orbit as $(c, v; p, infinity) = -1$: the substitution of
$q$ for $p$ corresponds to a transposition in $S_4$ that changes the cross-ratio
from $-1$ to $1\/2$ via the Möbius transformation
$lambda mapsto lambda\/(lambda-1)$. Indeed,
$(-1)\/((-1)-1) = (-1)\/(-2) = 1\/2$.

More formally: when the fourth point is fixed at $D = infinity$, the remaining
three points may be permuted freely; this residual symmetry is the group $S_3$
of order 6, which acts on the cross-ratio by exactly the six Möbius
transformations listed above. The anharmonic orbit ${-1, 1\/2, 2}$ is precisely
the $S_3$-orbit of any harmonic cross-ratio value. Substituting $p$ for $q$
permutes the arguments $(c, v; dot, infinity)$, thereby moving within this orbit.

The harmonic geometry of $f_4$ is therefore _robust_: it holds regardless of
which fixed point --- $p$ or $q$ --- is chosen as the third element of the
cross-ratio tuple.

== The harmonic involution

The classical characterization of the harmonic range involves involutions. Given
four points on $bb(C P)^1$, there are two distinct types of associated Möbius
involutions:

+ *Pair-swapping involutions.* For any four distinct points $(A, B; C, D)$,
  there exists a Möbius involution simultaneously swapping $A <-> B$ and
  $C <-> D$. This exists for _all_ four-point configurations, regardless of the
  cross-ratio.

+ *Fixed-point involutions.* The Möbius involution with _fixed points_ $C$ and
  $D$ maps $A$ to $B$ if and only if $(A, B; C, D) = -1$.

It is the second type that characterizes the harmonic range. At $r = 4$, the
unique Möbius involution with fixed points $p = 3\/4$ and $infinity$ is the
affine reflection about $p$:

$ S(z) = 3\/2 - z, $

and indeed $S(c) = S(1\/2) = 1 = v$ and $S(v) = S(1) = 1\/2 = c$. The
existence of this involution --- fixing the pair ${p, infinity}$ while
exchanging the pair ${c, v}$ --- is equivalent to the harmonic condition
$lambda = -1$ and therefore to $r = 4$.

For $r != 4$, the affine reflection about $p = 1 - 1\/r$ is
$S_r (z) = 2(1 - 1\/r) - z$, and one computes
$S_r (c) = S_r (1\/2) = 3\/2 - 2\/r$. This equals $v = r\/4$ only when
$3\/2 - 2\/r = r\/4$, which gives $r^2 - 6r + 8 = (r-2)(r-4) = 0$. Since
$r > 2$, we obtain $r = 4$.

There also exists, for any $r in (2,4]$, a pair-swapping involution $T_r$ that
simultaneously exchanges ${c, v}$ and ${p, infinity}$. At $r = 4$, this takes
the explicit form:

$ T(z) = frac(6z - 5, 8z - 6), $

which satisfies $T^2 = op("id")$, $T(1\/2) = 1$, $T(1) = 1\/2$,
$T(3\/4) = infinity$, $T(infinity) = 3\/4$.

*Verification.* We need $T$ to be a Möbius transformation of order 2 with
$T(1\/2) = 1$, $T(1) = 1\/2$, $T(3\/4) = infinity$, and $T(infinity) = 3\/4$.

From $T(infinity) = 3\/4$, write $T(z) = frac(a z+b, c z+d)$; then
$T(infinity) = a\/c = 3\/4$, so set $a = 3$, $c = 4$:
$T(z) = frac(3z+b, 4z+d)$.

From $T(3\/4) = infinity$: $4(3\/4) + d = 0$, giving $d = -3$. So
$T(z) = frac(3z+b, 4z-3)$.

From $T(1\/2) = 1$: $frac(3\/2 + b, 2 - 3) = 1$, giving $3\/2 + b = -1$, so
$b = -5\/2$. Hence $T(z) = frac(3z - 5\/2, 4z - 3) = frac(6z - 5, 8z - 6)$.

Check: $T(1) = frac(6-5, 8-6) = frac(1, 2)$. $checkmark$

Check:
$
  T^2(z) = T lr((frac(6z-5, 8z-6))) & = frac(6 dot frac(6z-5, 8z-6) - 5, 8 dot frac(6z-5, 8z-6) - 6) \
                                    & = frac(36z - 30 - 5(8z-6), 48z - 40 - 6(8z-6)) \
                                    & = frac(36z - 30 - 40z + 30, 48z - 40 - 48z + 36) \
                                    & = frac(-4z, -4) = z. quad checkmark
$

The distinction between these two types of involution is essential: the
pair-swapping involution $T$ exists for all $r$ and carries no special
information, while the fixed-point involution $S$ exchanging $c$ and $v$ exists
only at $r = 4$ and encodes the harmonic condition.

== Connection to $V_4$

The link between the harmonic range and the Klein four-group is classical (see, e.g.,~@Ber87). Given four ordered points $(z_1, z_2, z_3, z_4)$ on
$bb(C P)^1$, the symmetric group $S_4$ acts by permutation, and the cross-ratio
transforms under a homomorphism $S_4 -> S_3$ to the group of anharmonic ratios
${lambda, 1\/lambda, 1-lambda, 1\/(1-lambda), lambda\/(lambda-1), (lambda-1)\/lambda}$.
The kernel of this homomorphism is the Klein four-group

$ V_4 = {e, (12)(34), (13)(24), (14)(23)} triangle.l.small S_4, $

consisting of the double transpositions. These are precisely the permutations
that preserve the cross-ratio for _all_ values of $lambda$.

At $lambda = -1$, the anharmonic orbit ${-1, 2, 1\/2}$ has only three elements
instead of the generic six, meaning the stabilizer of the harmonic cross-ratio
in $S_4$ is a group of order $24\/3 = 8$. This is the dihedral group $D_4$ (the
symmetry group of a square), which contains $V_4$ as a normal subgroup of index
2. The extra symmetry at $lambda = -1$ corresponds to the transpositions that
exchange the two pairs within the harmonic configuration --- precisely the
enhanced symmetry that distinguishes the harmonic range from a generic
four-point configuration.

Thus the Klein four-group appears in two roles simultaneously: as the universal
stabilizer of the cross-ratio (for any $lambda$), and as a subgroup of the
_enhanced_ stabilizer (of order 8) that is specific to the harmonic value
$lambda = -1$. Both roles are present at $r = 4$.

#section-divider

// ─── 5. The Belyi Property and the Moduli Space ───────────────────────────────

= The Belyi Property and the Moduli Space $cal(M)_(0,4)$

== Belyi maps and the logistic family

#definition[
  A rational map $f: bb(C P)^1 -> bb(C P)^1$ is a *Belyi map* if its critical
  values lie in ${0, 1, infinity}$.
]

#theorem(title: "5.1")[
  Among the logistic maps $f_r (z) = r z(1-z)$ with $r in CC$, the following
  are equivalent:

  + $f_r$ is a Belyi map.
  + $f_r$ is postcritically finite with postcritical set
    $op("PC")(f_r) subset.eq {0, 1, infinity}$.
  + $r in {0, 4}$.

  The case $r = 0$ is trivial (constant map). The case $r = 4$ is the unique
  non-trivial Belyi map in the family.
]

#proof[
  By Riemann--Hurwitz, $f_r$ has exactly two critical points on $bb(C P)^1$:
  the finite critical point $c = 1\/2$ (with critical value $v = r\/4$) and the
  point $infinity$ (with $f_r (infinity) = infinity$, local degree 2). Since
  $infinity in {0, 1, infinity}$, the Belyi condition reduces to
  $v = r\/4 in {0, 1, infinity}$:

  - $r\/4 = 0 => r = 0$.
  - $r\/4 = 1 => r = 4$.
  - $r\/4 = infinity$: impossible for finite $r$.

  For (2) $=>$ (1): the postcritical set $op("PC")(f)$ is defined as the
  closure of the union of forward orbits of all critical values, so in
  particular $op("PC")(f) supset.eq {"critical values"}$. If
  $op("PC")(f) subset.eq {0, 1, infinity}$, then all critical values lie in
  ${0, 1, infinity}$, which is the Belyi condition.

  At $r = 4$, postcritical finiteness follows from the forward orbit of the
  finite critical value:
  $1 attach(arrow.r.long.bar, t: f_4) 0 attach(arrow.r.long.bar, t: f_4) 0$,
  so $op("PC")(f_4) = {0, 1} union {infinity} = {0, 1, infinity}$.
]

== Arithmetic significance

The Belyi property explains _why_ the harmonic configuration is arithmetically
special. By Belyi's theorem~@Bel79, a smooth projective curve over $CC$
is defined over $overline(QQ)$ if and only if it admits a Belyi map. The map
$f_4: bb(C P)^1 -> bb(C P)^1$ is itself a Belyi map defined over $QQ$, and its
_dessin d'enfants_ --- the preimage $f_4^(-1)([0,1])$ --- is the interval
$[0,1]$ with vertices at $0$, $1\/2$, and $1$: a tree with two edges, the
simplest non-trivial dessin of degree 2.

The connection to the harmonic range is direct: the four structural points
$(c, v; p, infinity) = (1\/2, r\/4; 1-1\/r, infinity)$ form a harmonic range
when $v = r\/4 = 1$, which is precisely the Belyi condition
$v in {0, 1, infinity}$ (taking the non-trivial case $v = 1$). The harmonic
range condition and the Belyi condition are not merely equivalent --- they are
the _same_ constraint, expressed in projective-geometric and arithmetic language
respectively. For further background on arithmetic dynamics, see~@Sil07.

== Postcritical finiteness and Thurston rigidity

By Thurston's rigidity theorem~@DH93, postcritically finite rational
maps are determined up to Möbius conjugacy by their combinatorial data (the
_Hubbard tree_ or, equivalently, the homotopy class of the branched covering
relative to the postcritical set). The map $f_4$ is the unique quadratic
polynomial (up to affine conjugacy) whose critical point has orbit length 3 and
lands on a fixed point.

The harmonic condition is intrinsic to the conjugacy class, not the particular
affine model. The logistic map $f_4 (x) = 4x(1-x)$ is affinely conjugate to
$g(z) = z^2 - 2$ via $h(x) = 2 - 4x$, so that $h circle.small f_4 = g circle.small h$.
Since cross-ratios are Möbius-invariant, the structural points of $g$ ---
critical point $0$, critical value $-2$, non-trivial fixed point $-1$, and
$infinity$ --- form the same harmonic configuration:

$ (0, -2; -1, infinity) = frac(0 - (-1), -2 - (-1)) = frac(1, -1) = -1. $

Using the trivial fixed point $2$, one obtains
$(0, -2; 2, infinity) = 1\/2$, which lies in the anharmonic orbit
${-1, 1\/2, 2}$, consistent with Section 4.4.

#remark[
  The map $g(z) = z^2 - 2$ is the degree-2 Chebyshev polynomial $T_2$ and
  represents the core PCF map of the real quadratic family at the tip of the
  Mandelbrot set. The harmonic condition thus characterizes this distinguished
  dynamical system in a coordinate-independent manner.
]

== The moduli space $cal(M)_(0,4)$

The moduli space of four distinct ordered points on $bb(C P)^1$, up to Möbius
equivalence, is

$ cal(M)_(0,4) tilde.equiv bb(C P)^1 without {0, 1, infinity}, $

parameterized by the cross-ratio $lambda$. Its Deligne--Mumford compactification
is $overline(cal(M))_(0,4) tilde.equiv bb(C P)^1$, with boundary divisor
$partial overline(cal(M))_(0,4) = {0, 1, infinity}$ --- the locus where two of the
four points collide.

The postcritical set of $f_4$ satisfies

$ op("PC")(f_4) = {0, 1, infinity} = partial overline(cal(M))_(0,4). $

This identity is a consequence of the Belyi property: a Belyi map is precisely a
map whose ramification is supported on $partial overline(cal(M))_(0,4)$. The
maximally entropic degree-2 polynomial has its postcritical set equal to
the boundary of the moduli space parameterizing four-point configurations on
$bb(C P)^1$; this identity is equivalent to (and clarified by) the Belyi
property, and the Belyi condition is equivalent to the harmonic range condition
on the four structural points.

We note that the number 4 --- the number of marked points --- is the minimum
needed for a non-trivial cross-ratio (three points on $bb(C P)^1$ can always be
sent to ${0,1,infinity}$ by a Möbius transformation), so the logistic map
operates at the threshold where projective-geometric invariants first become
available.

#section-divider

// ─── 6. Entropy and Surjectivity ─────────────────────────────────────────────

= Entropy and Surjectivity

== Surjectivity and the full shift

The connection between $r = 4$ and maximal entropy $log 2$ is mediated by
surjectivity. For $r < 4$, the critical value $v = r\/4 < 1$, so
$f_r ([0,1]) = [0, r\/4] subset.neq [0,1]$. Points in $(r\/4, 1]$ have no
preimage, certain symbolic sequences are forbidden, and the shift space is a
proper subshift with entropy strictly less than $log 2$.

At $r = 4$, the critical value $v = 1$, so $f_4 ([0,1]) = [0,1]$. Every point
has a preimage, every binary itinerary is realized, and the symbolic dynamics is
the full shift on ${0,1}^(NN)$ with entropy $log 2$.

For $r > 4$, the critical value $v > 1$ and some orbits escape to $+infinity$.
The non-escaping set is a Cantor set of Lebesgue measure zero on which $f_r$ is
again conjugate to the full shift, but the invariant set no longer fills the
interval.

Thus $r = 4$ is the unique value where the entropy is maximal _and_ the
invariant set has full Lebesgue measure.

== The variational principle

The variational principle for topological entropy~@Wal82 states

$ h_("top")(f) = sup_(mu in cal(M)(f)) h_mu (f), $

where $cal(M)(f)$ is the space of $f$-invariant Borel probability measures and
$h_mu$ denotes the measure-theoretic entropy. For the logistic family:

- Topological entropy $h_("top")(f_r)$ increases monotonically from $0$ to
  $log 2$ as $r$ increases from $1$ to $4$ (see~@MT88 @dMvS93). In
  particular, $h_("top")(f_r) < log 2$ strictly for $r < 4$.
- For each $r$, there exists a unique measure of maximal entropy $mu_r$
  achieving the supremum; this is the measure maximizing entropy at the
  (strictly lower) level $h_("top")(f_r)$.
- For $r < 4$, the unique measure of maximal entropy $mu_r$ is singular with
  respect to Lebesgue measure.
- At $r = 4$, the unique measure of maximal entropy $mu_4 = frac(d x, pi sqrt(x(1-x)))$
  is absolutely continuous with respect to Lebesgue measure.

The transition from singular to absolutely continuous at $r = 4$ represents a
qualitative change in the space of invariant measures, occurring precisely at
the harmonic range configuration. This transition concerns the _measure of
maximal entropy_ for each parameter $r$; the nature of this particular measure
changes qualitatively as $r$ increases through $4$. (Jakobson's theorem~@Jak81 guarantees absolutely continuous invariant measures for a
positive-measure set of parameters $r < 4$, but those measures are _not_ the
measures of maximal entropy for their respective parameters.)

#section-divider

// ─── 7. Synthesis and Concluding Remarks ─────────────────────────────────────

= Synthesis and Concluding Remarks

== Summary of equivalences

The following conditions on the parameter $r in (2,4]$ are equivalent:

+ $f_r: [0,1] -> [0,1]$ is surjective.
+ The topological entropy $h_("top")(f_r) = log 2$.
+ The measure of maximal entropy is absolutely continuous with respect to
  Lebesgue measure on $[0,1]$.
+ The critical orbit is finite: $f_r (v) = 0$, i.e., the critical value maps
  to the fixed point $0$ in one step.
+ The cross-ratio $(c, v; p, infinity) = -1$ (harmonic range).
+ $f_r$ is a Belyi map (critical values in ${0, 1, infinity}$).
+ The Möbius involution fixing $p$ and $infinity$ exchanges $c$ and $v$.

Each condition is equivalent to $r = 4$. The equivalence of (1)--(4) is well
established in the dynamical systems literature (see~@dMvS93 @Lyu97 @Mil06). The equivalence of (5) with the others is
the content of Proposition 4.3. The equivalence of (6) is established in
Theorem 5.1. The equivalence of (7) with (5) is the classical characterization
of the harmonic range via fixed-point involutions (Section 4.5).

These seven conditions belong to four distinct mathematical domains --- dynamics
(1--3), combinatorics of orbits (4), projective geometry (5, 7), and arithmetic
geometry (6) --- yet they select the same unique parameter. This confluence
reflects the rigidity of postcritically finite maps at the boundary of the
Mandelbrot set.

== The role of $V_4$

The Klein four-group $V_4 tilde.equiv ZZ\/2 times ZZ\/2$ appears throughout
this story in three interrelated roles:

+ *Dynamical symmetry.* $V_4$ is the symmetry group of the doubling map
  $D(z) = z^2$ on $S^1$, generated by the deck transformation
  $alpha: z mapsto -z$ and the commuting involution $beta: z mapsto overline(z)$.

+ *Cross-ratio stabilizer.* $V_4$ is the kernel of the homomorphism
  $S_4 -> S_3$ given by the action of permutations on the cross-ratio. It is
  the universal group of permutations that preserve the cross-ratio, and it sits
  inside the order-8 stabilizer of the harmonic cross-ratio $lambda = -1$.

+ *Harmonic symmetry.* At $r = 4$, the three non-trivial involutions of
  $bb(C P)^1$ that permute the four structural points by double transpositions
  --- the pair-swapping involution $T$ of Section 4.5, together with the
  involutions swapping ${c, p}$ with ${v, infinity}$ and ${c, infinity}$ with
  ${v, p}$ --- realize the abstract $V_4$ acting on the harmonic configuration.
  This $V_4$ action on the set of four points is distinct from the dynamical
  $V_4$ of role (1), but both originate from the degree-2 structure of the
  underlying map.

These three incarnations of $V_4$ are unified by the quotient construction: the
logistic map at $r = 4$ _is_ the doubling map modulo one factor of $V_4$, and
the harmonic range condition _is_ the projective-geometric signature of this
quotient achieving surjectivity.

== Structural origins

Every appearance of the number 4 in this context traces to the degree of the
doubling map:

- $r = 4 = (max_([0,1]) x(1-x))^(-1) = (1\/4)^(-1)$, forced by surjectivity.
- $|V_4| = 4 = |op("Aut")_D (S^1)| = (deg D) times |{"commuting involutions"}| = 2 times 2$.
- A degree-2 polynomial on $bb(C P)^1$ has exactly one finite critical point
  (Riemann--Hurwitz), one critical value, and two finite fixed points. Together
  with the point $infinity$ (which is simultaneously a fixed point and a critical
  point), these yield $4$ dynamically distinguished points --- precisely the
  minimum needed for a non-trivial cross-ratio.
- The harmonic range is the unique non-degenerate four-point configuration with
  enhanced $D_4$ symmetry of order $2|V_4| = 8$.

The number $4 = 2^2$ thus arises as the square of the degree, or equivalently
as the order of the product of two independent $ZZ\/2$ symmetries inherent in
any degree-2 map with a real structure.

#section-divider

// ─── References ──────────────────────────────────────────────────────────────

#v(3em)
#text(size: 8.5pt, fill: luma(120))[
  This work is licensed under a Creative Commons Attribution 4.0 International License (CC BY 4.0).
]

#bibliography(
  "references.bib",
  title: "References",
)
