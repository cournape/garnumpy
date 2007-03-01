GARNAME = ctypes
GARVERSION = 1.0.1
CATEGORIES = 

MASTER_SITES = $(SOURCEFORGEDL)/ctypes/

DISTFILES = $(GARNAME)-$(GARVERSION).tar.gz
PATCHFILES = 
MAINTAINER = 
# GPL, GPL2, BSD, MIT, etc. Or add the URL to any custom license
LICENSE = 

DESCRIPTION = 
define BLURB
	TODO: Ctypes blurb
endef

# Dependencies are of the form categorydir/packagedir
# LIBDEPS are for libraries, and DEPENDS are for everything else
LIBDEPS =
DEPENDS = 
# Builddeps are installed in the build DESTIMG
BUILDDEPS =


#CONFIGURE_SCRIPTS = $(WORKSRC)/configure
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

build-custom:
	@cd $(WORKSRC) && PYTHONPATH=$(PYTHONPATH) $(PYTHON) setup.py build
	@$(MAKECOOKIE)

install-custom:
	@cd $(WORKSRC) && PYTHONPATH=$(PYTHONPATH) $(PYTHON) setup.py install --prefix=$(prefix)
	@$(MAKECOOKIE)

