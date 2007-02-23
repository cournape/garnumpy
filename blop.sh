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

# arg1: BLASLAPACK (possible values: system, etc... see gar.conf.mk)
# arg1: BLASLAPACK (possible values: system, etc... see gar.conf.mk)
get_numpy_sitecfg()
{
    case $1 in
        "system")
            echo "[blas]"
            echo "library_dirs=$SYSTEM_BLAS_DIR"
            echo "libraries=$SYSTEM_BLAS_NAME"
            echo "[lapack]"
            echo "library_dirs=$SYSTEM_LAPACK_DIR"
            echo "libraries=$SYSTEM_LAPACK_NAME"
            return 0
            ;;
        "atlas")
            # Fake default to force our values
            echo "[DEFAULT]\\nlibrary_dirs = /fooblou"
            echo "[atlas]"
            echo "library_dirs=$ATLASLIBDIR"
            return 0
            ;;
        "netlib")
            # Fake default to force our values
            echo "[DEFAULT]\\nlibrary_dirs = /fooblou"
            echo "[blas]"
            echo "library_dirs=$NETLIB_BLAS_DIR"
            echo "libraries=$NETLIB_BLAS_NAME"
            echo "[lapack]"
            echo "library_dirs=$NETLIB_LAPACK_DIR"
            echo "libraries=$NETLIB_LAPACK_NAME"
            return 0
            ;;
        *)
            echo "Unknown custom blas lapack: $1"
            return 1
            ;;
    esac 
}
