What is garnumpy ?

    Garnumpy is a system derived from the GAR system by Nick Moffitt to build
    a self contained scipy environment. It supports optional compilation of most scipy
    dependencies, including fftw3, ATLAS or NETLIB Blas and Lapack, UMFPACK.

What for ?

    If you want to install a scipy environment, with special libraries, or libraries
    not packaged on your OS (full lapack using ATLAS, etc...).

    If you want a self contained directory where everything is installed, for easy
    removing later (everything in in one directory)

    As it installs everything in a special directory, you can use garnumpy without special
    rights (eg non root), and without the risk of destroying anything on your system.

How to use ?

    Short story:
        
        cd platform/scipy; make install
        source startgarnumpy.sh

    
    will install numpy, scipy and all the dependencies (by default, it will
    build NETLIB BLAS/LAPACK), if you have a "standard" GNU userland, and set up
    your shell to use the garnumpy-installed packages by default.
        
    Longer story: 

    before the above, you should:
	- set main_prefix and GARCHIVEROOT in garnumpy.conf.mk to some values
        - make garchive will download all the sources in one step (useful if
	  you plan on trying different build options) and put them in
	  GARCHIVEROOT
        - if you change main_prefix, you should change accordingly startgarnumpy.sh

    Other variable to adjust in garnumpy.conf.mk:
        - BLASLAPACK: set to the wanted BLAS/LAPACK set. By default, netlib,
          but atlas (for using ATLAS BLAS/LAPACK) and system (using already
          installed BLAS/LAPACK) are also supported.
        - SCIPYSANDPKG: a list of packages in scipy sandbox to install
        - TESTNETLIB: set to 1 to test the compiled NETLIB LAPACK library
        - SOURCEFORGEDL: set to a proper sourceforge mirror (redirection
          often fail).

    Variable to adjust in gar.cc.mk (everything related to the build tools, 
    mostly compiler, compiler options and link options should be set here)
        - CC, F77 and CXX: C, Fortran and C++ compilers

    You can use the two following working templates:
    	- gar.cc.mk.g77: GNU build system with g77 for F77 code.
    	- gar.cc.mk.gfortran: GNU build system with gfortran for all Fortran code.

Supported softwares:
    - numpy and scipy (in platform)
    - ipython (in tools)
    - matplolib (in gui)

Dependencises:
    UBUNTU (up to 7.10):
        You can build a fully functional scipy + matplotlib by installing the following:

        sudo apt-get install python python-dev gcc g77 python-gtk2-dev patch swig g++

	You should copy the gar.cc.mk.g77 to gar.cc.mk, to, to force usage of
        g77.

    UBUNTU (8.04 and later):
        You can build a fully functional scipy + matplotlib by installing the following:

        sudo apt-get install python python-dev gcc gfortran python-gtk2-dev patch swig g++

    Fedora Core (6):
        You can build a fully functional numpy + scipy by installing the following:

        sudo yum install python python-devel gcc compat-gcc-34-g77 gcc-c++ swig
