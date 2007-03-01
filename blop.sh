get_blas_lapack()
{
    #BUILD_BLASLAPACK=0
    BUILD_NETLIB=0
    BUILD_ATLAS=0
    case $1 in
        "system")
            echo "Use system wide blas/lapack"
            BUILD_BLASLAPACK=0
            return 0
            ;;
        "atlas")
            echo "Atlas set"
            #BUILD_BLASLAPACK=1
            BUILD_ATLAS=1
            return 0
            ;;
        "netlib")
            echo "netlib"
            BUILD_NETLIB=1
            return 0
            ;;
        *)
            echo "Unknown custom blas lapack: $1"
            return 1
            ;;
    esac 
}

get_numpy_dep()
{
    case $1 in
        "system")
            echo ""
            return 0
            ;;
        "atlas")
            echo "bootstrap/ATLAS"
            return 0
            ;;
        "netlib")
            echo "bootstrap/blas bootstrap/lapack"
            return 0
            ;;
        *)
            return 1
            ;;
    esac 
}

# arg1: BLASLAPACK
get_umfpack_dep()
{
    case $1 in
        "system")
            echo ""
            return 0
            ;;
        "atlas")
            echo "bootstrap/ATLAS"
            return 0
            ;;
        "netlib")
            echo "bootstrap/blas bootstrap/lapack"
            return 0
            ;;
        *)
            return 1
            ;;
    esac 
}

# arg1: BLASLAPACK (possible values: system, etc... see gar.conf.mk)
# arg2: BLAS_DIR
# arg3: BLAS_NAME
# arg4: LAPACK_DIR
# arg5: LAPACK_NAME
# arg6: FFT (possible values: fftw3, etc... see gar.conf.mk)
# arg7: FFT_LIB_DIR 
# arg8: UMFPACK_DIR
# arg9: UMFPACK_INCDIR
# arg10: AMD_DIR
get_numpy_sitecfg()
{
    case $1 in
        "system")
            echo "[blas]"
            echo "library_dirs=$2"
            echo "libraries=$3"
            echo "[lapack]"
            echo "library_dirs=$4"
            echo "libraries=$5"
            ;;
        "atlas")
            # Fake default to force our values
            echo "[DEFAULT]\\nlibrary_dirs = /fooblou"
            echo "[atlas]"
            echo "library_dirs=$2"
            ;;
        "netlib")
            # Fake default to force our values
            echo "[DEFAULT]\\nlibrary_dirs = /fooblou"
            echo "[blas]"
            echo "library_dirs=$2"
            echo "libraries=$3"
            echo "[lapack]"
            echo "library_dirs=$4"
            echo "libraries=$5"
            ;;
        *)
            echo "Unknown custom blas lapack: $1"
            return 1
            ;;
    esac 

    case $6 in
        "fftw3")
            echo "[fftw3]"
            echo "library_dirs=$7"
            ;;
        "system")
            echo "[fftw3]"
            ;;
        *)
            echo "Unknown fft: $6"
            return  1
            ;;
    esac

    echo "[umfpack]"
    echo "library_dirs=$8"
    echo "include_dirs=$9"
    echo "[amd]"
    echo "library_dirs=$10"

    return 0
}

# First arg: fft3, etc...
get_scipy_dep()
{
    case $1 in
        "fftw3")
            echo "bootstrap/fftw3"
            return 0
            ;;
        "system")
            return 0
            ;;
        *)
            return 1
            ;;
    esac 
}

