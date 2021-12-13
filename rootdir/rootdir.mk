# Rootdir files
LOCAL_PATH := device/samsung/goya-common/rootdir

PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/fstab.pxa988:root/fstab.pxa988 \
	$(LOCAL_PATH)/init.pxa988.rc:root/init.pxa988.rc \
	$(LOCAL_PATH)/init.pxa988.sensor.rc:root/init.pxa988.sensor.rc \
	$(LOCAL_PATH)/init.pxa988.tel.rc:root/init.pxa988.tel.rc \
	$(LOCAL_PATH)/init.pxa988.usb.rc:root/init.pxa988.usb.rc \
	$(LOCAL_PATH)/ueventd.pxa988.rc:root/ueventd.pxa988.rc
