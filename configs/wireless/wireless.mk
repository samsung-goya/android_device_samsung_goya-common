# Wireless configuration
LOCAL_PATH := device/samsung/goya-common/configs/wireless

$(call inherit-product, $(LOCAL_PATH)/gps/gps.mk)
$(call inherit-product, $(LOCAL_PATH)/wifi/wifi.mk)
