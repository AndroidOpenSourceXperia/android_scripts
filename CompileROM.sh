#Compile
if [[ $# = 1 ]]; then
  . build/envsetup.sh
  if [[ $? = 0 ]]; then
    # Download Java 6 if necessary
    if [ $(java -version 2>&1 | grep version | cut -f2 -d".") -gt 6 ] ; then
	if [ ! -d ./jdk1.6.0_45 ]; then
    	    wget --no-check-certificate --no-cookies - --header "Cookie: oraclelicense=accept-securebackup-cookie" "http://download.oracle.com/otn-pub/java/jdk/6u45-b06/jdk-6u45-linux-x64.bin";
            chmod +x jdk-6u45-linux-x64.bin;
            ./jdk-6u45-linux-x64.bin
        fi
      export JAVA_HOME=$(realpath ./jdk1.6.0_45);
    fi
    case $1 in
    -u)
      lunch full_kumquat-eng && make otapackage -j12;
    ;;
    -ru)
      lunch full_kumquat-userdebug && make otapackage -j12;
    ;;
    -p)
      lunch full_nypon-eng && make otapackage -j12;
    ;;
    -rp)
      lunch full_nypon-userdebug && make otapackage -j12;
    ;;
    -s)
      lunch full_pepper-eng && make otapackage -j12;
    ;;
    -rs)
      lunch full_pepper-userdebug && make otapackage -j12;
    ;;
    -g)
      lunch full_lotus-eng && make otapackage -j12;
    ;;
    -rg)
      lunch full_lotus-userdebug && make otapackage -j12;
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
  echo "ERROR: Number of options not correct. Usage: ./CompileROM.sh -u | -p | -s | -g | -ru | -rp | -rs | -rg"
  exit -1;
fi
