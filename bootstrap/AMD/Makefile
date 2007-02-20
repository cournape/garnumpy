GARNAME = AMD
GARVERSION = 2.0.4
CATEGORIES = bootstrap

MASTER_SITES = http://www.cise.ufl.edu/research/sparse/amd/

DISTFILES = $(GARNAME)-$(GARVERSION).tar.gz
PATCHFILES = 
MAINTAINER = David Cournapeau <david@ar.media.kyoto-u.ac.jp>
# GPL, GPL2, BSD, MIT, etc. Or add the URL to any custom license
LICENSE = 

DESCRIPTION = 
define BLURB
	TODO: AMD blurb
endef

# Dependencies are of the form categorydir/packagedir
# LIBDEPS are for libraries, and DEPENDS are for everything else
LIBDEPS = bootstrap/UFconfig
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

post-extract:
	@echo " ===> moving UFconfig files to $(WORKSRC)"
	#@mv bootstrap/UFconfig/$(EXTRACTDIR)/*.f $(WORKSRC)
	@echo 'mv bootstrap/UFconfig/$(EXTRACTDIR)/*.f $(WORKSRC)'
	#@$(MAKECOOKIE)

#build-custom:
#	# build objects
#	@cd $(WORKSRC) && $(F77) $(BLAS_F77_OPTS) *.f
#	# build static lib from it
#	cd $(WORKSRC) && $(AR) -r $(BLASNAME) *.o && $(RANLIB) $(BLASNAME)
#	@$(MAKECOOKIE)
#
#install-custom:
#	echo "install -c $(DISTNAME)/$(BLASNAME) $(libdir)"
#	@cd $(WORKSRC) && install -c $(BLASNAME) $(libdir)
