//* -*- Mode: JCL -*-
//*
//* kflrrnr.jcl --
//*
//* Running the "nrandom" test file.
//*
//* Change USER, PASSWORD, NOTIFY and datasets to your liking.
//*
//* See file COPYING for licensing information.
//*
//KFLRMR2 JOB (KFLRNGR),'MARCOXA',
//        USER=MARCOXA,PASSWORD=PPWWDD,
//        CLASS=A,
//        MSGCLASS=H,
//        MSGLEVEL=(1,1),
//        NOTIFY=MARCOXA
//*
//JOBLIB DD DSN=MXAHOM.FORTRAN.LOADLIB,DISP=SHR
//*
//KFLRM  EXEC PGM=KFLRNR
//*
//FT06F001 DD SYSOUT=*
//*
//* end of file -- kflrrnr.jcl
//
