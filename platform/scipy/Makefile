GARNAME = scipy
GARVERSION = 0.5.2
CATEGORIES = 

MASTER_SITES = http://kent.dl.sourceforge.net/scipy/

DISTFILES = $(GARNAME)-$(GARVERSION).tar.gz
PATCHFILES = 
MAINTAINER = David Cournapeau <david@ar.media.kyoto-u.ac.jp>
# GPL, GPL2, BSD, MIT, etc. Or add the URL to any custom license
LICENSE = BSD

DESCRIPTION = 
define BLURB
	TODO: scipy blurp
endef

# Dependencies are of the form categorydir/packagedir
# LIBDEPS are for libraries, and DEPENDS are for everything else
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
	@cd $(WORKSRC) && for i in "$(SCIPYSANDPKG)"; do echo "$$i" >> Lib/sandbox/enabled_packages.txt; done;
	# Change default path when looking for libs to fake dir,
	# so we can set everything by env variables
	. ../../blop.sh && cd $(WORKSRC) && SYSTEM_BLAS_NAME=$(SYSTEM_BLAS_NAME) && \
	SYSTEM_BLAS_DIR=$(SYSTEM_BLAS_DIR) && \
	SYSTEM_BLAS_NAME=$(SYSTEM_BLAS_NAME) && \
	SYSTEM_LAPACK_DIR=$(SYSTEM_LAPACK_DIR) && \
	SYSTEM_LAPACK_NAME=$(SYSTEM_LAPACK_NAME) && \
	NETLIB_BLAS_DIR=$(libdir) && \
	NETLIB_BLAS_NAME=$(NETLIB_BLAS_NAME) && \
	NETLIB_LAPACK_DIR=$(libdir) && \
	NETLIB_LAPACK_NAME=$(NETLIB_LAPACK_NAME) && \
	ATLAS_BLAS_DIR=$(libdir) && \
	ATLAS_BLAS_NAME=$(ATLAS_BLAS_NAME) && \
	ATLAS_LAPACK_DIR=$(libdir) && \
	ATLAS_LAPACK_NAME=$(ATLAS_LAPACK_NAME) && \
	get_numpy_sitecfg $(BLASLAPACK) > site.cfg
	cd $(WORKSRC) && PYTHONPATH=$(PYTHONPATH) $(PYTHON) setup.py config
	@$(MAKECOOKIE)

build-custom:
	@cd $(WORKSRC) && PYTHONPATH=$(PYTHONPATH) $(PYTHON) setup.py build
	@$(MAKECOOKIE)

install-custom:
	@cd $(WORKSRC) && PYTHONPATH=$(PYTHONPATH) $(PYTHON) setup.py install --prefix=$(prefix)
	@$(MAKECOOKIE)

