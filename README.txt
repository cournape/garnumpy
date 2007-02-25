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
    
    will install numpy, scipy and all the dependencies (by default, it will
    build fftw3, and NETLIB BLAS/LAPACK), if you have a "standard" GNU userland.
    Then, in a shell:
        
        source startgarnumpy.sh

    will set the necessary env variables to use scipy in the current shell.

    Longer story: 

    before the above, you should:
        - set main_prefix and GARCHIVEROOT in gar.conf.mk to some values
        - make garchive will download all the sources in one step (useful if
          you plan on trying different build options)
        - if you change main_prefix, you should change accordingly startgarnumpy.sh

    Other variable to adjust in gar.conf.mk:
        - CC, F77 and CXX: C, Fortran and C++ compilers
        - BLASLAPACK: set to the wanted BLAS/LAPACK set. By default, netlib,
          but atlas (for using ATLAS BLAS/LAPACK) and system (using already
          installed BLAS/LAPACK) are also supported.
        - SCIPYSANDPKG: a list of packages in scipy sandbox to install
        - TESTNELIB: set to 1 to test the compiled NETLIB LAPACK library
        - SOURCEFORGEDL: set to a proper sourceforge mirror (redirection
          often fail).

Supported softwares:
    - numpy and scipy (in platform)
    - ipython (in tools)
    - matplolib (in gui)

Dependencises:
    UBUNTU (6.10):
        You can build a fully functional scipy + matplotlib by installing the following:

        sudo apt-get install python python-dev gcc g77 python-gtk2-dev
