# Media files configuration
LOCAL_PATH := device/samsung/goya-common/configs/media

$(call inherit-product, $(LOCAL_PATH)/audio/audio.mk)

PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/media_codecs.xml:system/etc/media_codecs.xml \
	$(LOCAL_PATH)/media_profiles.xml:system/etc/media_profiles.xml
