//* -*- Mode: JCL -*-
//*
//* kfrngcl.jcl --
//*
//* Compiling the "library" files in a load module.
//*
//* Change USER, PASSWORD, NOTIFY and datasets to your liking.
//*
//* See file COPYING for licensing information.
//*
//KFLRCL  JOB (KFLRNGCL),'MARCOXA',
//        USER=MARCOXA,PASSWORD=PPWWDD,
//        CLASS=A,
//        MSGCLASS=H,
//        MSGLEVEL=(1,1),
//        NOTIFY=MARCOXA
//*
//FFCOMP  EXEC FORTHCL,REGION.FORT=1024K
//*
//FORT.SYSIN DD DSNAME=MXAHOM.FORTRAN.KFLRNGD(RNAPRT),DISP=SHR
//           DD DSNAME=MXAHOM.FORTRAN.KFLRNGD(KFLRNEXT),DISP=SHR
//           DD DSNAME=MXAHOM.FORTRAN.KFLRNGD(KFLRNGDL),DISP=SHR
//*
//LKED.SYSLMOD DD DSN=MXAHOM.FORTRAN.LOADLIB(KFLRLIB),DISP=SHR
//*
//* end of file -- kflrngcl.jcl
//
