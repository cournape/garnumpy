GARNAME = matplotlib
GARVERSION = 0.98.3
CATEGORIES = 

MASTER_SITES = $(SOURCEFORGEDL)/matplotlib/

DISTFILES = $(GARNAME)-$(GARVERSION).tar.gz
PATCHFILES = 
MAINTAINER = 
# GPL, GPL2, BSD, MIT, etc. Or add the URL to any custom license
LICENSE = 

DESCRIPTION = 
define BLURB
	TODO: MPL blurb
endef

# Dependencies are of the form categorydir/packagedir
# LIBDEPS are for libraries, and DEPENDS are for everything else
LIBDEPS =
DEPENDS = platform/numpy
# Builddeps are installed in the build DESTIMG
BUILDDEPS =


CONFIGURE_SCRIPTS = custom
#BUILD_SCRIPTS = $(WORKSRC)/Makefile
#INSTALL_SCRIPTS = $(WORKSRC)/Makefile
BUILD_SCRIPTS = custom
INSTALL_SCRIPTS = custom

CONFIGURE_ARGS = $(DIRPATHS)
NODIRPATHS = 

# If some dirs are trying to install into /, list their names
# here, such as: prefix bindir mandir
INSTALL_OVERRIDE_DIRS = 

# This should go before any hand-made rules.
include ../../gar.mk

pre-everything:

configure-custom:
	cd $(WORKSRC) && PKG_CONFIG_PATH=$(PKG_CONFIG_PATH) PYTHONPATH=$(PYTHONPATH) $(PYTHON) setup.py config
	@$(MAKECOOKIE)

build-custom:
	@cd $(WORKSRC) && PYTHONPATH=$(PYTHONPATH) $(PYTHON) setup.py build
	@$(MAKECOOKIE)

install-custom:
	@cd $(WORKSRC) && PYTHONPATH=$(PYTHONPATH) $(PYTHON) setup.py install --prefix=$(prefix)
	@$(MAKECOOKIE)

