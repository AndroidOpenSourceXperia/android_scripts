android_scripts
===============

Helpful scripts for build Android Open Source Project

QuickStart:

    git clone https://github.com/AndroidOpenSourceXperia/android_scripts.git aosp;
    cd aosp;
    repo init -u https://android.googlesource.com/platform/manifest -b android-4.4.2_r2;
    ./Update.sh;
    ./Compile.sh -u; (Xperia U)
    ./Compile.sh -p; (Xperia P)   
    ./Compile.sh -s; (Xperia Sola)
    ./Compile.sh -g; (Xperia Go) 
    
Credits:
    
    @munjeni: Kernel, porting Android Kitkat to Xperia 2012 devices and bugfix
    @DevSwift: Develop on Xperia 2012 devices and bugfix
    @percy-g2: Support and bugfix
    @Andrewas: Stable repository mantainer and support