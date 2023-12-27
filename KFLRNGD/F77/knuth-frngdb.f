C     -*- Mode: Fortran -*-
C
C     knuth-frngdb.f
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
C     RNFARR
C
C     The main subroutine generating the sequence of "random" numebers
C     in array AA of dimension N
C     
      SUBROUTINE RNFARR(AA, N)
C
C     The routine originally differed form the C version in the use of
C     indices; hence it seemed to "swap" RANX and AA.
C     The fix was twofold: now the indices are I and J ad in C and the
C     loops in the main program where running one too many times w.r.t.
C     the C version.
C     
      IMPLICIT DOUBLE PRECISION (A, R, Y)
      DIMENSION AA(*)
      PARAMETER (KK = 100)
      PARAMETER (LL = 37)
      COMMON /RSTATE/ RANX(KK)
      SAVE /RSTATE/
      INTEGER I, J
C     
C     PRINT '(A, I4)', 'Calling RNFARR with AA and ', N
C
C     The C version (from the book) uses two indices, I and J and
C     assumes that the DO-loops keep the "last value" computed.
C     The Fortran version seems to botch the last loop.
C
C     Loop 1 works like the C version.
      DO 1 J = 1, KK
         AA(J) = RANX(J)
 1    CONTINUE
C     Loop 2 works like the C version; note that J starts from KK + 1.
      DO 2 J = KK + 1, N
         Y = AA(J - KK) + AA(J - LL)
         AA(J) = Y - IDINT(Y)
 2    CONTINUE
C
C     The rest is rewritten with I and J as for the C version
C     
C     Loop 3 reuses J, while in the C version uses I, but the references
C     to the array AA are shifted by N, thus it is correct.
C     New version with I and J.
C     
      DO 3 I = 1, LL
         Y = AA(J - KK) + AA(J - LL)
         RANX(I) = Y - IDINT(Y)
         J = J + 1
 3    CONTINUE
C     
C     Loop 4 reuses J from LL + 1 (see loop 3); but in the C version, J
C     goes from N + LL up to N + LL + KK - 1, hence it looks like the
C     reference AA(N + J - KK) is incorrect.
C     New version with I and J.
C     
      DO 4 I = LL + 1, KK
         Y = AA(J - KK) + RANX(I - LL)
         RANX(I) = Y - IDINT(Y)
         J = J + 1
 4    CONTINUE
      RETURN
      END


C
C     RNFSTR
C
C     The subroutine that starts the Random Number Generator.
C     
      SUBROUTINE RNFSTR(SEED)
C
C     This routine is unchanged w.r.t. the original version as it was
C     already coherent with the C version.
C     
      IMPLICIT DOUBLE PRECISION (A, R, U, V)
      IMPLICIT INTEGER (T)
      PARAMETER (KK = 100)
      PARAMETER (LL = 37)
      PARAMETER (MM = 2**30)
      PARAMETER (ULP = 1D0 / (2D0**52))
      PARAMETER (TT = 70)
      PARAMETER (KKK = KK + KK - 1)
      INTEGER SEED, S, SSEED
      DOUBLE PRECISION SS
      DIMENSION U(KKK)
      COMMON /RSTATE/ RANX(KK)
      SAVE /RSTATE/
C
C     PRINT '(A, I10)', 'Calling RNFSTR with ', SEED
      IF (SEED .LT. 0) THEN
         SSEED = MM - 1 - MOD(-1 - SEED, MM)
      ELSE
         SSEED = MOD(SEED, MM)
      END IF
      SS = 2D0 * ULP * (SSEED + 2)
      DO 1 J = 1, KK
         U(J) = SS
         SS = SS + SS
         IF (SS .GE. 1D0) SS = SS - 1D0 + 2 * ULP
 1    CONTINUE
      U(2) = U(2) + ULP
      S = SSEED
      T = TT - 1
 10   DO 12 J = KK, 2, -1
         U(J + J - 1) = U(J)
         U(J + J - 2) = 0
 12   CONTINUE
      DO 14 J = KKK, KK + 1, -1
         V = U(J - (KK - LL)) + U(J)
         U(J - (KK - LL)) = V - IDINT(V)
         V = U(J - KK) + U(J)
         U(J - KK) = V - IDINT(V)
 14   CONTINUE
      IF (MOD(S,2) .EQ. 1) THEN
         DO 16 J = KK, 1, -1
            U(J + 1) = U(J)
 16      CONTINUE
         U(1) = U(KK + 1)
         V = U(LL + 1) + U(KK + 1)
         U(LL + 1) = V - IDINT(V)
      END IF
      IF (S .NE. 0) THEN
         S = S/2
      ELSE
         T = T - 1
      END IF
      IF (T .GT. 0) GO TO 10
      DO 20 J = 1, LL
         RANX(J + KK - LL) = U(J)
 20   CONTINUE
      DO 21 J = LL + 1, KK
         RANX(J - LL) = U(J)
 21   CONTINUE
      DO 22 J = 1, 10
         CALL RNFARR(U, KKK)
 22   CONTINUE
      RETURN
      END
      
C     end of file -- knuth-frngdb.f
