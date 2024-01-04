//* -*- Mode: JCL -*-
//*
//* kflrcm.jcl --
//*
//* Compiling the "main" test file in a load module.
//*
//* Change USER, PASSWORD, NOTIFY and datasets to your liking.
//*
//* See file COPYING for licensing information.
//*
//KFLRCM  JOB (KFLRNGCM),'MARCOXA',
//        USER=MARCOXA,PASSWORD=PPWWDD,
//        CLASS=A,
//        MSGCLASS=H,
//        MSGLEVEL=(1,1),
//        NOTIFY=MARCOXA
//*
//FFCOMP  EXEC FORTHCL,REGION.FORT=1024K
//*
//FORT.SYSIN DD DSNAME=MXAHOM.FORTRAN.KFLRNGD(KFLRMAIN),
//           DISP=(OLD,KEEP)
//*
//LKED.SYSLMOD DD DSN=MXAHOM.FORTRAN.LOADLIB(KFLRMAIN),DISP=(OLD,KEEP)
//KFLRL        DD DSN=MXAHOM.FORTRAN.LOADLIB,DISP=OLD
//LKED.SYSIN   DD *
       INCLUDE KFLRL(KFLRLIB)
/*
//*
//* end of file -- kflrcm.jcl
//
