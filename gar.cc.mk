# gcc + g77 combination for everything
CC 	= gcc
CXX = g++
F77 = gfortran
F95 = gfortran
#LD	?= ld

# If we use gfortran, we need the following library flags for linking
LDFLAGS	+= -lgfortran -lm -lgfortranbegin

# F77_COMMON will be append to all packages, as the FFLAGS var
# If -fno-f2c is used anywhere, use it EVERYWHERE !!!!!
#F77_COMMON	= "-fno-f2c -O3 -funroll-all-loops "
F77_COMMON	= -O3 -funroll-all-loops 

# Some C compilers need special library when using fortran libs
C_FORTRAN_LIB = g2c

# This is mandatory if you use gfortran (vs g77)
NUMPY_CC_OPTS	= --fcompiler=gnu95
