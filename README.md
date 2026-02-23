# The Harmonic Range and Maximum Entropy

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.18734005.svg)](https://doi.org/10.5281/zenodo.18734005)
[![License: CC BY 4.0](https://img.shields.io/badge/License-CC%20BY%204.0-lightgrey.svg)](https://creativecommons.org/licenses/by/4.0/)

A research paper titled **The Harmonic Range and Maximum Entropy: A Projective-Geometric Characterization of the Logistic Map at _r_ = 4**

## Abstract

The logistic map $f_r(x) = rx(1-x)$ at parameter $r = 4$ is distinguished by a well-known constellation of dynamical properties: surjectivity on $[0,1]$, maximal topological entropy $\log 2$, an absolutely continuous invariant measure, and postcritical finiteness. We observe that these properties are equivalent to a classical condition in projective geometry: the four structurally distinguished points of $f_r$ on $\mathbb{CP}^1$ — the critical point, critical value, non-trivial fixed point, and the point at infinity — form a harmonic range (cross-ratio $-1$) if and only if $r = 4$. This characterization emerges naturally from the realization of $f_4$ as a quotient of the doubling map on the circle by complex conjugation, whose symmetry group is the Klein four-group $V_4 \cong \mathbb{Z}/2 \times \mathbb{Z}/2$. The same group is the universal stabilizer of the cross-ratio in $S_4$ and underlies the enhanced $D_4$ symmetry specific to the harmonic value $\lambda = -1$. The harmonic condition is moreover equivalent to $f_4$ being the unique non-trivial Belyi map in the logistic family — its critical values lie in $\{0, 1, \infty\}$ — connecting the dynamical characterization to arithmetic geometry and the moduli space $\mathcal{M}_{0,4}$.

## Build

Requires [Typst](https://typst.app/).

```bash
./build.sh
```

Or with [Nix](https://nixos.org/):

```bash
nix develop
./build.sh
```

## License

- Paper content (source and PDF): [CC BY 4.0](https://creativecommons.org/licenses/by/4.0/)
- Build infrastructure: [MIT](LICENSE)
