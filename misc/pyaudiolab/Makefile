GARNAME = pyaudiolab
GARVERSION = 0.6.6
CATEGORIES = 

MASTER_SITES = http://www.ar.media.kyoto-u.ac.jp/members/david/archives/pyaudiolab/releases/

DISTFILES = $(GARNAME)-$(GARVERSION).tar.gz
PATCHFILES = 
MAINTAINER = David Cournapeau <david@ar.media.kyoto-u.ac.jp>
# GPL, GPL2, BSD, MIT, etc. Or add the URL to any custom license
LICENSE = BSD

DESCRIPTION = 
define BLURB
	pyaudiolab
endef

# Dependencies are of the form categorydir/packagedir
# LIBDEPS are for libraries, and DEPENDS are for everything else
#LIBDEPS = extlibs/libsndfile
LIBDEPS =
DEPENDS = platform/numpy
# Builddeps are installed in the build DESTIMG
BUILDDEPS =


#CONFIGURE_SCRIPTS = $(WORKSRC)/configure
#BUILD_SCRIPTS = $(WORKSRC)/Makefile
#INSTALL_SCRIPTS = $(WORKSRC)/Makefile
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

pre-everything:

configure-custom:
	@cd $(WORKSRC) && echo "[sndfile]\\ninclude_dirs = $(main_includedir)\\nlibrary_dirs = $(main_libdir)\\nlibrary = sndfile" > site.cfg
	@$(MAKECOOKIE)

build-custom:
	@cd $(WORKSRC) && PYTHONPATH=$(PYTHONPATH) $(PYTHON) setup.py build
	@$(MAKECOOKIE)

install-custom:
	@cd $(WORKSRC) && PYTHONPATH=$(PYTHONPATH) $(PYTHON) setup.py install --prefix=$(prefix)
	@$(MAKECOOKIE)

