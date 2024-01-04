//* -*- Mode: JCL -*-
//*
//* kflrrm.jcl --
//*
//* Running the "main" test file.
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
//KFLRM  EXEC PGM=KFLRMAIN
//*
//FT06F001 DD SYSOUT=*
//*
//* end of file -- kflrrm.jcl
//
