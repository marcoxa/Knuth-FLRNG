
       PROGRAM MAIN
C      a rudimentary test program:
       IMPLICIT INTEGER (A-Z)
       DIMENSION A(2009)
       EXTERNAL RNSTRT, RNARRY
       PARAMETER (KK = 100)
       COMMON /RSTATE/ RANX(KK)
       
       CALL RNSTRT(310952)
       DO 1 I = 1,2009
          CALL RNARRY(A,1009)
 1     CONTINUE 
       PRINT '(I15)',RANX(1)
C                   the number should be 995235265
       CALL RNSTRT(310952)
       DO 2 I = 1,1009
          CALL RNARRY(A,2009)
 2     CONTINUE 
       PRINT '(I15)',RANX(1)
C                                 again, 995235265
       STOP
       END
