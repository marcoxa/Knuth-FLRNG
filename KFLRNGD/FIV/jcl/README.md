# KFLRNGD Fortran IV JCL Folder

This folder contains the JCL code used to test the **Fortran IV**
(**IBM Fortran H**, i.e., **Fortran 66**) code on **MVS 3.8j** and
**Hercules**.

See the file `COPYING` in the top folder for licensign information.

The JCL files have traditionally - ahem - "terse" names; the JCLs read
from the `MXAHOM.FORTRAN.KFLRNGD` dataset and write the load modules
in the dataset `MXAHOM.FORTRAN.LOADLIB`. `MXAHOM` is the *high level
qualifier*: change it for your purposes; allocate and adjust your
datasets as you see fit.

The JCL files all have the prefix `kflr` (i.e., *Knuth Fibonacci
Lagged Rng*).
* `kflrngcl.jcl` uses the `FORTCL` catalogued procedure to compile the
  "library" into a load module called `KFLRLIB`.
* `kflrcm.jcl` also uses `FORTCL` to compile the simple "main"
  program, kept in member `KFLRMAIN`, into the executable load module
  `KFLRMAIN`.
* `kflrcnr.jcl` does the same for member `KFLRNR` and the executable
  of the same name.
* `kflrrm.jcl` executes the load module `KFLRMAIN`.
* `kflrrnr.jcl` executes the load module `KFLRNR`.

This is the reason I fell into this rabbit's hole.  It was fun to get
out of it.

Enjoy

Marco Antoniotti, 2024-01-04, Athens, Greece
