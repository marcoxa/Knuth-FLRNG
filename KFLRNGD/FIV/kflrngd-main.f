C     -*- Mode: Fortran -*-
C     
C     kflrngd-main.f
C
C     A rudimentary test program.
C
C     Original header message.
C     
C     FORTRAN IV (66) version of "ranf_array"
C     from Seminumerical Algorithms by D E Knuth, 3rd edition (1997)
C     including the MODIFICATIONS made in the 9th printing (2002)
C     and a bugfix to make this compatible with rng-double.c (2012)
C     ********* see the book for explanations and caveats! *********
C
C     Changes by Marco Antoniotti, 2023-12-19
C     DISCo, Universita` degli Studi di Milano-Bicocca, Milan, Italy
C
C     
C     MAIN
C     
C     In the original version he DO loops went around one time too many
C     w.r.t. the C version, as the upper bound in Fortran in inclusive.
C     The upper bound of the loops is now changed and the code now
C     behaves just like in the C version.
C
C     
C     IMPLICIT DOUBLE PRECISION (A)
      IMPLICIT REAL*8 (A, R)
      DIMENSION A(2009)
      COMMON /RSTATE/ RANX(100)
      EXTERNAL RNFARR, RNFSTR, RNSPRN, RNAPRT

      WRITE (6, 101)
 101  FORMAT (' KFLRNGD simple test.')

      CALL RNFSTR(310952)
      
      DO 1 I = 1, 2009
         CALL RNFARR(A, 1009)
 1    CONTINUE
C     PRINT '(F22.20)', A(1)
      
C     The numbers should be
C     0.36410514377569680455 and
C     0.40565695769206500110
C     On MVS 3.8j FORTRAN IV with Hex floats .36410514377569680000

      WRITE (6, 102) RANX(1)
 102  FORMAT (' (a) RANX(1) = ', F22.20)
      WRITE (6, 103) A(1)
 103  FORMAT (' (a)    A(1) = ', F22.20)

C     Repeat with 2009 and 1009 bounds switched.

      CALL RNFSTR(310952)
      
      DO 2 I = 1, 1009
         CALL RNFARR(A, 2009)
 2    CONTINUE 
C     PRINT '(F22.20)', A(1)
C     Again,
C     0.36410514377569680455 and
C     0.04731923453148767500
C     On MVS 3.8j FORTRAN IV with Hex floats .36410514377569680000 

      WRITE (6, 104) RANX(1)
 104  FORMAT (' (b) RANX(1) = ', F22.20)
      WRITE (6, 105) A(1)
 105  FORMAT (' (b)    A(1) = ', F22.20)

      STOP
C     end of file on next card/line -- kflrngd-main.f
      END
