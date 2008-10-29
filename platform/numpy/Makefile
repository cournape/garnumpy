GARNAME = numpy
GARVERSION = 1.2.0
CATEGORIES =

MASTER_SITES = $(SOURCEFORGEDL)/numpy/

DISTFILES = $(GARNAME)-$(GARVERSION).tar.gz
PATCHFILES =
MAINTAINER =
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
LIBDEPS = $(shell . $(GARDIR)/blop.sh && get_numpy_dep $(BLASLAPACK) )
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

configure-custom:
	# Change default path when looking for libs to fake dir,
	# so we can set everything by env variables
	@. ../../blop.sh && cd $(WORKSRC) && get_numpy_sitecfg \
	$(BLASLAPACK) $(BLAS_DIR) $(BLAS_NAME) \
	$(LAPACK_DIR) $(LAPACK_NAME) \
	$(FFT) $(FFT_LIB_DIR) \
	$(UMFPACK_DIR) $(UMFPACK_INCDIR) $(AMD_DIR)> site.cfg
	cd $(WORKSRC) && PYTHONPATH=$(PYTHONPATH) $(PYTHON) \
	setup.py config_fc $(NUMPY_CC_OPTS) config
	@$(MAKECOOKIE)

build-custom:
	@cd $(WORKSRC) && PYTHONPATH=$(PYTHONPATH) $(PYTHON) \
	setup.py config_fc $(NUMPY_CC_OPTS) build
	@$(MAKECOOKIE)

install-custom:
	@cd $(WORKSRC) && PYTHONPATH=$(PYTHONPATH) $(PYTHON) setup.py install --prefix=$(prefix)
	@$(MAKECOOKIE)

