#
# Copyright (C) 2018-2021 The LineageOS Project
# Copyright (C) 2021 Pixel Experience
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit some common Pixel Extended stuff
$(call inherit-product, vendor/aosp/config/common_full_phone.mk)

# We are a phone
IS_PHONE := true

# Gapps Architecture
TARGET_GAPPS_ARCH := arm64

# Boot Aniamation Resolution
TARGET_BOOT_ANIMATION_RES := 1080

# Inherit from jasmine_sprout device
$(call inherit-product, $(LOCAL_PATH)/device.mk)

PRODUCT_BRAND := Xiaomi
PRODUCT_DEVICE := jasmine_sprout
PRODUCT_MANUFACTURER := Xiaomi
PRODUCT_MODEL := Mi A2
PRODUCT_NAME := aosp_jasmine_sprout

PRODUCT_GMS_CLIENTID_BASE := android-xiaomi

TARGET_VENDOR_PRODUCT_NAME := jasmine
