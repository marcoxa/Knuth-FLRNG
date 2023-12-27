C     -*- Mode: Fortran -*-
C     
C     kflrngi-nrandom.f
C
C     Another rudimentary test program.
C
C     Changes by Marco Antoniotti, 2023-12-20
C     DISCo, Universita` degli Studi di Milano-Bicocca, Milan, Italy
C     
      PROGRAM NRANDI
C     
C     Using the Knuth's Fibonacci Lagged RNG.
C
      INTEGER KRNNXT, KRNX
      INTEGER RNDNXI, RND
      EXTERNAL RNFSTR, RNDNXI, KRNNXT, RNAPRT

      INTEGER RANX, RANBUF
      INTEGER KK, QUAL
      PARAMETER (KK = 100)
      PARAMETER (QUAL = 1009)
      COMMON /RSTATE/ RANX(KK)
      COMMON /RNGNXT/ RANBUF(QUAL), RNXT

C     Start the RNG.
      
C     CALL RNFSTR(310952)

      PRINT '(A)', 'KFLRNGI NRANDOM'
      PRINT '(A)', 'RANX'
      CALL RNAPRT(RANX, KK, 1, 5)
      PRINT '(A)', 'RANBUF'
      CALL RNAPRT(RANBUF, QUAL, 1, 5)
      PRINT '()'

C     Print out a few random numbers.
      
      DO 1 I = 1, 10
         KRNX = KRNNXT(I)
C        PRINT '(A, I2)', 'RANNXT = ', KRNX
         RND = RNDNXI(I)
         PRINT '(A, I2, A, I2, A, I22)',
     .         'RANNXT = ', KRNX, ', RNDNXD(', I, ') = ', RND
 1    CONTINUE

      PRINT '(/, A)', 'RANX'
      CALL RNAPRT(RANX, KK, 1, 5)
      PRINT '(A)', 'RANBUF'
      CALL RNAPRT(RANBUF, QUAL, 1, 5)

      STOP
C     end of file -- kflrngi-nrandom.f
      END
