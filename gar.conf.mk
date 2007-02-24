#-*- mode: Fundamental; tab-width: 4; -*-
# ex:ts=4

# This file contains configuration variables that are global to
# the GAR system.  Users wishing to make a change on a
# per-package basis should edit the category/package/Makefile, or
# specify environment variables on the make command-line.

# Variables that define the default *actions* (rather than just
# default data) of the system will remain in bbc.gar.mk
# (bbc.port.mk)

# Setting this variable will cause the results of your builds to
# be cleaned out after being installed.  Uncomment only if you
# desire this behavior!

# export BUILD_CLEAN = true

ALL_DESTIMGS = main build rootbin lnximg singularity

# These are the standard directory name variables from all GNU
# makefiles.  They're also used by autoconf, and can be adapted
# for a variety of build systems.
# 
# TODO: set $(SYSCONFDIR) and $(LOCALSTATEDIR) to never use
# /usr/etc or /usr/var

# Directory config for the "main" image
main_prefix ?= /usr/media/src/src/dsp/garnumpy/garnumpyinstall
main_exec_prefix = $(prefix)
main_bindir = $(exec_prefix)/bin
main_sbindir = $(exec_prefix)/sbin
main_libexecdir = $(exec_prefix)/libexec
main_datadir = $(prefix)/share
main_sysconfdir = $(prefix)/etc
main_sharedstatedir = $(prefix)/share
main_localstatedir = $(prefix)/var
main_libdir = $(exec_prefix)/lib
main_infodir = $(prefix)/info
main_lispdir = $(prefix)/share/emacs/site-lisp
main_includedir = $(prefix)/include
main_mandir = $(prefix)/man
main_docdir = $(prefix)/share/doc
main_sourcedir = $(prefix)/src
main_licensedir = $(prefix)/licenses

# the DESTDIR is used at INSTALL TIME ONLY to determine what the
# filesystem root should be.  Each different DESTIMG has its own
# DESTDIR.
main_DESTDIR ?= 
#build_DESTDIR ?= /
build_chroot_DESTDIR ?= /tmp/chroot

# allow us to link to libraries we installed
CPPFLAGS += -I$(includedir)
CFLAGS += -I$(includedir) -L$(libdir)
LDFLAGS += -Wl,--export-dynamic -L$(libdir)

## allow us to link to libraries we installed
##main_CPPFLAGS += -nostdinc
##main_CFLAGS += -nostdinc -nostdlib
##main_LDFLAGS += -nostdlib
#main_CPPFLAGS += -I$(DESTDIR)$(includedir) 
#main_CFLAGS += -Os -I$(DESTDIR)$(includedir) -L$(DESTDIR)$(libdir) 
##main_CXXFLAGS += -Os -I$(DESTDIR)$(includedir) -L$(DESTDIR)$(libdir) 
#main_LDFLAGS += -L$(DESTDIR)$(libdir) 
#main_CPPFLAGS += -I$(GCC_INCLUDEDIR) -I$(CROSS_GCC_INCLUDEDIR)
#main_CFLAGS += -I$(GCC_INCLUDEDIR) -I$(CROSS_GCC_INCLUDEDIR) -L$(GCC_LIBDIR) -L$(CROSS_GCC_LIBDIR)
##main_CXXFLAGS += -I$(GCC_INCLUDEDIR) -I$(CROSS_GCC_INCLUDEDIR) -L$(GCC_LIBDIR) -L$(CROSS_GCC_LIBDIR)
#main_LDFLAGS += -L$(GCC_LIBDIR) -L$(CROSS_GCC_LIBDIR)
#
## allow us to link to libraries we installed
#build_CPPFLAGS += -I$(DESTDIR)$(includedir) 
#build_CFLAGS += -Os -I$(DESTDIR)$(includedir) -L$(DESTDIR)$(libdir) 
##build_CXXFLAGS += -Os -I$(DESTDIR)$(includedir) -L$(DESTDIR)$(libdir) 
#build_LDFLAGS += -L$(DESTDIR)$(libdir) 
#
## Default main_CC to gcc, $(DESTIMG)_CC to main_CC and set CC based on $(DESTIMG)
##main_CC ?= $(GARHOST)-gcc
#main_CC ?= gcc
#main_CXX ?= g++
#main_F77 ?= g77
##main_LD ?= $(GARHOST)-ld
#main_LD ?= ld
#build_CC ?= gcc
#build_CXX ?= g++
#build_LD ?= ld

#===========================
# Sensible compiler defaults
#===========================
CC ?= gcc
CXX ?= g++
F77 = gfortran
#LD	?= ld

# If we use gfortran, we need the following library flags for linking
LDFLAGS	+= "-lgfortran -lm -lgfortranbegin"

# If -fno-f2c is used anywhere, use it EVERYWHERE !!!!!
#F77_COMMON	= "-fno-f2c -O3 -funroll-all-loops -c"
F77_COMMON	= "-O3 -funroll-all-loops -c"
FFLAGS	+= $(F77_COMMON)
# Some C compilers need special library when using fortran libs
C_FORTRAN_LIB = "g2c"

## GARCH and GARHOST for main.  Override these for cross-compilation
##main_GARCH ?= i386
##main_GARHOST ?= i386-pc-linux-gnu
#main_GARCH ?= 
#main_GARHOST ?= 
#
## GARCH and GARHOST for build.  Do not change these.
#build_GARCH := $(shell arch)
#build_GARHOST := $(GARBUILD)
#
## Don't build these packages as in the build image
#build_NODEPEND = devel/glibc devel/gcc-primitives

# This is for foo-config chaos
PKG_CONFIG_PATH=$(DESTDIR)$(libdir)/pkgconfig/

# Put these variables in the environment during the
# configure build and install stages
STAGE_EXPORTS = DESTDIR prefix exec_prefix bindir sbindir libexecdir datadir
STAGE_EXPORTS += sysconfdir sharedstatedir localstatedir libdir infodir lispdir
STAGE_EXPORTS += includedir mandir docdir sourcedir
STAGE_EXPORTS += CPPFLAGS CFLAGS LDFLAGS FFLAGS
STAGE_EXPORTS += CC CXX F77

CONFIGURE_ENV += $(foreach TTT,$(STAGE_EXPORTS),$(TTT)="$($(TTT))")
BUILD_ENV += $(foreach TTT,$(STAGE_EXPORTS),$(TTT)="$($(TTT))")
INSTALL_ENV += $(foreach TTT,$(STAGE_EXPORTS),$(TTT)="$($(TTT))")
MANIFEST_ENV += $(foreach TTT,$(STAGE_EXPORTS),$(TTT)="$($(TTT))")

# Global environment
export GARBUILD
export PATH LD_LIBRARY_PATH #LD_PRELOAD
export PKG_CONFIG_PATH

GARCHIVEROOT ?= /usr/media/src/src/dsp/garnumpy/garnumpyarchives
GARCHIVEDIR = $(GARCHIVEROOT)/$(DISTNAME)
GARPKGROOT ?= /var/www/garpkg
GARPKGDIR = $(GARPKGROOT)/$(GARNAME)

# prepend the local file listing
FILE_SITES = file://$(FILEDIR)/ file://$(GARCHIVEDIR)/

#SOURCEFORGEDL	= http://jaist.dl.sourceforge.net/sourceforge
SOURCEFORGEDL	= http://dl.sourceforge.net/
MASTER_SITES 	+= $(SOURCEFORGEDL)

## Extra configuration for the lnx-bbc build
#GAR_EXTRA_CONF += devel/gcc/package-api.mk
#GAR_EXTRA_CONF += meta/singularity/singularity.conf.mk
#GAR_EXTRA_CONF += meta/lnx.img/lnx.img.conf.mk
#GAR_EXTRA_CONF += meta/root.bin/root.bin.conf.mk
#
## Extra libs to include with gar.mk
#GAR_EXTRA_LIBS += bbc.lib.mk

#===================================================
# General compilation options (you can tweak those)
#===================================================
# Use for parrallel builds; you should NOT use make -j N directly from the
# cmdline, as many libraries have broken makefile wrt this feature, and/or
# some libraries test need single job.
PMAKE	= $(MAKE) -j 4

#----------------------
# General BLAS/LAPACK 
#----------------------
# numpy/scipy needs blas and lapack libraries for fast linear algebra computation.
# Here, set your libraries for blas and lapack. 

# valid values for BLASLAPACK: atlas, system or netlib
#BLASLAPACK	= system
BLASLAPACK	= atlas
#BLASLAPACK	= netlib

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
TEST_NETLIB_LAPACK=1

# Set to 1 to try using gcc3 instead of current gcc for kernels
# (may produce much more efficient code on some architecture, you 
# should look at ATLAS webpage for more details)
ATLAS_USE_GCC3	= 0
GCC3_PATH		= /usr/bin/gcc-3.3

#----------------------
# General fftw3 options
#----------------------
# possible values: fftw3
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

#----------------------
# SCIPY related options
#----------------------
# space separated list of package in scipy sandbox to add
SCIPYSANDPKG = pyem svm
SCIPYSANDPKG = 

#------------
# GNU TOOLS
#------------
# GARNUMPY uses the GNU tool chain. On some systems the GNU tools may have
# different names and may be located in non-standard places.
# If so, change these accordingly.
AWK = awk
FIND = find
GREP = grep
GPG = gpg
GZIP = gzip
MAKE = make
MD5 = md5sum
SED = sed
TAR = tar
# If not ranlib available on yout system, setting it /bin/true should be OK
RANLIB=ranlib

#===========================================
# Netlab BLAS/LAPACK OPTIONS  (Don't touch)
#===========================================
LAPACKOSNAME	= LINUX

NETLIB_BLAS_F77_OPTS 	= $(F77_COMMON) 
NETLIB_BLAS_FULL_NAME	= libblas.a
NETLIB_BLAS_NAME		= blas
NETLIB_BLAS_DIR			= $(libdir)
NETLIB_BLAS_LOCATION	= $(libdir)/$(NETLIB_BLAS_FULL_NAME)

NETLIB_LAPACK_F77_OPTS 	= $(F77_COMMON)
NETLIB_LAPACK_FULL_NAME	= liblapack.a
NETLIB_LAPACK_NAME		= lapack
NETLIB_LAPACK_DIR		= $(libdir)
NETLIB_LAPACK_LOCATION	= $(libdir)/$(NETLIB_LAPACK_FULL_NAME)

#===========================================
# ATLAS BLAS/LAPACK OPTIONS  (Don't touch)
#===========================================
ATLOBJDIR				= GarObj
ATLASPREFIX				= $(prefix)/atlas
ATLASLIBDIR				= $(prefix)/atlas/lib

ATLAS_BLAS_FULL_NAME	= libblas.a
ATLAS_BLAS_NAME			= blas
ATLAS_BLAS_SLOCATION	= $(libdir)/$(ATLAS_BLAS_NAME)

ATLAS_LAPACK_FULL_NAME	= liblapack.a
ATLAS_LAPACK_NAME		= lapack
ATLAS_LAPACK_LOCATION	= $(libdir)/$(ATLAS_LAPACK_NAME)

#===============================================
# FINAL BLAS/LAPACK related values (don't touch)
#===============================================
# BLAS_NAME, etc... are the values used in all sub Makefile.
ifeq ($(BLASLAPACK), system)
	BLAS_NAME	= $(SYSTEM_BLAS_NAME)
	BLAS_DIR	= $(SYSTEM_BLAS_DIR)
	LAPACK_NAME	= $(SYSTEM_LAPACK_NAME)
	LAPACK_DIR	= $(SYSTEM_LAPACK_DIR)
else 
	ifeq ($(BLASLAPACK), atlas)
		BLAS_NAME	= $(ATLAS_BLAS_NAME)
		BLAS_DIR	= $(ATLASLIBDIR)
		LAPACK_NAME	= $(ATLAS_LAPACK_NAME)
		LAPACK_DIR	= $(ATLASLIBDIR)
	else 
		ifeq ($(BLASLAPACK), netlib)
			BLAS_NAME	= $(NETLIB_BLAS_NAME)
			BLAS_DIR	= $(NETLIB_BLAS_DIR)
			LAPACK_NAME	= $(NETLIB_LAPACK_NAME)
			LAPACK_DIR	= $(NETLIB_LAPACK_DIR)
		endif
	endif
endif

#===============================================
# FINAL UMFPACK related values (don't touch)
#===============================================
UMFPACK_NAME	= umfpack
UMFPACK_DIR		= $(libdir)
UMFPACK_INCDIR	= $(includedir)/umfpack

AMD_NAME	= amd
AMD_DIR		= $(libdir)

#===========================================
# FFTW3 OPTIONS  (Don't touch)
#===========================================
FFTW3_F77_FLAGS 	= $(F77_COMMON) 

ifeq ($(FFT), fftw3)
	FFT_LIB_DIR	= $(libdir)
endif
