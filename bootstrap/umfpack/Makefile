GARNAME = UMFPACK
GARVERSION = 5.0.3
CATEGORIES = bootstrap

MASTER_SITES = http://www.cise.ufl.edu/research/sparse/umfpack/

DISTFILES = $(GARNAME)-$(GARVERSION).tar.gz
PATCHFILES = 
MAINTAINER = David Cournapeau <david@ar.media.kyoto-u.ac.jp>
# GPL, GPL2, BSD, MIT, etc. Or add the URL to any custom license
LICENSE = 

DESCRIPTION = 
define BLURB
	TODO: UMFPACK blurb
endef

# Dependencies are of the form categorydir/packagedir
# LIBDEPS are for libraries, and DEPENDS are for everything else
LIBDEPS = bootstrap/AMD
DEPENDS =
# Builddeps are installed in the build DESTIMG
BUILDDEPS =

BUILD_SCRIPTS = custom
INSTALL_SCRIPTS = custom

CONFIGURE_ARGS = $(DIRPATHS)
NODIRPATHS = 

# If some dirs are trying to install into /, list their names
# here, such as: prefix bindir mandir
INSTALL_OVERRIDE_DIRS = 

# This should go before any hand-made rules.
include ../../gar.mk

# This is ugly: umfpack archive extract its files in the same directory instead of 
# creating one. This does not work with gar, and I don't manage to change the
# extract script, so instead, this post rule move everything from the EXTRACTDIR
# to the WORKSRC
post-extract:
	@echo " ===> moving UMFPACK files to $(WORKSRC)"
	@mv $(EXTRACTDIR)/UMFPACK $(WORKSRC)
	@$(MAKECOOKIE)

pre-configure:
	@echo " ===> copying UFconfig dir to $(EXTRACTDIR)"
	@cp -r $(GARDIR)/bootstrap/UFconfig/$(EXTRACTDIR)/UFconfig $(EXTRACTDIR)
	@echo " ===> copying AMD dir to $(EXTRACTDIR)"
	@cp -r $(GARDIR)/bootstrap/AMD/$(EXTRACTDIR)/AMD $(EXTRACTDIR)
	@$(MAKECOOKIE)

build-custom:
	@cd $(WORKSRC) && $(MAKE) LIB="$(LDFLAGS)" CC=$(CC) AR="$(AR) rc" RANLIB=$(RANLIB) \
		F77=$(F77) F77FLAGS="$(AMD_F77FLAGS)" BLAS="$(BLAS_F77_LINK) -l$(C_FORTRAN_LIB)" library
	@cd $(WORKSRC) && $(MAKE) LIB="$(LDFLAGS) -l$(C_FORTRAN_LIB)" CC=$(CC) AR="$(AR) rc" RANLIB=$(RANLIB) \
		F77=$(F77) F77FLAGS="$(AMD_F77FLAGS)" BLAS="$(BLAS_F77_LINK) " fortran
	@$(MAKECOOKIE)

install-custom:
	@install -c $(WORKSRC)/Lib/libumfpack.a $(libdir)
	@install -c $(WORKSRC)/Lib/libumfpack.def $(libdir)
	@install -c $(WORKSRC)/Include/*.h $(UMFPACK_INCDIR)
