#Compile

if [[ $# = 1 ]]; then
  . build/envsetup.sh
  if [[ $? = 0 ]]; then
    # Use local Java Development Kit 6
    if (( $(java -version 2>&1 | grep version | cut -f2 -d".") > 6 )); then
       export JAVA_HOME=$(realpath ../jdk1.6.0_45/bin/);
    fi
    
    case $1 in
    -u)
      lunch full_kumquat-userdebug && make otapackage -j12;
    ;;
    -p)
      lunch full_nypon-userdebug && make otapackage -j12;
    ;;
    -s)
      lunch full_pepper-userdebug && make otapackage -j12;
    ;;
    -g)
      lunch full_lotus-userdebug && make otapackage -j12;
    ;;
    *)
      echo "ERROR: Unknow option";
      exit 1;
    ;;
    esac
  else 
    echo "ERROR: . build/envsetup.sh falied"
    exit 1;
  fi
else
  echo "ERROR: Number of options not correct. Usage: ./Recompile.sh -u | -p | -s | -g"
  exit 1;
fi
