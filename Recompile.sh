#Compile

if [[ $# = 1 ]]; then
  . build/envsetup.sh
  if [[ $? = 0 ]]; then
    export EXPERIMENTAL_USE_JAVA7=true
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
      echo "ERROR: Unknow option" && make otapackage -j12;
    ;;
    esac
  else 
    echo "ERROR: . build/envsetup.sh falied"
  fi
else
  echo "ERROR: Number of options not correct. Usage: ./Recompile.sh -u | -p | -s | -g"
fi
