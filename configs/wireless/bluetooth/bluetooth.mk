# Bluetooth files configuration
LOCAL_PATH := device/samsung/goya-common/configs/wireless/bluetooth

PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/iop_bt.db:system/etc/bluetooth/iop_bt.db \
	$(LOCAL_PATH)/iop_device_list.conf:system/etc/bluetooth/iop_device_list.conf
