GARNAME = atlas
GARVERSION = 3.7.28
CATEGORIES = 

MASTER_SITES = http://kent.dl.sourceforge.net/math-atlas/

DISTFILES = $(GARNAME)$(GARVERSION).tar.bz2
PATCHFILES = 
MAINTAINER = David Cournapeau <david@ar.media.kyoto-u.ac.jp>
# GPL, GPL2, BSD, MIT, etc. Or add the URL to any custom license
LICENSE = 

DESCRIPTION = 
define BLURB
	TODO: Blas blurb
endef

# Dependencies are of the form categorydir/packagedir
# LIBDEPS are for libraries, and DEPENDS are for everything else
LIBDEPS = bootstrap/lapack
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

post-extract:
	@echo " ===> moving files to $(WORKSRC)"
	@mv $(EXTRACTDIR)/ATLAS $(WORKSRC)
	@mkdir -p $(WORKSRC)/$(ATLOBJDIR)
	@$(MAKECOOKIE)

configure-custom:
	@cd $(WORKSRC)/$(ATLOBJDIR) && /usr/media/src/src/dsp/garnumpy/garnumpy/bootstrap/ATLAS/work/main.d/atlas-3.7.28/configure -v 2

#build-custom:
#	# build objects
#	@cd $(WORKSRC) && $(F77) $(NETLIB_BLAS_F77_OPTS) *.f
#	# build static lib from it
#	@cd $(WORKSRC) && $(AR) -r $(NETLIB_BLAS_FULL_NAME) *.o && $(RANLIB) $(NETLIB_BLAS_FULL_NAME)
#	@$(MAKECOOKIE)
#
#install-custom:
#	@cd $(WORKSRC) && install -c $(NETLIB_BLAS_FULL_NAME) $(libdir)
