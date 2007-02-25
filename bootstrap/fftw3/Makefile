GARNAME = fftw
GARVERSION = 3.1.2
CATEGORIES = 

MASTER_SITES = http://www.fftw.org/

DISTFILES = $(GARNAME)-$(GARVERSION).tar.gz
PATCHFILES = 
MAINTAINER = 
# GPL, GPL2, BSD, MIT, etc. Or add the URL to any custom license
LICENSE = GPL2

DESCRIPTION = 
define BLURB
	TODO: fftw3 blurb
endef

# Dependencies are of the form categorydir/packagedir
# LIBDEPS are for libraries, and DEPENDS are for everything else
LIBDEPS = 
DEPENDS =
# Builddeps are installed in the build DESTIMG
BUILDDEPS =

CONFIGURE_SCRIPTS 	= custom 
BUILD_SCRIPTS 		= custom
INSTALL_SCRIPTS 	= custom 

CONFIGURE_ARGS = $(DIRPATHS) 
NODIRPATHS = 

# If some dirs are trying to install into /, list their names
# here, such as: prefix bindir mandir
INSTALL_OVERRIDE_DIRS = 

# This should go before any hand-made rules.
include ../../gar.mk

configure-custom:
	cd $(WORKSRC) && CC=$(CC) F77=$(F77) FFLAGS="$(FFTW3_F77_FLAGS)" ./configure $(DIRPATHS) --enable-shared=yes
	@$(MAKECOOKIE)

build-custom:
	@cd $(WORKSRC) && $(PMAKE)
	@$(MAKECOOKIE)

install-custom:
	@cd $(WORKSRC) && $(MAKE) install
	@$(MAKECOOKIE)
