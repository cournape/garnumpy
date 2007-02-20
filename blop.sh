# If blas/lapack already exists, set also BLAS and LAPACK
USE_SYSTEM_BLASLAPACK=1
# For example, if you have blas as /usr/lib/libblas.a and lapack as
# /usr/lib/lapack as /usr/lib/liblapack.a
SYSTEM_BLAS_NAME='blas'
SYSTEM_BLAS_DIR='/usr/lib'
SYSTEM_LAPACK_NAME='lapack'
SYSTEM_LAPACK_DIR='/usr/lib'

# Custom blas/lapack:
#   - netlib -> netlib version
#   - atlas -> atlas version (needs lapack/blas, actually)
CUSTOM_BLASLAPACK="system"

# arg 1: BLASLAPACK: atlas, system or netlib
BLASLAPACK=system
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

get_blas_lapack $BLASLAPACK
if [ $? -eq 1 ]; then
    echo "Error while getting blas/lapack info, exciting..."
    exit 1;
fi
