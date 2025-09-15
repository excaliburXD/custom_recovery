#
# Copyright (C) 2024-2025 The Android Open Source Project
# Copyright (C) 2024-2025 SebaUbuntu's TWRP device tree generator
# Copyright (C) 2024-2025 Orangefox Recovery Project
#
# SPDX-License-Identifier: Apache-2.0
#

LOCAL_PATH := device/infinix/radiant

# VAB
ENABLE_VIRTUAL_AB := true
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota.mk)

# AB
AB_OTA_UPDATER := true
AB_OTA_PARTITIONS += \
    system \
    vendor \
    product \
    system_ext \
    boot \
    lk \
    logo \
    preloader \
    vbmeta \
    vbmeta_vendor \
    vbmeta_system

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/mtk_plpath_utils \
    FILESYSTEM_TYPE_system=ext4 \
    POSTINSTALL_OPTIONAL_system=true

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/otapreopt_script \
    FILESYSTEM_TYPE_system=ext4 \
    POSTINSTALL_OPTIONAL_system=true

# Dynamic Partition
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# VNDK & API
PRODUCT_TARGET_VNDK_VERSION := 30
PRODUCT_SHIPPING_API_LEVEL := 30

# Health Hal
PRODUCT_PACKAGES += \
    android.hardware.health@2.1-impl \
    android.hardware.health@2.1-service

# Boot control HAL
PRODUCT_PACKAGES += \
    android.hardware.boot@1.1-mtkimpl.recovery \
    android.hardware.boot@1.1-mtkimpl

PRODUCT_PACKAGES_DEBUG += \
    bootctrl

# Fastbootd
PRODUCT_PACKAGES += \
    android.hardware.fastboot@1.0-impl-mock \
    fastbootd

# MTK plpath utils
PRODUCT_PACKAGES += \
    mtk_plpath_utils \
    mtk_plpath_utils.recovery

# Gatekeeper 
PRODUCT_PACKAGES += \
    android.hardware.gatekeeper@1.0-service

# Keymaster Beanpod
PRODUCT_PACKAGES += \
    android.hardware.keymaster@4.0-service.beanpod

# TEE Daemon
PRODUCT_PACKAGES += \
    teei_daemon

PRODUCT_PACKAGES += \
    otapreopt_script \
    cppreopts.sh \
    update_engine \
    update_verifier \
    update_engine_sideload

PRODUCT_PACKAGES_DEBUG += \
    update_engine_client

# Additional configs
TW_RECOVERY_ADDITIONAL_RELINK_LIBRARY_FILES += \
    $(TARGET_OUT_SHARED_LIBRARIES)/android.hardware.keymaster@4.0

TARGET_RECOVERY_DEVICE_MODULES += \
    android.hardware.keymaster@4.0