### kflrng-unix.mk
### Makefile for Knuth Fibonacci Lagged RNG, double precision version.
### Fortran 77 version.

FC = gfortran

OBJS = kflrngi-rngnxt.o rnaprt.o knuth-flrngi.o
EXES = kflrngi-main kflrngi-nrandom

all: $(EXES)

kflrngi-main: kflrngi-main.f $(OBJS)
kflrngi-nrandom: kflrngi-nrandom.f $(OBJS)


.PHONY: clean
clean:
	$(RM) $(EXES) $(OBJS)


### end of file -- kflrng-unix.mk
