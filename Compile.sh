if [[ $# = 1 ]]; then
  case $1 in
  -u|-p|-s|-g)
  ;;
  *)
    echo "ERROR: Unknow option"
    exit 1;
  ;;
  esac
else 
   echo "ERROR: Number of options not correct. Usage: ./Compile.sh -u | -p | -s | -g"
   exit 1
fi

#Set patches directory
patchDir="hardware/ste/patches"

#Patch
echo Patching...
for d in $(ls $patchDir | grep -v FM);
do
  for f in $(ls $patchDir"/"$d | grep .patch);
  do
    git apply -p1 --verbose --ignore-space-change --ignore-whitespace < $patchDir"/"$d"/"$f
    RETVAL=$?
    if [ $RETVAL -ne 0 ]; then
	  echo "Error $RETVAL with patch $d/$f"
	  exit $RETVAL
    fi
  done
done

# We use CyanogenMod su binary, remove AOSP one in order to avoid conflicts
rm system/extras/su/Android.mk &> /dev/null

# Cherry picks
echo "Cherry picking..."
rootDir=$PWD

# Fix Java 7 compilation
cd libcore; git cherry-pick 9c8864d39704b3d264ef9dfbdc1bfcfd8f1b6bb9; cd $rootDir;

#Recompile
./Recompile.sh $1
