GARNAME = blas
GARVERSION = ref
CATEGORIES = 

MASTER_SITES = http://www.netlib.org/blas/

DISTFILES = $(GARNAME).tgz
PATCHFILES = gar-blas-makefile.diff
MAINTAINER = David Cournapeau <david@ar.media.kyoto-u.ac.jp>
# GPL, GPL2, BSD, MIT, etc. Or add the URL to any custom license
LICENSE = 

DESCRIPTION = 
define BLURB
	TODO: Blas blurb
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
EXTRACT_SCRIPTS = custom
BUILD_SCRIPTS = custom
INSTALL_SCRIPTS = custom

CONFIGURE_ARGS = $(DIRPATHS)
NODIRPATHS = 

# If some dirs are trying to install into /, list their names
# here, such as: prefix bindir mandir
INSTALL_OVERRIDE_DIRS = 

# This should go before any hand-made rules.
include ../../gar.mk

# This is ugly: blas archive extract its files in the same directory instead of 
# creating one. This does not work with gar, and I don't manage to change the
# extract script, so instead, this post rule move everything from the EXTRACTDIR
# to the WORKSRC
post-extract:
	@echo " ===> moving files to $(WORKSRC)"
	@mkdir $(WORKSRC)
	@mv $(EXTRACTDIR)/*.f $(WORKSRC)
	@$(MAKECOOKIE)

build-custom:
	# build objects
	#cd $(WORKSRC) && $(MAKE) obj
	# build static lib from it
	cd $(WORKSRC) && $(MAKE) FORTRAN=$(F77) F77FLAGS=$(NETLIB_BLAS_F77_OPTS) AR=$(AR) RANLIB=$(RANLIB) LIBNAME=$(NETLIB_BLAS_FULL_NAME) lib
	@$(MAKECOOKIE)

install-custom:
	@cd $(WORKSRC) && install -c $(NETLIB_BLAS_FULL_NAME) $(libdir)
