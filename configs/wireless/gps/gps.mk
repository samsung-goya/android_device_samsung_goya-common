# GPS files configuration
LOCAL_PATH := device/samsung/goya-common/configs/wireless/gps

PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/gps.conf:system/etc/gps.conf \
	$(LOCAL_PATH)/mrvl_agps_default.conf:system/etc/mrvl_agps_default.conf \
	$(LOCAL_PATH)/mrvl_gps_platform.conf:system/etc/mrvl_gps_platform.conf 
