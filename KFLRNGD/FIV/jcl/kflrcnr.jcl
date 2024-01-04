//* -*- Mode: JCL -*-
//*
//* kflrcnr.jcl --
//*
//* Compiling the "nrandom" test file in a load module.
//*
//* Change USER, PASSWORD, NOTIFY and datasets to your liking.
//*
//* See file COPYING for licensing information.
//*
//KFLRNR1 JOB (KFLRNG),'MARCOXA',
//        USER=MARCOXA,PASSWORD=PPWWDD,
//        CLASS=A,
//        MSGCLASS=H,
//        MSGLEVEL=(1,1),
//        NOTIFY=MARCOXA
//*
//FFCOMP  EXEC FORTHCL,REGION.FORT=1024K
//*
//FORT.SYSIN DD DSNAME=MXAHOM.FORTRAN.KFLRNGD(KFLRNR),
//           DISP=(OLD,KEEP)
//*
//LKED.SYSLMOD DD DSN=MXAHOM.FORTRAN.LOADLIB(KFLRNR),DISP=(OLD,KEEP)
//KFLRL        DD DSN=MXAHOM.FORTRAN.LOADLIB,DISP=OLD
//LKED.SYSIN   DD *
       INCLUDE KFLRL(KFLRLIB)
/*
//*
//* end of file -- kflrcnr.jcl
//
