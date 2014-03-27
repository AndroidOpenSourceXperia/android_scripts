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

# Support for Make 4.0
cd build; git cherry-pick -m 1 7a77261988354b13996e5ba84b87351b571a5a52; cd $rootDir;

# Java 7 compilation
cd build; git cherry-pick ad6909913145ba3daeb037f0170b95f855f7d08f; cd $rootDir;
cd libcore; git cherry-pick a9a297845620cfe56bbe3b9f8de1331b7ec54574; cd $rootDir;

52

#Recompile
./Recompile.sh $1
