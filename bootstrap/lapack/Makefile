GARNAME = lapack
# 3.1.0 seems to cause some test to fail with scipy 0.5.2
#GARVERSION = 3.1.0
GARVERSION = 3.0
CATEGORIES = 

MASTER_SITES = http://www.netlib.org/lapack/

DISTFILES = $(GARNAME)-$(GARVERSION).tgz
PATCHFILES = #01_make.inc.LINUX.diff
MAINTAINER = David Cournapeau <david@ar.media.kyoto-u.ac.jp>
# GPL, GPL2, BSD, MIT, etc. Or add the URL to any custom license
LICENSE = 

DESCRIPTION = 
define BLURB
	TODO: Lapack blurb
endef

# Dependencies are of the form categorydir/packagedir
# LIBDEPS are for libraries, and DEPENDS are for everything else
#
# lapack does not depend on blas strico sensu, but testing lapack depends on blas. 
# Building blas is quick anyway, and the tarball small.
LIBDEPS = bootstrap/blas
DEPENDS =
# Builddeps are installed in the build DESTIMG
BUILDDEPS =


CONFIGURE_SCRIPTS = custom
BUILD_SCRIPTS = custom
INSTALL_SCRIPTS = custom

CONFIGURE_ARGS = $(DIRPATHS)
NODIRPATHS = 

# If some dirs are trying to install into /, list their names
# here, such as: prefix bindir mandir
INSTALL_OVERRIDE_DIRS = 

# This should go before any hand-made rules.
include ../../gar.mk

# This is only for 3.0 (not 3.1.0): lapack extracts itself into LAPACK
post-extract:
	@echo " ===> moving files to $(WORKSRC)"
	@mv $(EXTRACTDIR)/LAPACK $(WORKSRC)
	@$(MAKECOOKIE)

configure-custom:
	@cd $(WORKSRC) && cp INSTALL/make.inc.$(LAPACKOSNAME) make.inc

build-custom:
	# default target include test, it seems
	@cd $(WORKSRC) &&  $(MAKE) FORTRAN=$(F77) LOADER=$(F77) BLASLIB="$(libdir)/$(NETLIB_BLAS_FULL_NAME)" LAPACKLIB=$(NETLIB_LAPACK_FULL_NAME) OPTS=$(NETLIB_LAPACK_F77_OPTS) lib
	@cd $(WORKSRC) &&  $(MAKE) FORTRAN=$(F77) LOADER=$(F77) BLASLIB="$(libdir)/$(NETLIB_BLAS_FULL_NAME)" LAPACKLIB=$(NETLIB_LAPACK_FULL_NAME) OPTS=$(NETLIB_LAPACK_F77_OPTS) testing
	@$(MAKECOOKIE)

install-custom:
	@cd $(WORKSRC) && install -c $(NETLIB_LAPACK_FULL_NAME) $(libdir)
	@$(MAKECOOKIE)
