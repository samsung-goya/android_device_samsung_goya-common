# Sensor files configuration
LOCAL_PATH := device/samsung/goya-common/configs/sensor

PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/sensor_config.xml:system/etc/sensor_config.xml \
	$(LOCAL_PATH)/param.dat:system/etc/param.dat
