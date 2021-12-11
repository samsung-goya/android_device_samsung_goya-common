# All configs
LOCAL_PATH := device/samsung/goya-common/configs

$(call inherit-product, $(LOCAL_PATH)/wireless/wireless.mk)
$(call inherit-product, $(LOCAL_PATH)/graphics/graphics.mk)
$(call inherit-product, $(LOCAL_PATH)/media/media.mk)
$(call inherit-product, $(LOCAL_PATH)/sensor/sensor.mk)
$(call inherit-product, $(LOCAL_PATH)/keylayouts/keylayouts.mk)
