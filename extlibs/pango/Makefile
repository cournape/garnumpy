GARNAME = pango
GARVERSION = 1.16.4
CATEGORIES = gui

MASTER_SITES = http://ftp.gtk.org/pub/pango/1.16/

DISTFILES = $(GARNAME)-$(GARVERSION).tar.bz2
PATCHFILES = 
MAINTAINER = David Cournapeau <david@ar.media.kyoto-u.ac.jp>
# GPL, GPL2, BSD, MIT, etc. Or add the URL to any custom license
LICENSE = 

DESCRIPTION = 
define BLURB
	TODO: Pango blurb
endef

# Dependencies are of the form categorydir/packagedir
# LIBDEPS are for libraries, and DEPENDS are for everything else
LIBDEPS = extlibs/glib
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
	@cd $(WORKSRC) && PATH=$(main_bindir):$(PATH) $(PMAKE)
	@$(MAKECOOKIE)

install-custom:
	@cd $(WORKSRC) && $(MAKE) install
	@$(MAKECOOKIE)
