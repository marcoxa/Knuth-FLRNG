C     -*- Mode: Fortran -*-
C
C     knuth-frngdb-IV-clean.f
C     
C     FORTRAN 66 (IV) version of "ranf_array"
C     from Seminumerical Algorithms by D E Knuth, 3rd edition (1997)
C     including the MODIFICATIONS made in the 9th printing (2002)
C     and a bugfix to make this compatible with rng-double.c (2012)
C     ********* see the book for explanations and caveats! *********
C
C     Notes:
C     The original code is Fortran 77, to downgrade it to Fortran IV
C     (even to IBM Fortran H) a number of things had to be done:
C     1 - PARAMETERs were removed (and coalesced in a BLOCK DATA, which
C         had to be unnnamed).
C     2 - IF-THEN-ELSE had to be reworked in IF GOTO.
C     3 - DO loops had to be converted to "non-negative" init, end, and
C         increment.
C
C     Common data and parameters.
C
C     The two main dimension constants are KK = 100 and LL = 37.
C     In FORTRAN 77 we can use PARAMETER, but not in FORTRAN IV (66),
C     hence the use of these values is hardwired in a retro way.
C
C     The dimension "parameters" and kept in the COMMON area PARMS and
C     initialized as 100, 37 and 199 (equal to KK + KK - 1).
C
C     The RNG "state" is kept in the COMMON areas RSTATE and RNGNXT,
C     which contains the RNG vector RANX(KK) and the current index
C     RANXNX, initialized to 0.
C     
      BLOCK DATA
C     The PARAMETERs of the RNG.
      INTEGER KK, LL, KKK
      COMMON /PARMS/ KK, LL, KKK
      DATA KK, LL, KKK /100, 37, 199/
C     The 'state' of the RNG in COMMON areas RSTATE and RNGNXT
      DOUBLE PRECISION RANX, RANBUF
      INTEGER RANNXT, QUAL
      COMMON /RSTATE/ RANX(100)
      COMMON /RNGNXT/ RANBUF(1009), RANNXT, QUAL
      DATA RANNXT, QUAL /0, 1009/
      END
C
C     
C     RNFARR
C     This is the main routine that shifts the values in the array AA
C     (usually the RANBUF in the RNGNXT COMMON area) using the Fibonacci
C     lagged methods.
C     
      SUBROUTINE RNFARR(AA, N)
C
      IMPLICIT REAL*8 (A, R, Y)
      DIMENSION AA(N)
      COMMON /PARMS/ KK, LL, KKK
      INTEGER KK, LL, KKK
C     The following (KK1 and LL1) are needed because Fortran IV takes
C     only integer constants or integer variable references in DO
C     statements; not expressions. 
      INTEGER KK1, LL1
C
      COMMON /RSTATE/ RANX(100)
C     
      DO 1 J = 1, KK
         AA(J) = RANX(J)
 1    CONTINUE
      KK1 = KK + 1
      DO 2 J = KK1, N
         Y = AA(J - KK) + AA(J - LL)
         AA(J) = Y - IDINT(Y)
 2    CONTINUE
      DO 3 J = 1, LL
         Y = AA(N + J - KK) + AA(N + J - LL)
         RANX(J) = Y - IDINT(Y)
 3    CONTINUE
      LL1 = LL + 1
      DO 4 J = LL1, KK
         Y = AA(N + J - KK) + RANX(J - LL)
         RANX(J) = Y - IDINT(Y)
 4    CONTINUE
      RETURN
      END
C
C      
      SUBROUTINE RNFSTR(SEED)
C
C     Fortran IV does not like DOUBLE PRECISION in an IMPLICIT
C     declaration, and it wants a single IMPLICIT statement at the
C     beginning (first line) of a subprogram; hence the following.
C     
      IMPLICIT REAL*8 (A, R, U, V), INTEGER (T)
      COMMON /PARMS/ KK, LL, KKK
      INTEGER KK, LL, KKK
C     KK = 100, LL = 37, KKK = 199
      INTEGER KK1, LL1
      INTEGER TT
      INTEGER SEED, S, SSEED
      DOUBLE PRECISION SS
      DIMENSION U(199)
      COMMON /RSTATE/ RANX(100)
C
      TT = 70
      MM = 2**30
      ULP = 1D0 / (2D0**52)
C     
      IF (SEED .LT. 0) GO TO 101
      GO TO 102
C     THEN
 101  SSEED = MM - 1 - MOD(-1 - SEED, MM)
      GO TO 100
C     ELSE
 102  SSEED = MOD(SEED, MM)
      GO TO 100
C     END IF
 100  CONTINUE
      SS = 2D0 * ULP * (SSEED + 2)
      DO 1 J = 1, KK
         U(J) = SS
         SS = SS + SS
         IF (SS .GE. 1D0) SS = SS - 1D0 + 2 * ULP
 1    CONTINUE
      U(2) = U(2) + ULP
      S = SSEED
      T = TT - 1
C     Main Loop.
C     Note that FORTRAN IV needs the init, end, and increment to be
C     positive; hence the F77 code must be changed to "invert" the loop.
C     
C$$$ 10   DO 12 J = KK, 2, -1
C$$$         U(J + J - 1) = U(J)
C$$$         U(J + J - 2) = 0
C$$$ 12   CONTINUE
 10   DO 12 J = 2, KK
         JJ = (KK - J) + 2
C     
         U(JJ + JJ - 1) = U(JJ)
         U(JJ + JJ - 2) = 0
 12   CONTINUE
      
C$$$      DO 14 J = KKK, KK + 1, -1
C$$$         V = U(J - (KK - LL)) + U(J)
C$$$         U(J - (KK - LL)) = V - IDINT(V)
C$$$         V = U(J - KK) + U(J)
C$$$         U(J - KK) = V - IDINT(V)
C$$$  14   CONTINUE
      KK1 = KK + 1
      DO 14 J = KK1, KKK
         JJ = (KKK - J) + (KK + 1)
C     
         V = U(JJ - (KK - LL)) + U(JJ)
         U(JJ - (KK - LL)) = V - IDINT(V)
         V = U(JJ - KK) + U(JJ)
         U(JJ - KK) = V - IDINT(V)
 14   CONTINUE

      IF (MOD(S, 2) .EQ. 1) GO TO 201
      GO TO 200
C     THEN
C$$$ 201  DO 16 J = KK, 1, -1
C$$$         U(J + 1) = U(J)
C$$$  16   CONTINUE
 201  DO 16 J = 1, KK, 1
         JJ = (KK - J) + 1
C     
         U(JJ + 1) = U(JJ)
 16   CONTINUE

      U(1) = U(KK + 1)
      V = U(LL + 1) + U(KK + 1)
      U(LL + 1) = V - IDINT(V)
      GO TO 200
C     END IF
 200  CONTINUE
      IF (S .NE. 0) GO TO 301
      GO TO 302
 301  S = S/2
      GO TO 300
C     ELSE
 302  T = T - 1
      GO TO 300
C     END IF
 300     CONTINUE
      IF (T .GT. 0) GO TO 10
C     End Main Loop.
      DO 20 J = 1, LL
         RANX(J + KK - LL) = U(J)
 20   CONTINUE
      LL1 = LL + 1
      DO 21 J = LL1, KK
         RANX(J - LL) = U(J)
 21   CONTINUE
      DO 22 J = 1, 10
         CALL RNFARR(U, KKK)
 22   CONTINUE
      RETURN
C     end of file -- knuth-frgdb-IV-clean.f
      END
