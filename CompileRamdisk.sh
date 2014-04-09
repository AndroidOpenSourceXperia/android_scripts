#Compile

if [[ $# = 1 ]]; then
  . build/envsetup.sh
  if [[ $? = 0 ]]; then
    # Use local Java Development Kit 6
    if (( $(java -version 2>&1 | grep version | cut -f2 -d".") > 6 )); then
       echo "Using local JDK 6..."
       export JAVA_HOME=$(realpath ../jdk1.6.0_45);
    fi
    case $1 in
    -u)
      lunch full_kumquat-eng && make bootimage;
    ;;
    -p)
      lunch full_nypon-eng && make bootimage;
    ;;
    -s)
      lunch full_pepper-eng && make bootimage;
    ;;
    -g)
      lunch full_lotus-eng && make bootimage;
    ;;
    *)
      echo "ERROR: Unknow option";
      exit -1;
    ;;
    esac
  else 
    echo "ERROR: . build/envsetup.sh falied"
    exit -1;
  fi
else
  echo "ERROR: Number of options not correct. Usage: ./CompileRamdisk.sh -u | -p | -s | -g"
  exit -1;
fi
