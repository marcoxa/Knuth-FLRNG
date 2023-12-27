### kflrng-unix.mk
### Makefile for Knuth Fibonacci Lagged RNG, double precision version.
### Fortran 77 version.

FC = gfortran

OBJS = kflrngd-rngnxt.o rnaprt.o knuth-frngdb.o
EXES = kflrngd-main kflrngd-nrandom

all: $(EXES)

kflrngd-main: kflrngd-main.f $(OBJS)
kflrngd-nrandom: kflrngd-nrandom.f $(OBJS)


.PHONY: clean
clean:
	$(RM) $(EXES) $(OBJS)


### end of file -- kflrng-unix.mk
