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

# arg1 : BLASLAPACK option (system, atlas, etc...)
# arg2 : libdir var from gar
get_blas_location()
{
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
