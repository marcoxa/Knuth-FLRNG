C     -*- Mode: Fortran -*-
C     
C     kflrngd-nrandom.f
C
C     Another rudimentary test program.
C
C     Changes by Marco Antoniotti, 2023-12-20
C     DISCo, Universita` degli Studi di Milano-Bicocca, Milan, Italy
C     
C     PROGRAM NRAND
C     
C     Using the Knuth's Fibonacci Lagged RNG.
C
      INTEGER KRNNXT, KRNX
      DOUBLE PRECISION RNDNXD, RND
      EXTERNAL RNFSTR, RNDNXD, KRNNXT, RNAPRT

      DOUBLE PRECISION RANX, RANBUF
      INTEGER KK, LL, KKK, QUAL
      COMMON /PARMS/ KK, LL, KKK
C     PARAMETER (KK = 100)
C     PARAMETER (QUAL = 1009)
      COMMON /RSTATE/ RANX(100)
      COMMON /RNGNXT/ RANBUF(1009), RNXT, QUAL

 4242 FORMAT (' NRAND: ', A)
 4243 FORMAT (' NRAND: ', A, /)
 4244 FORMAT (' NRAND: ', A, I3)
 4245 FORMAT (' NRAND: RANNXT =', I4, ' RNDNXD(', I4, ') = ', F22.20)
      
C     Start the RNG.
      
C     CALL RNFSTR(310952)

      WRITE (6, 4243) 'KFLRNGD NRAND'
      WRITE (6, 4242) 'RANX'
      CALL RNAPRT(RANX, KK, 1, 5)
      WRITE (6, 4242) 'RANBUF'
      CALL RNAPRT(RANBUF, QUAL, 1, 5)
      WRITE (6, 4243) ' '

C     Print out a few random numbers.
      
      DO 1 I = 1, 10
         KRNX = KRNNXT(I)
C        WRITE (6, 4244) 'RANNXT = ', KRNX
         RND = RNDNXD(I)
         WRITE (6, 4245) KRNX, I, RND
 1    CONTINUE

      WRITE (6, 4243) ' '
      WRITE (6, 4242) 'RANX'
      CALL RNAPRT(RANX,KK, 1, 5)
      WRITE (6, 4242) 'RANBUF'
      CALL RNAPRT(RANBUF, QUAL, 1, 5)
      
C     end of file -- kflrngd-nrandom.f
      END
