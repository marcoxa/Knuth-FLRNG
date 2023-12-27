### kflrng-unix.mk
### Makefile for Knuth Fibonacci Lagged RNG, double precision version.
### Fortran IV (66)

FC = gfortran

OBJS = kflrngd-rngnxt.o rnaprt.o knuth-frngdb-IV.o
EXES = kflrngd-main kflrngd-nrandom

all: $(EXES)

kflrngd-main: kflrngd-main.f $(OBJS)
kflrngd-nrandom: kflrngd-nrandom.f $(OBJS)


.PHONY: clean
clean:
	$(RM) $(EXES) $(OBJS)


### end of file -- kflrng-unix.mk
