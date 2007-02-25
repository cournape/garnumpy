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


#CONFIGURE_SCRIPTS = custom
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
	@echo " ===> copying AMD files to $(WORKSRC)"
	@cp -r $(EXTRACTDIR)/AMD $(WORKSRC)
	#@ln -sf $(PWD)/$(WORKSRC) $(EXTRACTDIR)/AMD 
	@$(MAKECOOKIE)

pre-configure:
	@echo " ===> copying UFconfig to $(EXTRACTDIR)"
	@cp -r $(GARDIR)/bootstrap/UFconfig/$(EXTRACTDIR)/UFconfig $(EXTRACTDIR)
	@$(MAKECOOKIE)

build-custom:
	@cd $(WORKSRC) && $(MAKE) CC=$(CC) AR="$(AR) rc" RANLIB=$(RANLIB) F77=$(F77) F77FLAGS="$(AMD_F77FLAGS)" library
	@cd $(WORKSRC) && $(MAKE) CC=$(CC) AR="$(AR) rc" RANLIB=$(RANLIB) F77=$(F77) F77FLAGS="$(AMD_F77FLAGS)" fortran
	@$(MAKECOOKIE)

install-custom:
	@install -c $(WORKSRC)/Lib/libamd.a $(libdir)
	@install -c $(WORKSRC)/Lib/libamdf77.a $(libdir)
	@install -c $(WORKSRC)/Lib/libamd.def $(libdir)
	@install -c $(WORKSRC)/Include/amd.h $(UMFPACK_INCDIR)
