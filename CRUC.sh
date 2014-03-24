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
fi

./CleanCM.sh && ./ResetCM.sh && ./UpdateCM.sh && ./CompileCM.sh $1
