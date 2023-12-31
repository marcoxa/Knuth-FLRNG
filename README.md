# Knuth Fibonacci Lagged RNG

This folder contains the **Fortran** *Fibonacci Lagged RNGs* from
Section 3.6 of Volume 2 of TAOCP (Semi-numerical Algorithms); slightly
reformatted and changed (sorry Donald) from the versions downloadable
from the
[code section of TAOCP site](https://www-cs-faculty.stanford.edu/~knuth/programs.html#rng).

* The `KFLRNGD` sub-folder contains the `DOUBLE PRECISION` version
  (producing numbers between 0.0 and 1.0).
* The `KFLRNGI` sub-folder contains the `INTEGER` version.

Both versions exist in **Fortran 77** (the original versions) and
**Fortran IV (66)** (you can ask me why in private).

All versions have been revised to provide an API to make them readily
usable in any code, as the **C** version available on the *TAOCP* site
is.

Of course, all of this is for academic and hobbyist's purposes, as
modern **Fortran** implementations (not to speak of other languages)
already provide their own RNGs (e.g., check out the excellent
[xoshiro](https://prng.di.unimi.it/)).

Yes, this is a bit of a *retro computing* hacking.


## Building

To build the code and test it you can use `cmake`, `make`, or `nmake`;
the `CMakeLists.txt`, `unix.make`, and `windows.make` can be used for
each platform; note that the `-build` sub-directory is empty if you use
`cmake`.

`gfortran` is assumed to be available.

The build tools will build the `kflrng[di]-main` and
`kflrng[di]-nrandom` exectutables for you to test.


### JCL for MVS 3.8j

The subfolders for **Fortran IV (66)** (named `FIV`) contain **JCL**
to compile *load modules* on **MVS 3.8j**.  (Not yet for the `KFLRNGI`
subfolder; but it should be straighforward to reuse the **JCL** for
`KFLRNGD`).


## Usage

You can link in your code the object files obtained from
`kflrng[di]-rngnxt.f` and `knuth-frng{i,db}.f`; the file `rnaprt.f`
contains a subroutine to print a piece of an array for debugging
purposes.

In order to get the *next* pseudo-random number you invoke the
`RNDNXI` (`INTEGER`) or the `RNDNXD` (`DOUBLE PRECISION`, between
`0.0` and `1.0`) functions, of course after the proper declarations.


## Notes

The various versions (`INTEGER`, `DOUBLE PRECISION`, **Fortran 77**,
and **Fortran IV**) contain code duplications, but they are
self-contained.

I am not much of a Fortran programmer; apart from Knuth's code, which
must be left essentially untouched, all the rest can be modified, and
I welcome suggestions.


# Enjoy

2024-01-04, Athens, Greece

Enjoy
