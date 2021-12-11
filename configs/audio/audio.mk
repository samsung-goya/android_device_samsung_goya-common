# Audio files configuration
LOCAL_PATH := device/samsung/goya-common/configs/audio

PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/asound.conf:system/etc/asound.conf \
	$(LOCAL_PATH)/audio_effects.conf:system/etc/audio_effects.conf \
	$(LOCAL_PATH)/audio_policy.conf:system/etc/audio_policy.conf
