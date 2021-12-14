# Addititional configs:
# https://github.com/gr8nole/android_device_samsung_lt02wifi/blob/master/BoardConfig.mk

# Architecture
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_SMP := true
TARGET_CPU_VARIANT := cortex-a9
TARGET_BOARD_PLATFORM := mrvl
ARCH_ARM_HAVE_NEON := true
ARCH_ARM_HAVE_TLS_REGISTER := true

# Bootloader
TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true
TARGET_BOOTLOADER_BOARD_NAME := PXA986


# MRVL hardware
BOARD_USES_MRVL_HARDWARE := true
MRVL_ION := true
BOARD_USES_MARVELL_HWC_ENHANCEMENT := true

TARGET_SPECIFIC_HEADER_PATH := device/samsung/goya-common/include

# Flags
COMMON_GLOBAL_CFLAGS += -DMRVL_HARDWARE
COMMON_GLOBAL_CFLAGS += -DNO_RGBX_8888
TARGET_GLOBAL_CFLAGS += -mtune=cortex-a9 -mfpu=neon -mfloat-abi=softfp
TARGET_GLOBAL_CPPFLAGS += -mtune=cortex-a9 -mfpu=neon -mfloat-abi=softfp
LOCAL_CFLAGS += -DBOARD_EGL_NEEDS_LEGACY_FB
LOCAL_CFLAGS += -DNEEDS_VECTORIMPL_SYMBOLS
LOCAL_CFLAGS += -DMR0_AUDIO_BLOB -DMR1_AUDIO_BLOB

# Partition sizes checked from stock firmware

# Boot image
# TODO: special goya3g configs
TARGET_KERNEL_SOURCE := kernel/samsung/goyawifi
TARGET_KERNEL_CONFIG := goyawifi_defconfig
BOARD_KERNEL_CMDLINE := androidboot.selinux=permissive androidboot.hardware=pxa988
BOARD_MKBOOTIMG_ARGS := --ramdisk_offset 0x11000000 --board MRVL
BOARD_KERNEL_PAGESIZE := 2048
BOARD_KERNEL_BASE := 0x10008000

# Update OTA
BLOCK_BASED_OTA := false

# Partitions
BOARD_BOOTIMAGE_PARTITION_SIZE := 16777216
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 16777216
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1594884096
BOARD_CACHEIMAGE_PARTITION_SIZE := 360710144
BOARD_USERDATAIMAGE_PARTITION_SIZE := 5509218304
BOARD_FLASH_BLOCK_SIZE := 4096
TARGET_USERIMAGES_USE_EXT4 := true

# Init
TARGET_PROVIDES_INIT := true
TARGET_PROVIDES_INIT_TARGET_RC := true

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/samsung/goya-common/bluetooth
BOARD_HAVE_BLUETOOTH_MRVL := true
MRVL_WIRELESS_DAEMON_API := true
BOARD_HAVE_BLUETOOTH_BCM := true
USE_BLUETOOTH_SAP := false

# GPS: TODO
#BOARD_GPS_LIBRARIES := true
BOARD_MRVL_USES_GPS := true

# Audio
BOARD_USES_ALSA_AUDIO := true
BUILD_WITH_ALSA_UTILS := true
BOARD_HAVE_PRE_KITKAT_AUDIO_BLOB := true
COMMON_GLOBAL_CFLAGS += -DMR0_AUDIO_BLOB -DMR1_AUDIO_BLOB

#Enable WEBGL in WebKit
ENABLE_WEBGL := true

# Recovery
TARGET_RECOVERY_FSTAB := device/samsung/goya-common/rootdir/fstab.pxa988
RECOVERY_FSTAB_VERSION := 2
BOARD_RECOVERY_SWIPE := true
BOARD_USES_MMCUTILS := true
BOARD_HAS_NO_MISC_PARTITION := true
BOARD_HAS_NO_SELECT_BUTTON := true
BOARD_UMS_LUNFILE := "/sys/class/android_usb/f_mass_storage/lun/file"

# Vold
BOARD_VOLD_MAX_PARTITIONS := 17
BOARD_VOLD_EMMC_SHARES_DEV_MAJOR := true
BOARD_VOLD_DISC_HAS_MULTIPLE_MAJORS := true
TARGET_USE_CUSTOM_LUN_FILE_PATH := "/sys/class/android_usb/f_mass_storage/lun%d/file"

# Wi-fi
#BOARD_HAVE_MARVELL_WIFI := true
#BOARD_WPA_SUPPLICANT_DRIVER := NL80211
#WPA_SUPPLICANT_VERSION := VER_0_8_X
#BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_mrvl
#BOARD_HOSTAPD_DRIVER := NL80211
#BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_mrvl
#BOARD_WLAN_DEVICE := mrvl
#WIFI_DRIVER_FW_PATH_PARAM := "/proc/mwlan/config"
#WIFI_DRIVER_FW_PATH_STA := "/system/etc/firmware/mrvl/sd8777_uapsta.bin"
#WIFI_DRIVER_FW_PATH_AP := "/system/etc/firmware/mrvl/sd8777_uapsta.bin"
#WIFI_DRIVER_FW_PATH_P2P := "/system/etc/firmware/mrvl/sd8777_uapsta.bin"
#CONFIG_CTRL_IFACE := true

# Wifi related defines
#BOARD_HAVE_MARVELL_WIFI          := true
#BOARD_WPA_SUPPLICANT_DRIVER      := NL80211
#WPA_SUPPLICANT_VERSION           := VER_0_8_X
#BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_mrvl
#BOARD_WLAN_DEVICE                := mrvl
#BOARD_HOSTAPD_DRIVER             := NL80211
#BOARD_HOSTAPD_PRIVATE_LIB        := lib_driver_cmd_mrvl
#WIFI_DRIVER_FW_PATH_AP           := "/system/etc/firmware/mrvl/sd8777_uapsta.bin"
#WIFI_DRIVER_FW_PATH_STA          := "/system/etc/firmware/mrvl/sd8777_uapsta.bin"

BOARD_HAVE_MARVELL_WIFI := true
BOARD_WLAN_VENDOR := MRVL
WIFI_DRIVER_MODULE_PATH := "/system/lib/modules/sd8xxx.ko"
WIFI_DRIVER_MODULE_NAME	:= "sd8xxx"
WIFI_DRIVER_MODULE_ARG := "firmware_path=/system/etc/firmware/mrvl/sd8777_uapsta.bin cfg80211_wext=12 sta_name=wlan uap_name=wlan wfd_name=p2p fw_name=mrvl/sd8777_uapsta.bin"
WIFI_DRIVER_FW_PATH_PARAM := "/sys/module/sd8xxx/parameters/firmware_path"
WIFI_DRIVER_FW_PATH_STA := "/system/etc/firmware/mrvl/sd8777_uapsta.bin"
WIFI_DRIVER_FW_PATH_AP := "/system/etc/firmware/mrvl/sd8777_uapsta.bin"
WIFI_DRIVER_FW_PATH_P2P := "/system/etc/firmware/mrvl/sd8777_uapsta.bin"
WIFI_SDIO_IF_DRIVER_MODULE_PATH := "/system/lib/modules/mlan.ko"
WIFI_SDIO_IF_DRIVER_MODULE_NAME := "mlan"
WIFI_SDIO_IF_DRIVER_MODULE_ARG := ""
MRVL_WIRELESS_DAEMON_API := true

#BOARD_WLAN_VENDOR := MRVL
#WIFI_DRIVER_MODULE_PATH := "/system/lib/modules/sd8xxx.ko"
#WIFI_DRIVER_MODULE_NAME	:= "sd8xxx"
#WIFI_DRIVER_MODULE_ARG := "firmware_path=/system/etc/firmware/mrvl/sd8777_uapsta.bin cfg80211_wext=12 sta_name=wlan uap_name=wlan wfd_name=p2p fw_name=mrvl/sd8777_uapsta.bin"
#WIFI_DRIVER_FW_PATH_PARAM := "/sys/module/sd8xxx/parameters/firmware_path"
#WIFI_DRIVER_FW_PATH_STA := "/system/etc/firmware/mrvl/sd8777_uapsta.bin"
#WIFI_DRIVER_FW_PATH_AP := "/system/etc/firmware/mrvl/sd8777_uapsta.bin"
#WIFI_DRIVER_FW_PATH_P2P := "/system/etc/firmware/mrvl/sd8777_uapsta.bin"
#WIFI_SDIO_IF_DRIVER_MODULE_PATH := "/system/lib/modules/mlan.ko"
#WIFI_SDIO_IF_DRIVER_MODULE_NAME := "mlan"
#WIFI_SDIO_IF_DRIVER_MODULE_ARG := ""
#MRVL_WIRELESS_DAEMON_API := true

# Sensors 
SENSORS_NEED_SETRATE_ON_ENABLE := true

# SELinux
BOARD_SEPOLICY_DIRS += \
    device/samsung/goya-common/sepolicy

BOARD_SEPOLICY_UNION += \
    file_contexts \
    device.te \
    dhcp.te \
    file.te \
    init.te \
    mediaserver.te \
    netmgrd.te \
    rild.te \
    secril.te \
    system.te \
    ueventd.te \
    wpa_supplicant.te

# Graphics
VSYNC_EVENT_PHASE_OFFSET_NS := 0
BOARD_USE_BGRA_8888 := true
BOARD_HAVE_PIXEL_FORMAT_INFO := true
USE_OPENGL_RENDERER := true
BOARD_EGL_CFG := device/samsung/goya-common/configs/graphics/egl.cfg

TARGET_HARDWARE_3D := false

BOARD_USE_VIVANTE_GRALLOC := true
HDMI_SUPPORT_3D := true

# flags
NUM_FRAMEBUFFER_SURFACE_BUFFERS := 3

# HWComposer
BOARD_USES_HWCOMPOSER := true

# SurfaceFlinger
MRVL_LAUNCH_DMS_IN_SURFACEFLINGER := true
MRVL_INTERFACE_ANIMATION := true
TARGET_FORCE_CPU_UPLOAD := true

# Charging mode
BOARD_LPM_BOOT_ARGUMENT_NAME := lpm_boot
BOARD_LPM_BOOT_ARGUMENT_VALUE := 1

# Camera
USE_CAMERA_STUB := true
USE_DEVICE_SPECIFIC_CAMERA := true
TARGET_NEEDS_PLATFORM_TEXT_RELOCATIONS := true
TARGET_HAS_LEGACY_CAMERA_HAL1 := true
TARGET_TS_MAKEUP := true

# Blob configs
COMMON_GLOBAL_CFLAGS += -DMR0_CAMERA_BLOB
COMMON_GLOBAL_CFLAGS += -DBOARD_EGL_NEEDS_LEGACY_FB
COMMON_GLOBAL_CFLAGS += -DNEEDS_VECTORIMPL_SYMBOLS
COMMON_GLOBAL_CFLAGS += -DSAMSUNG_DVFS
