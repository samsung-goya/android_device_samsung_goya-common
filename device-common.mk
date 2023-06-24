#
# Copyright (C) 2013 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

$(call inherit-product, device/common/gps/gps_us_supl.mk)

# Get non-open-source specific aspects
$(call inherit-product-if-exists, vendor/samsung/goya/goya-vendor.mk)

PRODUCT_CHARACTERISTICS := tablet

# Overlay
# TODO: add this in device tree
#DEVICE_PACKAGE_OVERLAYS += device/samsung/goya-common/overlay

# This device is MDPI.
PRODUCT_AAPT_CONFIG := large mdpi hdpi xhdpi
PRODUCT_AAPT_PREF_CONFIG := mdpi
PRODUCT_LOCALES += mdpi

# System Properties for USB
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
	persist.sys.usb.config=mtp

# Rootdir
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/rootdir/fstab.pxa988:root/fstab.pxa988 \
	$(LOCAL_PATH)/rootdir/init.pxa988.rc:root/init.pxa988.rc \
	$(LOCAL_PATH)/rootdir/init.pxa988.sensor.rc:root/init.pxa988.sensor.rc \
	$(LOCAL_PATH)/rootdir/init.pxa988.tel.rc:root/init.pxa988.tel.rc \
	$(LOCAL_PATH)/rootdir/init.pxa988.usb.rc:root/init.pxa988.usb.rc \
	$(LOCAL_PATH)/rootdir/ueventd.pxa988.rc:root/ueventd.pxa988.rc

# we have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

# Charger
PRODUCT_PACKAGES += \
	charger \
	charger_res_images

# Permissions
PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
	frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml \
	frameworks/native/data/etc/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.autofocus.xml \
	frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
	frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
	frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
	frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
	frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
	frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
	frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
	frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
	frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
	frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
	frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
	frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
	frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
	frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
	frameworks/native/data/etc/android.software.sip.xml:system/etc/permissions/android.software.sip.xml

# Misc
PRODUCT_PACKAGES += \
	com.android.future.usb.accessory

# Graphics
PRODUCT_PROPERTY_OVERRIDES += \
	ro.opengles.version=131072 \
	ro.sf.lcd_density=170 \
	ro.bq.gpu_to_cpu_unsupported=1

# Dalvik
PRODUCT_PROPERTY_OVERRIDES += \
	ro.zygote.disable_gl_preload=true

PRODUCT_PROPERTY_OVERRIDES += \
	wifi.interface=wlan0 \
	wifi.supplicant_scan_interval=15

# Live Wallpapers
PRODUCT_PACKAGES += \
	LiveWallpapers \
	LiveWallpapersPicker \
	VisualizationWallpapers \
	librs_jni

# Product specific Packages
PRODUCT_PACKAGES += \
	rfkill \
	libMarvellWireless \
	MarvellWirelessDaemon \
	libwpa_client

# Graphics configs
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/configs/graphics/gfx.cfg:system/etc/gfx.cfg

# Keylayouts
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/configs/keylayouts/gpio-keys.kl:system/usr/keylayout/gpio-keys.kl  \
	$(LOCAL_PATH)/configs/keylayouts/pxa27x-keypad.kl:system/usr/keylayout/pxal27x-keypad.kl

# Media
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/configs/media/media_codecs.xml:system/etc/media_codecs.xml \
	$(LOCAL_PATH)/configs/media/media_profiles.xml:system/etc/media_profiles.xml

# Audio
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/configs/audio/asound.conf:system/etc/asound.conf \
	$(LOCAL_PATH)/configs/audio/audio_effects.conf:system/etc/audio_effects.conf \
	$(LOCAL_PATH)/configs/audio/audio_policy.conf:system/etc/audio_policy.conf

# Sensor
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/configs/sensor/sensor_config.xml:system/etc/sensor_config.xml \
	$(LOCAL_PATH)/configs/sensor/param.dat:system/etc/param.dat

# Wi-Fi
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/configs/wifi/wpa_supplicant_overlay.conf:system/etc/wpa_supplicant_overlay.conf \
	$(LOCAL_PATH)/configs/wifi/p2p_supplicant_overlay.conf:system/etc/p2p_supplicant_overlay.conf \
	$(LOCAL_PATH)/configs/wifi/wpa_supplicant.conf:system/etc/wpa_supplicant.conf

# Bluetooth
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/configs/bluetooth/iop_bt.db:system/etc/bluetooth/iop_bt.db \
	$(LOCAL_PATH)/configs/bluetooth/iop_device_list.conf:system/etc/bluetooth/iop_device_list.conf

# GPS
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/configs/gps/gps.conf:system/etc/gps.conf \
	$(LOCAL_PATH)/configs/gps/mrvl_gps_platform.conf:system/etc/mrvl_gps_platform.conf \
	$(LOCAL_PATH)/configs/gps/mrvl_agps_default.conf:system/etc/mrvl_agps_default.conf

# Use the Dalvik VM specific for devices with 1024 MB of RAM
$(call inherit-product, frameworks/native/build/tablet-7in-hdpi-1024-dalvik-heap.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)
$(call inherit-product-if-exists, vendor/marvell/generic/sd8787/FwImage/sd8787fw.mk)
$(call inherit-product-if-exists, vendor/marvell/generic/sd8787/sd8787.mk)
$(call inherit-product-if-exists, vendor/marvell/generic/sd8787/sd8787_modules.mk)
