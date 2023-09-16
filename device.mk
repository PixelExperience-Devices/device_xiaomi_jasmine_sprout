#
# Copyright (C) 2018-2021 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/xiaomi/jasmine_sprout

# Setup dalvik vm configs
$(call inherit-product, frameworks/native/build/phone-xhdpi-4096-dalvik-heap.mk)

PRODUCT_ENFORCE_RRO_TARGETS := *

# PRODUCT_SHIPPING_API_LEVEL indicates the first api level, device has been commercially launched on.
PRODUCT_SHIPPING_API_LEVEL := 27

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(DEVICE_PATH) \
    hardware/xiaomi

QCOM_SOONG_NAMESPACE := \
    $(DEVICE_PATH)/qcom-caf

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.audio.low_latency.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.audio.low_latency.xml \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.bluetooth_le.xml \
    frameworks/native/data/etc/android.hardware.bluetooth.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.bluetooth.xml \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.camera.full.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.full.xml \
    frameworks/native/data/etc/android.hardware.camera.raw.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.raw.xml \
    frameworks/native/data/etc/android.hardware.fingerprint.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.fingerprint.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.opengles.aep.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.opengles.aep.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.barometer.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.barometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepcounter.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.stepcounter.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepdetector.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.stepdetector.xml \
    frameworks/native/data/etc/android.hardware.telephony.cdma.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.telephony.cdma.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.telephony.ims.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.telephony.ims.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.hardware.vulkan.level-0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.level-0.xml \
    frameworks/native/data/etc/android.hardware.vulkan.version-1_1.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.version-1_1.xml \
    frameworks/native/data/etc/android.hardware.vulkan.compute-0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.compute-0.xml \
    frameworks/native/data/etc/android.software.midi.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.midi.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/android.software.verified_boot.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.verified_boot.xml \
    frameworks/native/data/etc/android.software.vulkan.deqp.level-2020-03-01.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.vulkan.deqp.level.xml \
    frameworks/native/data/etc/android.software.opengles.deqp.level-2020-03-01.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.opengles.deqp.level.xml \
    frameworks/native/data/etc/handheld_core_hardware.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/handheld_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.opengles.aep.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.opengles.aep.xml

# AndroidGO Configs
PRODUCT_USE_PROFILE_FOR_BOOT_IMAGE := true
PRODUCT_DEX_PREOPT_BOOT_IMAGE_PROFILE_LOCATION := frameworks/base/config/boot-image-profile.txt
PRODUCT_SYSTEM_SERVER_COMPILER_FILTER := speed-profile

# A/B
AB_OTA_UPDATER := true

AB_OTA_PARTITIONS += \
    boot \
    system \
    vendor \
    product \
    system_ext \
    odm

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/otapreopt_script \
    FILESYSTEM_TYPE_system=erofs \
    POSTINSTALL_OPTIONAL_system=true

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_product=true \
    POSTINSTALL_PATH_product=bin/check_dynamic_partitions \
    FILESYSTEM_TYPE_product=erofs \
    POSTINSTALL_OPTIONAL_product=false

PRODUCT_PACKAGES += \
    otapreopt_script

# Boot control
PRODUCT_PACKAGES += \
    android.hardware.boot@1.0-impl \
    android.hardware.boot@1.0-impl.recovery \
    android.hardware.boot@1.0-service \
    bootctrl.sdm660 \
    bootctrl.sdm660.recovery

PRODUCT_PACKAGES_DEBUG += \
    bootctl

# Boot SPL
BOOT_SECURITY_PATCH = $(PLATFORM_SECURITY_PATCH)

# Audio
PRODUCT_PACKAGES += \
    android.hardware.audio@7.1-impl \
    android.hardware.audio.service \
    android.hardware.audio.effect@7.0-impl \
    audio_amplifier.sdm660 \
    audio.primary.sdm660 \
    audio.r_submix.default \
    audio.usb.default \
    libaudio-resampler \
    libqcompostprocbundle \
    libqcomvisualizer \
    libqcomvoiceprocessing \
    libssrec \
    libtinycompress \
    libvolumelistener \
    libbatterylistener  \
    libcomprcapture \
    libexthwplugin \
    libspkrprot \
    libstdc++.vendor \
    libtinyalsa

PRODUCT_PACKAGES += \
    android.hardware.bluetooth@1.0.vendor \
    android.hardware.bluetooth.audio-impl \
    audio.bluetooth.default

PRODUCT_PACKAGES += \
    libhdmiedid \
    libhfp \
    libsndmonitor

PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/audio/audio_platform_info_intcodec.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_platform_info_intcodec.xml \
    $(DEVICE_PATH)/audio/audio_effects.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_effects.xml \
    $(DEVICE_PATH)/audio/audio_output_policy.conf:$(TARGET_COPY_OUT_VENDOR)/etc/audio_output_policy.conf \
    $(DEVICE_PATH)/audio/audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_configuration.xml \
    $(DEVICE_PATH)/audio/audio_tuning_mixer.txt:$(TARGET_COPY_OUT_VENDOR)/etc/audio_tuning_mixer.txt \
    $(DEVICE_PATH)/audio/graphite_ipc_platform_info.xml:$(TARGET_COPY_OUT_VENDOR)/etc/graphite_ipc_platform_info.xml \
    $(DEVICE_PATH)/audio/listen_platform_info.xml:$(TARGET_COPY_OUT_VENDOR)/etc/listen_platform_info.xml \
    $(DEVICE_PATH)/audio/mixer_paths.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths.xml \
    $(DEVICE_PATH)/audio/audio_configs.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_configs.xml \
    $(DEVICE_PATH)/audio/audio_effects.conf:$(TARGET_COPY_OUT_VENDOR)/etc/audio_effects.conf \
    $(DEVICE_PATH)/qcom-caf/audio/configs/sdm660/mixer_paths_skush.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths_skush.xml \
    $(DEVICE_PATH)/qcom-caf/audio/configs/sdm660/mixer_paths_i2s.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths_i2s.xml \
    $(DEVICE_PATH)/qcom-caf/audio/configs/sdm660/mixer_paths_tasha.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths_tasha.xml \
    $(DEVICE_PATH)/qcom-caf/audio/configs/sdm660/mixer_paths_mtp.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths_mtp.xml \
    $(DEVICE_PATH)/qcom-caf/audio/configs/sdm660/mixer_paths_tashalite.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths_tashalite.xml \
    $(DEVICE_PATH)/qcom-caf/audio/configs/sdm660/mixer_paths_tavil.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths_tavil.xml \
    $(DEVICE_PATH)/qcom-caf/audio/configs/sdm660/mixer_paths_tasha_skus.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths_tasha_skus.xml \
    $(DEVICE_PATH)/qcom-caf/audio/configs/sdm660/audio_tuning_mixer_tavil.txt:$(TARGET_COPY_OUT_VENDOR)/etc/audio_tuning_mixer_tavil.txt \
    $(DEVICE_PATH)/qcom-caf/audio/configs/sdm660/audio_tuning_mixer_tasha.txt:$(TARGET_COPY_OUT_VENDOR)/etc/audio_tuning_mixer_tasha.txt \
    $(DEVICE_PATH)/qcom-caf/audio/configs/sdm660/audio_platform_info_tasha.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_platform_info_tasha.xml \
    $(DEVICE_PATH)/qcom-caf/audio/configs/sdm660/audio_platform_info_tashalite.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_platform_info_tashalite.xml \
    $(DEVICE_PATH)/qcom-caf/audio/configs/sdm660/audio_platform_info_tavil.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_platform_info_tavil.xml \
    $(DEVICE_PATH)/qcom-caf/audio/configs/sdm660/audio_platform_info_tasha_skus.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_platform_info_tasha_skus.xml \
    $(DEVICE_PATH)/qcom-caf/audio/configs/sdm660/audio_platform_info_skush.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_platform_info_skush.xml

PRODUCT_COPY_FILES += \
    frameworks/av/services/audiopolicy/config/audio_policy_volumes.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_volumes.xml \
    frameworks/av/services/audiopolicy/config/default_volume_tables.xml:$(TARGET_COPY_OUT_VENDOR)/etc/default_volume_tables.xml \
    frameworks/av/services/audiopolicy/config/r_submix_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/r_submix_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/usb_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/usb_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/bluetooth_audio_policy_configuration_7_0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/bluetooth_audio_policy_configuration_7_0.xml \
    frameworks/av/services/audiopolicy/config/a2dp_in_audio_policy_configuration_7_0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/a2dp_in_audio_policy_configuration_7_0.xml

# ANT+
PRODUCT_PACKAGES += \
    AntHalService-Soong \
    com.dsi.ant@1.0.vendor

# AuthSecret
PRODUCT_PACKAGES += \
    android.hardware.authsecret@1.0-service

# Bluetooth
PRODUCT_PACKAGES += \
    vendor.qti.hardware.btconfigstore@1.0.vendor \
    vendor.qti.hardware.btconfigstore@2.0.vendor

# Camera
PRODUCT_PACKAGES += \
    GCamGOPrebuilt

PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/Prebuilt/GCamGOPrebuilt/Configs/lily_experience.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/sysconfig/lily_experience.xml

PRODUCT_PACKAGES += \
    android.frameworks.sensorservice@1.0.vendor \
    android.hardware.camera.device@3.5 \
    android.hardware.camera.provider@2.4-impl \
    android.hardware.camera.provider@2.4-service \
    android.hardware.camera.provider@2.6 \
    libdng_sdk.vendor \
    vendor.qti.hardware.camera.device@1.0 \
    camera.sdm660

PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/configs/camera/camera_config.xml:$(TARGET_COPY_OUT_VENDOR)/etc/camera/camera_config.xml

# Component overrides
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/configs/component-overrides.xml:$(TARGET_COPY_OUT_VENDOR)/etc/sysconfig/component-overrides.xml

# Consumerir
PRODUCT_PACKAGES += \
    android.hardware.ir@1.0-impl \
    android.hardware.ir@1.0-service

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.consumerir.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.consumerir.xml

# Dex Flags
DONT_DEXPREOPT_PREBUILTS := true
PRODUCT_DEX_PREOPT_DEFAULT_COMPILER_FILTER := everything
PRODUCT_DEXPREOPT_SPEED_APPS += \
    SettingsGoogle

PRODUCT_PACKAGES += \
     cppreopts.sh

# Display
PRODUCT_PACKAGES += \
    gralloc.sdm660 \
    hwcomposer.sdm660 \
    memtrack.sdm660 \
    libdisplayconfig \
    libtinyxml \
    libgralloc.qti \
    libqdMetaData \
    libqdMetaData.system

PRODUCT_PACKAGES += \
    android.frameworks.displayservice@1.0.vendor \
    vendor.qti.hardware.display.allocator-service \
    vendor.qti.hardware.display.mapper@2.0.vendor \
    vendor.qti.hardware.display.mapper@1.1.vendor \
    android.hardware.graphics.mapper@3.0-impl-qti-display \
    android.hardware.graphics.mapper@4.0-impl-qti-display \
    android.hardware.graphics.composer@2.1-impl \
    android.hardware.graphics.composer@2.1-service \
    android.hardware.memtrack@1.0-impl \
    android.hardware.memtrack@1.0-service \
    vendor.display.config@2.0

# Display Config
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/configs/displayconfig/display_id_0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/displayconfig/display_id_0.xml

# Doze
PRODUCT_PACKAGES += \
    XiaomiDoze

# DRM
PRODUCT_PACKAGES += \
    android.hardware.drm-service.clearkey

# Extphone Lib
PRODUCT_PACKAGES += \
    extphonelib \
    extphonelib-product \
    extphonelib.xml \
    extphonelib_product.xml \

# fastbootd
PRODUCT_PACKAGES += \
    fastbootd

# Fingerprint
PRODUCT_PACKAGES += \
    android.hardware.biometrics.fingerprint@2.3-service.xiaomi

# Freeform Multiwindow
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.freeform_window_management.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.freeform_window_management.xml

# GMS Permissions
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/configs/privapp-permission/privapp-permissions-gms.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/privapp.permissions-gms.xml

# GPS / Location
PRODUCT_PACKAGES += \
    android.hardware.gnss@2.1.vendor \
    android.hardware.gnss@2.1-impl-qti \
    android.hardware.gnss@2.1-service-qti \
    libbatching \
    libgeofencing \
    libgnss \
    libsensorndkbridge \
    libwifi-hal-ctrl \
    android.hardware.gnss.measurement_corrections@1.1.vendor \
    android.hardware.gnss.visibility_control@1.0.vendor

PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/configs/gps/apdr.conf:$(TARGET_COPY_OUT_VENDOR)/etc/apdr.conf \
    $(DEVICE_PATH)/qcom-caf/gps/etc/flp.conf:$(TARGET_COPY_OUT_VENDOR)/etc/flp.conf \
    $(DEVICE_PATH)/qcom-caf/gps/etc/gnss_antenna_info.conf:$(TARGET_COPY_OUT_VENDOR)/etc/gnss_antenna_info.conf \
    $(DEVICE_PATH)/qcom-caf/gps/etc/gps.conf:$(TARGET_COPY_OUT_VENDOR)/etc/gps.conf \
    $(DEVICE_PATH)/configs/gps/izat.conf:$(TARGET_COPY_OUT_VENDOR)/etc/izat.conf \
    $(DEVICE_PATH)/configs/gps/lowi.conf:$(TARGET_COPY_OUT_VENDOR)/etc/lowi.conf \
    $(DEVICE_PATH)/configs/gps/sap.conf:$(TARGET_COPY_OUT_VENDOR)/etc/sap.conf \
    $(DEVICE_PATH)/configs/gps/xtwifi.conf:$(TARGET_COPY_OUT_VENDOR)/etc/xtwifi.conf

# HALS
TARGET_HALS_PATH := $(DEVICE_PATH)/qcom-caf
TARGET_USE_DISPLAY_VENDOR_FREEZER := true

# Health
PRODUCT_PACKAGES += \
    android.hardware.health@2.1-impl \
    android.hardware.health@2.1-impl.recovery \
    android.hardware.health@2.1-service

# HIDL
PRODUCT_PACKAGES += \
    libhidltransport \
    libhwbinder

# IDC
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/idc/uinput-fpc.idc:$(TARGET_COPY_OUT_VENDOR)/usr/idc/uinput-fpc.idc \
    $(DEVICE_PATH)/idc/uinput-goodix.idc:$(TARGET_COPY_OUT_VENDOR)/usr/idc/uinput-goodix.idc

# IFAA
PRODUCT_PACKAGES += \
    IFAAService

# IMS
PRODUCT_PACKAGES += \
    ims-ext-common \
    ims_ext_common.xml

# Init
PRODUCT_PACKAGES += \
    fstab.qcom \
    init.fingerprint.rc \
    init.jasmine_sprout.rc \
    init.qcom.sensors.sh \
    init.qti.dcvs.sh \
    init.target_dap.rc \
    init.target.rc \
    ueventd.jasmine_sprout.rc

# Ion
PRODUCT_PACKAGES += \
    libion

# IPACM
PRODUCT_PACKAGES += \
    ipacm \
    IPACM_cfg.xml

# IRSC
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/configs/sec_config:$(TARGET_COPY_OUT_VENDOR)/etc/sec_config

# Kernel
TARGET_KERNEL_VERSION := 4.19

# Keylayout
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/keylayout/uinput-fpc.kl:$(TARGET_COPY_OUT_VENDOR)/usr/keylayout/uinput-fpc.kl \
    $(DEVICE_PATH)/keylayout/uinput-goodix.kl:$(TARGET_COPY_OUT_VENDOR)/usr/keylayout/uinput-goodix.kl \
    $(DEVICE_PATH)/keylayout/gpio-keys.kl:$(TARGET_COPY_OUT_VENDOR)/usr/keylayout/gpio-keys.kl

# Keystore
PRODUCT_PACKAGES += \
    android.system.keystore2

# Lights
PRODUCT_PACKAGES += \
    android.hardware.lights-service.jasmine_sprout

# Media
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/configs/media/media_profiles.xml:system/etc/media_profiles.xml \
    $(DEVICE_PATH)/configs/media/media_profiles_sdm660_v1.xml:system/etc/media_profiles_sdm660_v1.xml \
    $(DEVICE_PATH)/configs/media/media_profiles.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_profiles_vendor.xml \
    $(DEVICE_PATH)/configs/media/media_profiles_sdm660_v1.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_profiles_sdm660_v1.xml \
    $(DEVICE_PATH)/configs/media/media_codecs.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs.xml \
    $(DEVICE_PATH)/configs/media/media_codecs_vendor.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_vendor.xml \
    $(DEVICE_PATH)/configs/media/media_codecs_sdm660_v1.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_sdm660_v1.xml \
    $(DEVICE_PATH)/configs/media/media_codecs_performance.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_performance.xml \
    $(DEVICE_PATH)/configs/media/media_codecs_performance_sdm660_v1.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_performance_sdm660_v1.xml \
    $(DEVICE_PATH)/configs/media/media_codecs_vendor_audio.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_vendor_audio.xml \
    $(DEVICE_PATH)/configs/media/media_profiles_V1_0.xml:$(TARGET_COPY_OUT_ODM)/etc/media_profiles_V1_0.xml # This is media/media_profiles.xml from qcom/common

PRODUCT_COPY_FILES += \
    frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_audio.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_telephony.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_telephony.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_video.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_video.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_c2_audio.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_c2_audio.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_c2_video.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_c2_video.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_c2.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_c2.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_video_le.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_video_le.xml \
    frameworks/av/media/libstagefright/data/media_codecs_sw.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_sw.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_c2_telephony.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_c2_telephony.xml

PRODUCT_PACKAGES += \
    android.hardware.media.c2@1.2.vendor \
    libgui_vendor

# Mlipay
PRODUCT_PACKAGES += \
    vendor.xiaomi.hardware.mlipay@1.1.vendor

# Net
PRODUCT_PACKAGES += \
    android.system.net.netd@1.1.vendor

# NGA
PRODUCT_PACKAGES += \
    NgaResources \
    nga

# OMX
PRODUCT_PACKAGES += \
    libc2dcolorconvert \
    libhypv_intercept \
    libmm-omxcore \
    libOmxCore \
    libOmxAacEnc \
    libOmxAmrEnc \
    libOmxEvrcEnc \
    libOmxG711Enc \
    libOmxQcelp13Enc \
    libOmxVdec \
    libOmxVenc \
    libstagefrighthw

# Overlays
PRODUCT_PACKAGES += \
   FrameworksOverlay \
   SettingsOverlay \
   SettingsProviderResOverlay \
   SystemUIOverlay \
   WifiOverlay

# Platform
TARGET_BOARD_PLATFORM := sdm660

# Power
PRODUCT_PACKAGES += \
    android.hardware.power@1.0 \
    android.hardware.power@1.0.vendor \
    android.hardware.power@1.1 \
    android.hardware.power@1.1.vendor \
    android.hardware.power@1.2 \
    android.hardware.power@1.2.vendor \
    android.hardware.power@1.3 \
    android.hardware.power@1.3.vendor \
    android.hardware.power.stats@1.0-service

# Protobuf
PRODUCT_PACKAGES += \
    libprotobuf-cpp-full-vendorcompat \
    libprotobuf-cpp-lite-vendorcompat

# Public Libraries
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/configs/public.libraries.txt:$(TARGET_COPY_OUT_VENDOR)/etc/public.libraries.txt

# QCOM Common
$(call inherit-product, device/qcom/common/common.mk)
TARGET_COMMON_QTI_COMPONENTS := alarm init overlay perf usb vibrator wlan

# RIL
PRODUCT_PACKAGES += \
    android.hardware.radio@1.5.vendor \
    android.hardware.radio.config@1.2.vendor \
    android.hardware.radio.deprecated@1.0.vendor \
    android.hardware.secure_element@1.2.vendor \
    libjson \
    libprotobuf-cpp-full \
    librmnetctl \
    libxml2

# Retrofit Dynamic Partition
PRODUCT_USE_DYNAMIC_PARTITIONS := true
PRODUCT_RETROFIT_DYNAMIC_PARTITIONS := true

PRODUCT_PACKAGES += \
    check_dynamic_partitions

PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/rootdir/etc/fstab.qcom:$(TARGET_COPY_OUT_RECOVERY)/root/first_stage_ramdisk/fstab.qcom

# Screen density
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xxhdpi

# Sdcard
PRODUCT_CHARACTERISTICS := nosdcard

# Sensors
PRODUCT_PACKAGES += \
    android.hardware.sensors@1.0-impl \
    android.hardware.sensors@1.0-service

# Sqlite
PRODUCT_PACKAGES += \
    sqlite3

# Telephony
PRODUCT_PACKAGES += \
    qti-telephony-utils \
    qti_telephony_utils.xml \
    qti-telephony-hidl-wrapper \
    qti_telephony_hidl_wrapper.xml \
    qti-telephony-hidl-wrapper-prd \
    qti_telephony_hidl_wrapper_prd.xml \
    telephony-ext \
    qti-telephony-utils-prd \
    qti_telephony_utils_prd.xml

PRODUCT_BOOT_JARS += \
    telephony-ext

# Thermal
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/configs/thermal-engine.conf:$(TARGET_COPY_OUT_VENDOR)/etc/thermal-engine.conf

# Update engine
PRODUCT_PACKAGES += \
    update_engine \
    update_engine_sideload \
    update_verifier

PRODUCT_HOST_PACKAGES += \
    brillo_update_payload

# Wifi
PRODUCT_PACKAGES += \
    android.hardware.wifi.hostapd@1.3.vendor

# Inherit the proprietary files
$(call inherit-product, vendor/xiaomi/jasmine_sprout/jasmine_sprout-vendor.mk)