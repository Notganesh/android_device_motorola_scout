#
# Copyright (C) The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/motorola/scout

# A/B
AB_OTA_UPDATER := true
AB_OTA_PARTITIONS := \
    boot \
    init_boot \
    system \
    system_dlkm \
    system_ext \
    product \
    vendor \
    vendor_dlkm \
    vendor_boot \
    vbmeta \
    vbmeta_system

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-2a-dotprod
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := cortex-a76

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv8-2a
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := cortex-a55

# Force any prefer32 targets to be compiled as 64 bit.
IGNORE_PREFER32_ON_DEVICE := true

# Include 64-bit drmserver to support 64-bit only devices
TARGET_DYNAMIC_64_32_DRMSERVER := true

# Include 64-bit mediaserver to support 64-bit only devices
TARGET_DYNAMIC_64_32_MEDIASERVER := true

# Enable 64-bit for non-zygote.
ZYGOTE_FORCE_64 := true

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := scout
TARGET_NO_BOOTLOADER := true

# Build
BUILD_BROKEN_DUP_RULES := true
BUILD_BROKEN_ELF_PREBUILT_PRODUCT_COPY_FILES := true

# Display
TARGET_SCREEN_DENSITY := 450

# HIDL
DEVICE_MANIFEST_FILE += \
    $(DEVICE_PATH)/configs/hidl/manifest.xml
DEVICE_MATRIX_FILE += $(DEVICE_PATH)/configs/hidl/compatibility_matrix.xml
DEVICE_FRAMEWORK_COMPATIBILITY_MATRIX_FILE += \
    vendor/lineage/config/device_framework_matrix.xml \
    hardware/mediatek/vintf/mediatek_framework_compatibility_matrix.xml \
    $(DEVICE_PATH)/configs/hidl/framework_compatibility_matrix.xml

# Fastboot
TARGET_BOARD_FASTBOOT_INFO_FILE := $(DEVICE_PATH)/fastboot-info.txt

# Filesystem
TARGET_FS_CONFIG_GEN := $(DEVICE_PATH)/configs/mot_aids.fs

# Kernel
BOARD_KERNEL_BASE := 0x3fff8000
BOARD_KERNEL_OFFSET := 0x00008000
BOARD_KERNEL_PAGESIZE := 0x00001000
BOARD_TAGS_OFFSET := 0x07c88000
BOARD_RAMDISK_OFFSET := 0x26f08000
BOARD_BOOT_HEADER_VERSION := 4
BOARD_INIT_BOOT_HEADER_VERSION := 4

BOARD_RAMDISK_USE_LZ4 := true
BOARD_INCLUDE_DTB_IN_BOOTIMG := true
BOARD_USES_GENERIC_KERNEL_IMAGE := true
BOARD_KERNEL_IMAGE_NAME := Image.gz

BOARD_KERNEL_CMDLINE := bootopt=64S3,32N2,64N2

TARGET_FORCE_PREBUILT_KERNEL := true
BOARD_PREBUILT_DTBIMAGE_DIR := $(DEVICE_PATH)-kernel/dtb
PRODUCT_COPY_FILES += \
	$(DEVICE_PATH)-kernel/Image.gz:kernel

BOARD_SYSTEM_KERNEL_MODULES := $(wildcard $(DEVICE_PATH)-kernel/system/*.ko)
BOARD_SYSTEM_KERNEL_MODULES_LOAD := $(strip $(shell cat $(DEVICE_PATH)-kernel/modules.load.system))
BOARD_VENDOR_KERNEL_MODULES := $(wildcard $(DEVICE_PATH)-kernel/vendor/*.ko)
BOARD_VENDOR_KERNEL_MODULES_LOAD := $(strip $(shell cat $(DEVICE_PATH)-kernel/modules.load.vendor))
BOARD_VENDOR_RAMDISK_KERNEL_MODULES := $(wildcard $(DEVICE_PATH)-kernel/vendor_ramdisk/*.ko)
BOARD_VENDOR_RAMDISK_KERNEL_MODULES_LOAD := $(strip $(shell cat $(DEVICE_PATH)-kernel/modules.load.vendor_ramdisk))
BOARD_VENDOR_RAMDISK_RECOVERY_KERNEL_MODULES_LOAD := $(strip $(shell cat $(DEVICE_PATH)-kernel/modules.load.recovery))
BOOT_KERNEL_MODULES := $(BOARD_VENDOR_RAMDISK_RECOVERY_KERNEL_MODULES_LOAD) $(BOARD_VENDOR_RAMDISK_KERNEL_MODULES_LOAD)

BOARD_MKBOOTIMG_ARGS += \
    --dtb_offset $(BOARD_TAGS_OFFSET) \
    --header_version $(BOARD_BOOT_HEADER_VERSION) \
    --kernel_offset $(BOARD_KERNEL_OFFSET) \
    --ramdisk_offset $(BOARD_RAMDISK_OFFSET) \
    --tags_offset $(BOARD_TAGS_OFFSET)

BOARD_MKBOOTIMG_INIT_ARGS += \
    --header_version $(BOARD_INIT_BOOT_HEADER_VERSION)

TARGET_NO_KERNEL_OVERRIDE := true
TARGET_KERNEL_SOURCE := $(DEVICE_PATH)-kernel/headers/

# Recovery
TARGET_RECOVERY_UI_MARGIN_HEIGHT := 165
BOARD_INCLUDE_RECOVERY_RAMDISK_IN_VENDOR_BOOT := true
BOARD_MOVE_RECOVERY_RESOURCES_TO_VENDOR_BOOT := true
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/init/fstab.mt6878
TARGET_RECOVERY_PIXEL_FORMAT := BGRA_8888
TARGET_USERIMAGES_USE_F2FS := true

# Partitions
-include vendor/lineage/config/BoardConfigReservedSize.mk
BOARD_FLASH_BLOCK_SIZE := 262144 # (BOARD_KERNEL_PAGESIZE * 64)
BOARD_EROFS_PCLUSTER_SIZE := 262144
BOARD_BOOTIMAGE_PARTITION_SIZE := 67108864
BOARD_INIT_BOOT_IMAGE_PARTITION_SIZE := 8388608
BOARD_VENDOR_BOOTIMAGE_PARTITION_SIZE := 67108864
BOARD_SUPER_PARTITION_SIZE := 19327352832
BOARD_SUPER_PARTITION_GROUPS := motorola_dynamic_partitions
BOARD_MOTOROLA_DYNAMIC_PARTITIONS_PARTITION_LIST := system system_dlkm system_ext vendor vendor_dlkm product
BOARD_MOTOROLA_DYNAMIC_PARTITIONS_SIZE := 19125356832

BOARD_SYSTEMIMAGE_FILE_SYSTEM_TYPE := erofs
BOARD_SYSTEM_DLKMIMAGE_FILE_SYSTEM_TYPE := erofs
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := erofs
BOARD_VENDOR_DLKMIMAGE_FILE_SYSTEM_TYPE := erofs
BOARD_PRODUCTIMAGE_FILE_SYSTEM_TYPE := erofs
BOARD_SYSTEM_EXTIMAGE_FILE_SYSTEM_TYPE := erofs

TARGET_COPY_OUT_ODM := vendor/odm
TARGET_COPY_OUT_SYSTEM_DLKM := system_dlkm
TARGET_COPY_OUT_SYSTEM_EXT := system_ext
TARGET_COPY_OUT_PRODUCT := product
TARGET_COPY_OUT_VENDOR := vendor
TARGET_COPY_OUT_VENDOR_DLKM := vendor_dlkm

BOARD_USES_METADATA_PARTITION := true

# Properties
TARGET_VENDOR_PROP += $(DEVICE_PATH)/props/vendor.prop
TARGET_SYSTEM_PROP += $(DEVICE_PATH)/props/system.prop
TARGET_PRODUCT_PROP += $(DEVICE_PATH)/props/product.prop

# RIL
ENABLE_VENDOR_RIL_SERVICE := true

# Security patch level
BOOT_SECURITY_PATCH := 2025-08-01
VENDOR_SECURITY_PATCH := $(BOOT_SECURITY_PATCH)

# Sepolicy
include device/mediatek/sepolicy_vndr/SEPolicy.mk
include device/lineage/sepolicy/libperfmgr/sepolicy.mk
BOARD_VENDOR_SEPOLICY_DIRS += $(DEVICE_PATH)/sepolicy/vendor
SYSTEM_EXT_PRIVATE_SEPOLICY_DIRS += $(DEVICE_PATH)/sepolicy/private
SYSTEM_EXT_PUBLIC_SEPOLICY_DIRS += $(DEVICE_PATH)/sepolicy/public
SELINUX_IGNORE_NEVERALLOWS := true

# SKU
ODM_MANIFEST_SKUS += dn dns dnsf dsds n ns qsqs ss tsts
ODM_MANIFEST_DN_FILES := $(DEVICE_PATH)/configs/sku/manifest_dn.xml
ODM_MANIFEST_DNS_FILES := $(DEVICE_PATH)/configs/sku/manifest_dns.xml
ODM_MANIFEST_DNSF_FILES := $(DEVICE_PATH)/configs/sku/manifest_dnsf.xml
ODM_MANIFEST_DSDS_FILES := $(DEVICE_PATH)/configs/sku/manifest_dsds.xml
ODM_MANIFEST_N_FILES := $(DEVICE_PATH)/configs/sku/manifest_n.xml
ODM_MANIFEST_NS_FILES := $(DEVICE_PATH)/configs/sku/manifest_ns.xml
ODM_MANIFEST_QSQS_FILES := $(DEVICE_PATH)/configs/sku/manifest_qsqs.xml
ODM_MANIFEST_SS_FILES := $(DEVICE_PATH)/configs/sku/manifest_ss.xml
ODM_MANIFEST_TSTS_FILES := $(DEVICE_PATH)/configs/sku/manifest_tsts.xml

# Verified Boot
BOARD_AVB_ENABLE := true
BOARD_AVB_ALGORITHM := SHA256_RSA2048
BOARD_AVB_KEY_PATH := external/avb/test/data/testkey_rsa2048.pem
BOARD_AVB_MAKE_VBMETA_IMAGE_ARGS += --set_hashtree_disabled_flag
BOARD_AVB_ROLLBACK_INDEX := 18

BOARD_AVB_VBMETA_SYSTEM := system product system_ext
BOARD_AVB_VBMETA_SYSTEM_ALGORITHM := $(BOARD_AVB_ALGORITHM)
BOARD_AVB_VBMETA_SYSTEM_KEY_PATH := $(BOARD_AVB_KEY_PATH)
BOARD_AVB_VBMETA_SYSTEM_ROLLBACK_INDEX := 18
BOARD_AVB_VBMETA_SYSTEM_ROLLBACK_INDEX_LOCATION := 2

# Wifi
WPA_SUPPLICANT_VERSION := VER_0_8_X
BOARD_HOSTAPD_DRIVER := NL80211
WIFI_FEATURE_HOSTAPD_11AX := true
WIFI_FEATURE_SUPPLICANT_11AX := true
WIFI_DRIVER_FW_PATH_PARAM := "/dev/wmtWifi"
WIFI_DRIVER_FW_PATH_STA := "STA"
WIFI_DRIVER_FW_PATH_AP := "AP"
WIFI_DRIVER_FW_PATH_P2P := "P2P"
WIFI_DRIVER_STATE_CTRL_PARAM := "/dev/wmtWifi"
WIFI_DRIVER_STATE_ON := "1"
WIFI_DRIVER_STATE_OFF := "0"
WIFI_HAL_INTERFACE_COMBINATIONS := {{{STA}, 2}}
WIFI_HAL_INTERFACE_COMBINATIONS += ,{{{AP}, 2},}
WIFI_HAL_INTERFACE_COMBINATIONS += ,{{{STA}, 1}, {{AP}, 1}}
WIFI_HAL_INTERFACE_COMBINATIONS += ,{{{STA}, 1}, {{P2P}, 1}}
WIFI_HAL_INTERFACE_COMBINATIONS += ,{{{STA}, 1}, {{NAN}, 1}}
WIFI_HIDL_UNIFIED_SUPPLICANT_SERVICE_RC_ENTRY := true

# Inherit the proprietary files
include vendor/motorola/scout/BoardConfigVendor.mk
