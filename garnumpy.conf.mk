#-*- mode: Fundamental; tab-width: 4; -*-
# ex:ts=4

# Directory config for the "main" image
#main_prefix ?= /usr/media/src/src/dsp/garnumpy/garnumpyinstall
main_prefix ?= /export/bbc8/garnumpyinstall

#===============================
# Compiler specific stuff here
#===============================
CC ?= gcc
CXX ?= g++
F77 ?= g77
F95 = gfortran
#LD	?= ld

#GARCHIVEROOT ?= /usr/media/src/src/dsp/garnumpy/garnumpyarchives
GARCHIVEROOT ?= $(HOME)/garnumpyarchives

#SOURCEFORGEDL	= http://jaist.dl.sourceforge.net/sourceforge
#SOURCEFORGEDL	= http://dl.sourceforge.net/
SOURCEFORGEDL	= http://nchc.dl.sourceforge.net/sourceforge

#===================================================
# General compilation options (you can tweak those)
#===================================================
# Use for parrallel builds; you should NOT use make -j N directly from the
# cmdline, as many libraries have broken makefile wrt this feature, and/or
# some libraries test need single job.
PMAKE	= $(MAKE) -j 4
BITARCH	= 32

#----------------------
# General BLAS/LAPACK 
#----------------------
# numpy/scipy needs blas and lapack libraries for fast linear algebra computation.
# Here, set your libraries for blas and lapack. 

# valid values for BLASLAPACK: atlas, system or netlib
#BLASLAPACK	= system
#BLASLAPACK	= atlas
BLASLAPACK	= netlib

# - system: assumes that blas lapack are available, you should set
#   SYSTEM_BLAS_NAME, SYSTEM_BLAS_DIR, SYSTEM_LAPACK_DIR, SYSTEM_LAPACK_NAME
#   should correspond to the values put in site.cfg
#SYSTEM_BLAS_NAME='blas'
#SYSTEM_BLAS_DIR='/usr/lib'
#SYSTEM_LAPACK_NAME='lapack'
#SYSTEM_LAPACK_DIR='/usr/lib'
SYSTEM_BLAS_NAME=
SYSTEM_BLAS_DIR=
SYSTEM_LAPACK_NAME=
SYSTEM_LAPACK_DIR=

# Set to 0 to skip lapack testing, 1 for testing (take time, but strongly
# advised if you intend to use this for production purpose)
TEST_NETLIB_LAPACK=0

# Set to 1 to try using gcc3 instead of current gcc for kernels
# (may produce much more efficient code on some architecture, you 
# should look at ATLAS webpage for more details)
ATLAS_USE_GCC3	= 0
GCC3_PATH		= /usr/bin/gcc-3.3

#----------------------
# General fftw3 options
#----------------------
# possible values: fftw3, system
FFT			= fftw3
FFTW3_LIBDIR= $(libdir)

#-----------------------
# Python related option
#-----------------------
# If you want to use a different version of python everywhere
# change this
PYTHON = $(shell which python)
PYVER = $(shell $(PYTHON) -c "import sys; print sys.version[:3]")
PYTHONPATH=$(main_libdir)/python$(PYVER)/site-packages:$(main_libdir)/python$(PYVER)/site-packages/gtk-2.0
