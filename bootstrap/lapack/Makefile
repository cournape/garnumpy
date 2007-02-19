GARNAME = lapack
GARVERSION = 3.1.0
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
LIBDEPS = platform/blas
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

configure-custom:
	cd $(WORKSRC) && cp INSTALL/make.inc.$(LAPACKOSNAME) make.inc

build-custom:
	# default target include test, it seems
	cd $(WORKSRC) &&  $(MAKE) FORTRAN=$(F77) LOADER=$(F77) BLASLIB="$(libdir)/$(BLASNAME)" LAPACKLIB=$(LAPACKNAME)
	@$(MAKECOOKIE)

install-custom:
	cd $(WORKSRC) && install -c $(LAPACKNAME) $(libdir)
	@$(MAKECOOKIE)
