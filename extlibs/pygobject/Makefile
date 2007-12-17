GARNAME = pygobject
GARVERSION = 2.14.0
CATEGORIES = extlibs

MASTER_SITES = ftp://ftp.gnome.org/pub/GNOME/sources/pygobject/2.14/

DISTFILES = $(GARNAME)-$(GARVERSION).tar.bz2
PATCHFILES = 
MAINTAINER = David Cournapeau <david@ar.media.kyoto-u.ac.jp>
# GPL, GPL2, BSD, MIT, etc. Or add the URL to any custom license
LICENSE = 

DESCRIPTION = 
define BLURB
	TODO: pygtk blurb
endef

# Dependencies are of the form categorydir/packagedir
# LIBDEPS are for libraries, and DEPENDS are for everything else
LIBDEPS =
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
	cd $(WORKSRC) && CC=$(CC) ./configure $(DIRPATHS) 
	@$(MAKECOOKIE)

build-custom:
	@cd $(WORKSRC) && $(PMAKE)
	@$(MAKECOOKIE)

install-custom:
	@cd $(WORKSRC) && $(MAKE) install
	@$(MAKECOOKIE)
