# Keylayout files configuration
LOCAL_PATH := device/samsung/goya-common/configs/keylayouts

PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/gpio-keys.kl:system/usr/keylayout/gpio-keys.kl  \
	$(LOCAL_PATH)/pxa27x-keypad.kl:system/usr/keylayout/pxal27x-keypad.kl
