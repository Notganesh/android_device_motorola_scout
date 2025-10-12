# ROM source patches

color="\033[0;32m"
end="\033[0m"

echo -e "${color}Applying patches${end}"
sleep 1

# camera
git clone https://gitea.com/Notganesh/android_device_motorola_scout-camera.git vendor/motorola/scout-motcamera

# Kernel
git clone https://github.com/Notganesh/device_motorola_scout-kernel.git device/motorola/scout-kernel

# Hardware
git clone https://github.com/Moto-MT6879-Dev/hardware_mediatek.git hardware/mediatek

# Motorola
git clone https://github.com/Moto-MT6879-Dev/hardware_motorola.git hardware/motorola

# ims
git clone https://github.com/techyminati/android_vendor_mediatek_ims vendor/mediatek/ims

# Sepolicy
git clone https://github.com/Notganesh/device_mediatek_sepolicy_vndr.git device/mediatek/sepolicy_vndr

# Vendor
git clone https://gitea.com/Notganesh/android_vendor_motorola_scout.git vendor/motorola/scout
