GARNAME = scipy
GARVERSION = 0.5.2
CATEGORIES = 

MASTER_SITES = $(SOURCERFORGEDL)/scipy

DISTFILES = $(GARNAME)-$(GARVERSION).tar.gz
PATCHFILES = 
MAINTAINER = 
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
	# If enabled_packages.txt is not empty but with no packages,
	# distutils goes into infinite recursion, so we take care
	# not to create the file if no sandbox pkgs are chosen
	@cd $(WORKSRC) ; \
	if [ -n "$(SCIPYSANDPKG)" ]; then\
		for i in $(SCIPYSANDPKG); do\
			echo "==== Adding sandboxed package $$i   ======";\
			echo $$i >> Lib/sandbox/enabled_packages.txt;\
		done;\
	fi;
	# Change default path when looking for libs to fake dir,
	# so we can set everything by env variables
	@. ../../blop.sh && cd $(WORKSRC) && SYSTEM_BLAS_NAME=$(SYSTEM_BLAS_NAME) && \
	SYSTEM_BLAS_DIR=$(SYSTEM_BLAS_DIR) && \
	SYSTEM_BLAS_NAME=$(SYSTEM_BLAS_NAME) && \
	SYSTEM_LAPACK_DIR=$(SYSTEM_LAPACK_DIR) && \
	SYSTEM_LAPACK_NAME=$(SYSTEM_LAPACK_NAME) && \
	NETLIB_BLAS_DIR=$(libdir) && \
	NETLIB_BLAS_NAME=$(NETLIB_BLAS_NAME) && \
	NETLIB_LAPACK_DIR=$(libdir) && \
	NETLIB_LAPACK_NAME=$(NETLIB_LAPACK_NAME) && \
	ATLASLIBDIR=$(ATLASLIBDIR) && \
	get_numpy_sitecfg $(BLASLAPACK) > site.cfg
	@cd $(WORKSRC) && PYTHONPATH=$(PYTHONPATH) $(PYTHON) setup.py config
	@$(MAKECOOKIE)

build-custom:
	@cd $(WORKSRC) && PYTHONPATH=$(PYTHONPATH) $(PYTHON) setup.py build
	@$(MAKECOOKIE)

install-custom:
	@cd $(WORKSRC) && PYTHONPATH=$(PYTHONPATH) $(PYTHON) setup.py install --prefix=$(prefix)
	@$(MAKECOOKIE)

