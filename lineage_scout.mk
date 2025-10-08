#
# Copyright (C) 2025 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit some common Lineage stuff.
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

# Inherit from scout device
$(call inherit-product, device/motorola/scout/device.mk)

PRODUCT_DEVICE := scout
PRODUCT_NAME := lineage_scout
PRODUCT_BRAND := motorola
PRODUCT_MODEL := motorola edge 60 fusion
PRODUCT_MANUFACTURER := motorola

PRODUCT_GMS_CLIENTID_BASE := android-motorola

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="scout_g_sys-user 15 V2VC35M.33-93-4 b008d release-keys"

BUILD_FINGERPRINT := motorola/scout_g_sys/scout:15/V2VC35M.33-93-4/b008d:user/release-keys
