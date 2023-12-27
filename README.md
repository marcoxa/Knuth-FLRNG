# Knuth Fibonacci Lagged RNG

This folder contains the **Fortran** *Fibonacci Lagged RNGs* from
Section 3.6 of Volume 2 of TAOCP (Seminumerical Algorithms); slightly
reformatted and changed (sorry Donald) from the versions downloadable
from the
[code section of TAOCP site](https://www-cs-faculty.stanford.edu/~knuth/programs.html#rng).

* The `KFLRNGD` subfolder contains the `DOUBLE PRECISION` version
  (producing numebrs between 0.0 and 1.0).
* The `KFLRNGI` subfolder contains the `INTEGER` version.

Both versions exist in **Fortran 77** (the original versions) and
**Fortran IV (66)** (you can ask me why in private).

All versions have been revised to provide an API to make them readily
usable in any code.

Of course, all of this is for academic and hobbyst's purposes, as
modern **Fortran** implementations (not to speak of other languages)
already provide their own RNGs (e.g., check out the excellent
[xoshiro](https://prng.di.unimi.it/)).


## Building

To build the code and test it you can use `cmake`, `make`, or `nmake`;
the `CMakeLists.txt`, `unix.make`, and `windows.make` can be used for
each platform; note that the `-build` subdirectory is empty if you use
`cmake`.

`gfortran` is assumed to be available.

The build tools will build the `kflrng[di]-main` and
`kflrng[di]-nrandom` exectutables for you to test.


# Enjoy

2023-12-26, Athens, Greece

Enjoy
