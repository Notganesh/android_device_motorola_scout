#
# Copyright (C) 2025 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xxhdpi

# Project ID Quota
$(call inherit-product, $(SRC_TARGET_DIR)/product/emulated_storage.mk)

# A/B
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota/launch_with_vendor_ramdisk.mk)
AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/otapreopt_script \
    FILESYSTEM_TYPE_system=erofs \
    POSTINSTALL_OPTIONAL_system=true

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_vendor=true \
    POSTINSTALL_PATH_vendor=bin/checkpoint_gc \
    FILESYSTEM_TYPE_vendor=erofs \
    POSTINSTALL_OPTIONAL_vendor=true

PRODUCT_PACKAGES += \
    checkpoint_gc \
    otapreopt_script

PRODUCT_PACKAGES += \
    update_engine \
    update_engine_sideload \
    update_verifier

# Audio
PRODUCT_PACKAGES += \
    android.hardware.audio.common-V1-ndk.vendor \
    android.hardware.audio.service \
    android.hardware.audio@7.1-impl \
    android.hardware.audio.effect@7.0-impl \
    audioclient-types-aidl-cpp.vendor \
    audio.bluetooth.default \
    audio.r_submix.default \
    audio_policy.stub \
    audio.usb.default \
    libalsautils \
    libaudio_aidl_conversion_common_ndk.vendor \
    libaudiofoundation.vendor \
    libnbaio_mono \
    libtinycompress \
    libxml2.vendor

PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,$(LOCAL_PATH)/configs/audio/,$(TARGET_COPY_OUT_VENDOR)/etc)

PRODUCT_COPY_FILES += \
    frameworks/av/services/audiopolicy/config/bluetooth_audio_policy_configuration_7_0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/bluetooth_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/r_submix_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/r_submix_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/usb_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/usb_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/default_volume_tables.xml:$(TARGET_COPY_OUT_VENDOR)/etc/default_volume_tables.xml

# Bluetooth
PRODUCT_PACKAGES += \
    android.hardware.bluetooth-V1-ndk.vendor \
    android.hardware.bluetooth.audio-V3-ndk.vendor \
    android.hardware.bluetooth.audio-impl \
    libbluetooth_audio_session \
    android.hardware.bluetooth@1.1.vendor

# Bootcontrol
PRODUCT_PACKAGES += \
    com.android.hardware.boot \
    android.hardware.boot-service.default_recovery

# Camera
PRODUCT_PACKAGES += \
    android.frameworks.displayservice@1.0.vendor \
    android.hardware.camera.common-V1-ndk.vendor \
    android.hardware.camera.common-V2-ndk.vendor \
    android.hardware.camera.device-V2-ndk.vendor \
    android.hardware.camera.device@1.0.vendor \
    android.hardware.camera.device@3.6.vendor \
    android.hardware.camera.metadata-V2-ndk.vendor \
    android.hardware.camera.provider-V2-ndk.vendor \
    android.hardware.camera.provider@2.6.vendor

# Display
PRODUCT_PACKAGES += \
    android.hardware.graphics.allocator-V1-ndk.vendor \
    android.hardware.graphics.common-V3-ndk.vendor \
    android.hardware.graphics.common-V4-ndk.vendor \
    android.hardware.graphics.composer3-V2-ndk.vendor \
    android.hardware.memtrack-service.mediatek-mali \
    libprocessgroup.vendor \
    libhwc2on1adapter \
    libhwc2onfbadapter \
    libdrm.vendor

# Rootdir
PRODUCT_PACKAGES += \
    fstab.mt6878

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)

# Inherit the proprietary files
$(call inherit-product, vendor/motorola/scout/scout-vendor.mk)
