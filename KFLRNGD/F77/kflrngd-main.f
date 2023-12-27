C     -*- Mode: Fortran -*-
C     
C     kflrngd-main.f
C
C     A rudimentary test program.
C
C     Original header message.
C     
C     FORTRAN 77 version of "ranf_array"
C     from Seminumerical Algorithms by D E Knuth, 3rd edition (1997)
C     including the MODIFICATIONS made in the 9th printing (2002)
C     and a bugfix to make this compatible with rng-double.c (2012)
C     ********* see the book for explanations and caveats! *********
C
C     Changes by Marco Antoniotti, 2023-12-19
C     DISCo, Universita` degli Studi di Milano-Bicocca, Milan, Italy
C     
      PROGRAM MAIN
C     
C     In the original version he DO loops went around one time too many
C     w.r.t. the C version, as the upper bound in Fortran in inclusive.
C     The upper bound of the loops is now changed and the code now
C     behaves just like in the C version.
C     
      IMPLICIT DOUBLE PRECISION (A, R)
      PARAMETER (KK = 100)
      DIMENSION A(2009)
      COMMON /RSTATE/ RANX(KK)
      SAVE /RSTATE/
      EXTERNAL RNFARR, RNFSTR, RNPRBUF

C     Start

      PRINT '(A)', 'KFLRNGD simple test.'
      
      CALL RNFSTR(310952)
      
      DO 1 I = 1, 2009
         CALL RNFARR(A, 1009)
 1    CONTINUE
      PRINT '(A, F22.20)', '(a) RANX(1) = ', RANX(1)
      PRINT '(A, F22.20)', '(a)    A(1) = ', A(1)
C     The numbers should be
C     0.36410514377569680455 and
C     0.40565695769206500110

C     Repeat with 2009 and 1009 bounds switched.
      
      CALL RNFSTR(310952)
      
      DO 2 I = 1, 1009
         CALL RNFARR(A, 2009)
 2    CONTINUE 
      PRINT '(A, F22.20)', '(b) RANX(1) = ', RANX(1)
      PRINT '(A, F22.20)', '(b)    A(1) = ', A(1)
C     Again,
C     0.36410514377569680455 and
C     0.04731923453148767500
      
C     end of file -- kflrngd-main.f
      END
