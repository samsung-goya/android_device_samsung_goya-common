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

# This device is MDPI.
PRODUCT_AAPT_CONFIG := large mdpi hdpi xhdpi
PRODUCT_AAPT_PREF_CONFIG := mdpi
PRODUCT_LOCALES += mdpi

# System Properties for USB
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
	persist.sys.usb.config=mtp

# Rootdir
$(call inherit-product, device/samsung/goya-common/rootdir/rootdir.mk)

# we have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

# Charger
PRODUCT_PACKAGES += \
	charger \
	charger_res_images

# Graphics configs
PRODUCT_COPY_FILES += \
	device/samsung/goya-common/configs/graphics/gfx.cfg:system/etc/gfx.cfg

# Keylayouts
PRODUCT_COPY_FILES += \
	device/samsung/goya-common/configs/keylayouts/gpio-keys.kl:system/usr/keylayout/gpio-keys.kl  \
	device/samsung/goya-common/configs/keylayouts/pxa27x-keypad.kl:system/usr/keylayout/pxal27x-keypad.kl

# Media
PRODUCT_COPY_FILES += \
	device/samsung/goya-common/configs/media/media_codecs.xml:system/etc/media_codecs.xml \
	device/samsung/goya-common/configs/media/media_profiles.xml:system/etc/media_profiles.xml

# Audio
PRODUCT_COPY_FILES += \
	device/samsung/goya-common/configs/audio/asound.conf:system/etc/asound.conf \
	device/samsung/goya-common/configs/audio/audio_effects.conf:system/etc/audio_effects.conf \
	device/samsung/goya-common/configs/audio/audio_policy.conf:system/etc/audio_policy.conf

# Sensor
PRODUCT_COPY_FILES += \
	device/samsung/goya-common/configs/sensor/sensor_config.xml:system/etc/sensor_config.xml \
	device/samsung/goya-common/configs/sensor/param.dat:system/etc/param.dat

# Wi-Fi
PRODUCT_COPY_FILES += \
	device/samsung/goya-common/configs/wifi/wpa_supplicant_overlay.conf:system/etc/wpa_supplicant_overlay.conf \
	device/samsung/goya-common/configs/wifi/p2p_supplicant_overlay.conf:system/etc/p2p_supplicant_overlay.conf \
	device/samsung/goya-common/configs/wifi/wpa_supplicant.conf:system/etc/wpa_supplicant.conf

# Bluetooth
PRODUCT_COPY_FILES += \
	device/samsung/goya-common/configs/bluetooth/iop_bt.db:system/etc/bluetooth/iop_bt.db \
	device/samsung/goya-common/configs/bluetooth/iop_device_list.conf:system/etc/bluetooth/iop_device_list.conf

# GPS
PRODUCT_COPY_FILES += \
	device/samsung/goya-common/configs/gps/gps.conf:system/etc/gps.conf \
	device/samsung/goya-common/configs/gps/mrvl_gps_default.conf:system/etc/mrvl_gps_default.conf \
	device/samsung/goya-common/configs/gps/mrvl_agps_default.conf:system/etc/mrvl_agps_default.conf

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
	Torch \
	com.android.future.usb.accessory

# Graphics
PRODUCT_PROPERTY_OVERRIDES += \
	ro.opengles.version=131072 \
	ro.bq.gpu_to_cpu_unsupported=1 \
	ro.sf.hwrotation=270

# Dalvik
PRODUCT_PROPERTY_OVERRIDES += \
	ro.zygote.disable_gl_preload=true

# Fix for RIL showing on T110. We are a tablet.
PRODUCT_PROPERTY_OVERRIDES += \
	ro.carrier=wifi-only

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

# Use the Dalvik VM specific for devices with 1024 MB of RAM
$(call inherit-product, frameworks/native/build/tablet-7in-hdpi-1024-dalvik-heap.mk)
$(call inherit-product-if-exists, vendor/marvell/generic/sd8787/FwImage/sd8787fw.mk)
$(call inherit-product-if-exists, vendor/marvell/generic/sd8787/sd8787.mk)
$(call inherit-product-if-exists, vendor/marvell/generic/sd8787/sd8787_modules.mk)

