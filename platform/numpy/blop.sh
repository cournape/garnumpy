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
            echo "bootstrap/atlas"
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

#get_blas_lapack $BLASLAPACK
#if [ $? -eq 1 ]; then
#    echo "Error while getting blas/lapack info, exciting..."
#    exit 1;
#fi
