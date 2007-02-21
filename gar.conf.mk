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

# allow us to link to libraries we installed
#main_CPPFLAGS += -nostdinc
#main_CFLAGS += -nostdinc -nostdlib
#main_LDFLAGS += -nostdlib
main_CPPFLAGS += -I$(DESTDIR)$(includedir) 
main_CFLAGS += -Os -I$(DESTDIR)$(includedir) -L$(DESTDIR)$(libdir) 
#main_CXXFLAGS += -Os -I$(DESTDIR)$(includedir) -L$(DESTDIR)$(libdir) 
main_LDFLAGS += -L$(DESTDIR)$(libdir) 
main_CPPFLAGS += -I$(GCC_INCLUDEDIR) -I$(CROSS_GCC_INCLUDEDIR)
main_CFLAGS += -I$(GCC_INCLUDEDIR) -I$(CROSS_GCC_INCLUDEDIR) -L$(GCC_LIBDIR) -L$(CROSS_GCC_LIBDIR)
#main_CXXFLAGS += -I$(GCC_INCLUDEDIR) -I$(CROSS_GCC_INCLUDEDIR) -L$(GCC_LIBDIR) -L$(CROSS_GCC_LIBDIR)
main_LDFLAGS += -L$(GCC_LIBDIR) -L$(CROSS_GCC_LIBDIR)

# allow us to link to libraries we installed
build_CPPFLAGS += -I$(DESTDIR)$(includedir) 
build_CFLAGS += -Os -I$(DESTDIR)$(includedir) -L$(DESTDIR)$(libdir) 
#build_CXXFLAGS += -Os -I$(DESTDIR)$(includedir) -L$(DESTDIR)$(libdir) 
build_LDFLAGS += -L$(DESTDIR)$(libdir) 

# Default main_CC to gcc, $(DESTIMG)_CC to main_CC and set CC based on $(DESTIMG)
#main_CC ?= $(GARHOST)-gcc
main_CC ?= gcc
main_CXX ?= g++
main_F77 ?= gfortran
#main_LD ?= $(GARHOST)-ld
main_LD ?= ld
build_CC ?= gcc
build_CXX ?= g++
build_LD ?= ld

#===========================
# Sensible compiler defaults
#===========================
CC ?= gcc
CXX ?= g++
F77 ?= g77

# GARCH and GARHOST for main.  Override these for cross-compilation
#main_GARCH ?= i386
#main_GARHOST ?= i386-pc-linux-gnu
main_GARCH ?= 
main_GARHOST ?= 

# GARCH and GARHOST for build.  Do not change these.
build_GARCH := $(shell arch)
build_GARHOST := $(GARBUILD)

# Don't build these packages as in the build image
build_NODEPEND = devel/glibc devel/gcc-primitives

# This is for foo-config chaos
PKG_CONFIG_PATH=$(DESTDIR)$(libdir)/pkgconfig/

# Put these variables in the environment during the
# configure build and install stages
STAGE_EXPORTS = DESTDIR prefix exec_prefix bindir sbindir libexecdir datadir
STAGE_EXPORTS += sysconfdir sharedstatedir localstatedir libdir infodir lispdir
STAGE_EXPORTS += includedir mandir docdir sourcedir
STAGE_EXPORTS += CPPFLAGS CFLAGS LDFLAGS
STAGE_EXPORTS += CC CXX

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

##append the public archive
#MASTER_SITES += http://www.lnx-bbc.org/garchive/$(DISTNAME)/ http://garchive.movealong.org/$(DISTNAME)/ http://build.lnx-bbc.org/garchive/$(DISTNAME)/
#
## Extra configuration for the lnx-bbc build
#GAR_EXTRA_CONF += devel/gcc/package-api.mk
#GAR_EXTRA_CONF += meta/singularity/singularity.conf.mk
#GAR_EXTRA_CONF += meta/lnx.img/lnx.img.conf.mk
#GAR_EXTRA_CONF += meta/root.bin/root.bin.conf.mk
#
## Extra libs to include with gar.mk
#GAR_EXTRA_LIBS += bbc.lib.mk

#=======================
# Python related option
#=======================
# If you want to use a different version of python everywhere
# change this
PYTHON = $(shell which python)
PYVER = $(shell $(PYTHON) -c "import sys; print sys.version[:3]")
PYTHONPATH=$(main_libdir)/python$(PYVER)/site-packages:$(main_libdir)/python$(PYVER)/site-packages/gtk-2.0

#======================
# General BLAS/LAPACK 
#======================
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

# If -fno-f2c is used anywhere, used it EVERYWHERE !!!!!
F77_COMMON	= "-fno-f2c -O3 -funroll-all-loops -c"
#===========================================
# Netlab BLAS/LAPACK OPTIONS  (Don't touch)
#===========================================
LAPACKOSNAME	= LINUX

NETLIB_BLAS_F77_OPTS 	= $(F77_COMMON) 
NETLIB_BLAS_FULL_NAME	= libblas.a
NETLIB_BLAS_NAME		= blas
NETLIB_BLAS_LOCATION	= $(libdir)/$(NETLIB_BLAS_FULL_NAME)

NETLIB_LAPACK_F77_OPTS 	= $(F77_COMMON)
NETLIB_LAPACK_FULL_NAME	= liblapack.a
NETLIB_LAPACK_NAME		= lapack
NETLIB_LAPACK_LOCATION	= $(libdir)/$(NETLIB_LAPACK_FULL_NAME)

#===========================================
# ATLAS BLAS/LAPACK OPTIONS  (Don't touch)
#===========================================
ATLOBJDIR				= GarObj

ATLAS_BLAS_FULL_NAME	= libblas.a
ATLAS_BLAS_NAME			= fblas
ATLAS_BLAS_SLOCATION	= $(libdir)/$(ATLAS_BLAS_NAME)

ATLAS_LAPACK_FULL_NAME	= liblapack.a
ATLAS_LAPACK_NAME		= lapack
ATLAS_LAPACK_LOCATION	= $(libdir)/$(ATLAS_LAPACK_NAME)

#======================
# SCIPY related options
#======================
# space separated list of package in scipy sandbox to add
#SCIPYSANDPKG = "pyem svm"
SCIPYSANDPKG = 

#============
# GNU TOOLS
#============
# GARNOME uses the GNU tool chain. On some systems the GNU tools may have
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
# Fake ranlib
RANLIB=echo

