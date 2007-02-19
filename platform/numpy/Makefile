GARNAME = numpy
GARVERSION = 1.0.1
CATEGORIES = 

MASTER_SITES = http://kent.dl.sourceforge.net/numpy/

DISTFILES = $(GARNAME)-$(GARVERSION).tar.gz
PATCHFILES = 
MAINTAINER = David Cournapeau <david@ar.media.kyoto-u.ac.jp>
# GPL, GPL2, BSD, MIT, etc. Or add the URL to any custom license
LICENSE = BSD

DESCRIPTION = 
define BLURB
 NumPy is a python package which gives python a fast array package for numeric
 computation.

 NumPy is a replacement of Numeric Python that adds the features of numarray.  
endef

# Dependencies are of the form categorydir/packagedir
# LIBDEPS are for libraries, and DEPENDS are for everything else
LIBDEPS = bootstrap/blas bootstrap/lapack
DEPENDS =
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
	cd $(WORKSRC) && BLAS=$(BLASLOCATION) LAPACK=$(LAPACKLOCATION) PYTHONPATH=$(PYTHONPATH) $(PYTHON) setup.py config
	@$(MAKECOOKIE)

build-custom:
	@cd $(WORKSRC) && BLAS=$(BLASLOCATION) LAPACK=$(LAPACKLOCATION) PYTHONPATH=$(PYTHONPATH) $(PYTHON) setup.py build
	@$(MAKECOOKIE)

install-custom:
	@cd $(WORKSRC) && BLAS=$(BLASLOCATION) LAPACK=$(LAPACKLOCATION) PYTHONPATH=$(PYTHONPATH) $(PYTHON) setup.py install --prefix=$(prefix)
	@$(MAKECOOKIE)

