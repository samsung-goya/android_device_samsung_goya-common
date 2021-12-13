# WPA/P2P Overlay configuration
LOCAL_PATH := device/samsung/goya-common/configs/wireless/wifi/wpa_overlays

PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/wpa_supplicant_overlay.conf:system/etc/wpa_supplicant_overlay.conf \
	$(LOCAL_PATH)/p2p_supplicant_overlay.conf:system/etc/p2p_supplicant_overlay.conf
