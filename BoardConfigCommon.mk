# Addititional configs:
# https://github.com/gr8nole/android_device_samsung_lt02wifi/blob/master/BoardConfig.mk
# https://github.com/GalaxyTab4/android_device_samsung_degaswifi/blob/cm-12.1/BoardConfig.mk

LOCAL_PATH := device/samsung/goya-common

# Architecture
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_SMP := true
TARGET_CPU_VARIANT := cortex-a9
TARGET_BOARD_PLATFORM := mrvl

# Bootloader
TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true
TARGET_BOOTLOADER_BOARD_NAME := PXA986

# MRVL hardware
BOARD_USES_MRVL_HARDWARE := true
MRVL_ION := true
TARGET_SPECIFIC_HEADER_PATH := $(LOCAL_PATH)/include

# Flags
COMMON_GLOBAL_CFLAGS += -DNO_RGBX_8888
TARGET_GLOBAL_CFLAGS += -mtune=cortex-a9 -mfpu=neon -mfloat-abi=softfp
TARGET_GLOBAL_CPPFLAGS += -mtune=cortex-a9 -mfpu=neon -mfloat-abi=softfp
COMMON_GLOBAL_CFLAGS += -DBOARD_EGL_NEEDS_LEGACY_FB
COMMON_GLOBAL_CFLAGS += -DNEEDS_VECTORIMPL_SYMBOLS

# Boot image
TARGET_KERNEL_SOURCE := kernel/samsung/goya
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
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(LOCAL_PATH)/configs/bluetooth
BOARD_HAVE_BLUETOOTH_MRVL := true
MRVL_WIRELESS_DAEMON_API := true
USE_BLUETOOTH_SAP := false

# GPS: TODO
#BOARD_GPS_LIBRARIES := true
BOARD_MRVL_USES_GPS := true

# Audio
BOARD_USES_ALSA_AUDIO := true
BOARD_HAVE_PRE_KITKAT_AUDIO_BLOB := true
BOARD_HAVE_PRE_KITKAT_AUDIO_POLICY_BLOB := true
COMMON_GLOBAL_CFLAGS += -DMR0_AUDIO_BLOB -DMR1_AUDIO_BLOB
BOARD_USES_LEGACY_MMAP := true

# Recovery
TARGET_RECOVERY_FSTAB := $(LOCAL_PATH)/rootdir/fstab.pxa988
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

# WiFi
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

# Graphics
ENABLE_HWC_GC_PATH := true
USE_OPENGL_RENDERER := true
BOARD_USE_BGRA_8888 := true
BOARD_HAVE_PIXEL_FORMAT_INFO := true
BOARD_EGL_CFG := $(LOCAL_PATH)/configs/graphics/egl.cfg
TARGET_HARDWARE_3D := true
BOARD_USE_VIVANTE_GRALLOC := true

# flags
NUM_FRAMEBUFFER_SURFACE_BUFFERS := 3

# SurfaceFlinger
MRVL_LAUNCH_DMS_IN_SURFACEFLINGER := true
MRVL_INTERFACE_ANIMATION := true
TARGET_FORCE_CPU_UPLOAD := true

# Charging mode
BOARD_LPM_BOOT_ARGUMENT_NAME := lpm_boot
BOARD_LPM_BOOT_ARGUMENT_VALUE := 1

# SELinux
export BOARD_SEPOLICY_DIRS += $(LOCAL_PATH)/sepolicy
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

# Camera
USE_CAMERA_STUB := true
USE_DEVICE_SPECIFIC_CAMERA := true
TARGET_NEEDS_PLATFORM_TEXT_RELOCATIONS := true
TARGET_HAS_LEGACY_CAMERA_HAL1 := true
TARGET_TS_MAKEUP := true

# Blob configs
COMMON_GLOBAL_CFLAGS += -DMR0_CAMERA_BLOB
COMMON_GLOBAL_CFLAGS += -DSAMSUNG_DVFS
