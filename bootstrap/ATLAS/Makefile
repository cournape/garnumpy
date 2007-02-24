GARNAME = atlas
GARVERSION = 3.7.28
CATEGORIES = 

MASTER_SITES += $(SOURCEFORGEDL)/math-atlas/

DISTFILES = $(GARNAME)$(GARVERSION).tar.bz2
PATCHFILES = garnumpy-config.diff gar-ppc-fix.diff
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
	@cp $(FILEDIR)/P432SSE2.tgz $(WORKSRC)/CONFIG/ARCHS/
	@$(MAKECOOKIE)

configure-custom:
	@echo "======================================="
	@echo "		CONFIGURING ATLAS"
	@echo "======================================="
	@cd $(WORKSRC)/$(ATLOBJDIR) && ../configure -Si archdef 1\
		--with-netlib-lapack=$(libdir)/$(NETLIB_LAPACK_FULL_NAME) \
		--prefix=$(ATLASPREFIX) \
		-C if $(F77)
	@echo "======================================="
	@echo "		CONFIGURING ATLAS DONE	"
	@echo "======================================="
	@$(MAKECOOKIE)

build-custom:
	@cd $(WORKSRC)/$(ATLOBJDIR) && make build
	@$(MAKECOOKIE)

install-custom:
	@cd $(WORKSRC)/$(ATLOBJDIR) && make install
	@$(MAKECOOKIE)
