android_scripts
===============

Helpful scripts for build Android Open Source Project

QuickStart:

    git clone https://github.com/AndroidOpenSourceXperia/android_scripts.git -b kitkat aosx;
    cd aosx;
    ./repo init -u https://android.googlesource.com/platform/manifest -b android-4.4.4_r2.0.1;
    ./Update.sh;
    ./CompileROM.sh -u; (Xperia U)
    ./CompileROM.sh -p; (Xperia P)   
    ./CompileROM.sh -s; (Xperia Sola)
    ./CompileROM.sh -g; (Xperia Go) 
    
Credits:
    
    @munjeni: Kernel, porting Android Kitkat to Xperia 2012 devices and bugfix
    @95A31: Development on Xperia 2012 novathor devices and lots of bugfix
    @DevSwift: Develop on Xperia 2012 devices and bugfix
    @percy-g2: Support and bugfix
    @Andrewas: Stable repository mantainer and support
