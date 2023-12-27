C     -*- Mode: Fortran -*-
C     
C     kflrngd-nrandom.f
C
C     Another rudimentary test program.
C
C     Changes by Marco Antoniotti, 2023-12-20
C     DISCo, Universita` degli Studi di Milano-Bicocca, Milan, Italy
C     
      PROGRAM NRAND
C     
C     Using the Knuth's Fibonacci Lagged RNG.
C
      INTEGER KRNNXT, KRNX
      DOUBLE PRECISION RNDNXD, RND
      EXTERNAL RNFSTR, RNDNXD, KRNNXT, RNAPRT

      DOUBLE PRECISION RANX, RANBUF
      INTEGER KK, QUAL
      PARAMETER (KK = 100)
      PARAMETER (QUAL = 1009)
      COMMON /RSTATE/ RANX(KK)
      COMMON /RNGNXT/ RANBUF(QUAL), RNXT

C     Start the RNG.
      
C     CALL RNFSTR(310952)

      PRINT '(A)', 'KFLRNGD NRANDOM'
      PRINT '(A)', 'RANX'
      CALL RNAPRT(RANX, KK, 1, 5)
      PRINT '(A)', 'RANBUF'
      CALL RNAPRT(RANBUF, QUAL, 1, 5)
      PRINT '()'

C     Print out a few random numbers.
      
      DO 1 I = 1, 10
         KRNX = KRNNXT(I)
C        PRINT '(A, I2)', 'RANNXT = ', KRNX
         RND = RNDNXD(I)
         PRINT '(A, I2, A, I2, A, F22.20)',
     .         'RANNXT = ', KRNX, ', RNDNXD(', I, ') = ', RND
 1    CONTINUE

      PRINT '(/, A)', 'RANX'
      CALL RNAPRT(RANX,KK, 1, 5)
      PRINT '(A)', 'RANBUF'
      CALL RNAPRT(RANBUF, QUAL, 1, 5)
      
C     end of file -- kflrngd-nrandom.f
      END
