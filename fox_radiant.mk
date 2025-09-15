#
# Copyright (C) 2024-2025 The Android Open Source Project
# Copyright (C) 2024-2025 SebaUbuntu's TWRP device tree generator
# Copyright (C) 2024-2025 Orangefox Recovery Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/base.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/emulated_storage.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/gsi_keys.mk)

# Inherit from our custom product configuration
$(call inherit-product, vendor/twrp/config/common.mk)

# Inherit from radiant device
$(call inherit-product, device/infinix/radiant/device.mk)

# Device identifier. This must come after all inclusions
PRODUCT_DEVICE := radiant
PRODUCT_NAME := fox_radiant
PRODUCT_BRAND := Infinix
PRODUCT_MODEL := Infinix Radiant
PRODUCT_MANUFACTURER := INFINIX MOBILITY LIMITED

PRODUCT_GMS_CLIENTID_BASE := android-transsion