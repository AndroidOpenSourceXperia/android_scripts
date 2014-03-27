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
rootDir=$PWD
patchDir="hardware/ste/patches"

# Cherry picks
echo "Cherry picking..."

while read line                   
do          
   dir=$(echo $line | cut -f1 -d"|");
   gitCmd=$(echo $line | cut -f2 -d"|");
   
   cd $dir;
   git cherry-pick $gitCmd;
   exitValue=$?;
   cd $rootdir;
   
    if [[ ! $? ]]; then
      echo "Error with cherry-pick $gitCmd in $dir";
      exit 1;
    fi
   
done < $patchDir/cherry-picks.list


#Patch
echo "Patching..."
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

#Recompile
./Recompile.sh $1
