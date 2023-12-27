C     -*- Mode: Fortran -*-
C
C     rnaprt.f
C     Prints an array for the RNG routines.
C     
C     RNAPRT
C     Prints elements LOW to HIGH of array AR of DIMENSION N.
C
      SUBROUTINE RNAPRT(AR, N, LOW, HIGH)
      INTEGER N, LOW, HIGH
      DOUBLE PRECISION AR
      DIMENSION AR(N)
      
 10   FORMAT (' [', I3, '] = ', F22.20)

      DO 1 I = LOW, HIGH
         WRITE (6, 10) I, AR(I)
 1    CONTINUE
      RETURN
C     end of file -- rnaprt.f
      END
