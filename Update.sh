git pull && ./repo sync -cq -j8

# Dhcpd rules needed by Wi-Fi Direct
curl https://raw.githubusercontent.com/CyanogenMod/android_hardware_qcom_wlan/cm-11.0/qcwcn/config/android_dhcpcd.conf > device/sony/montblanc-common/config/dhcpcd.conf

# Missing TI's files in AOSP
curl https://raw.githubusercontent.com/CyanogenMod/android_system_netd/cm-11.0/SoftapControllerTI.cpp > system/netd/SoftapControllerTI.cpp
curl https://raw.githubusercontent.com/CyanogenMod/android_system_netd/cm-11.0/SoftapControllerTI.h > system/netd/SoftapControllerTI.h