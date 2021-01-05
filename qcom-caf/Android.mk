LOCAL_PATH := $(call my-dir)

ifneq ($(filter $(LOCAL_PATH),$(PRODUCT_SOONG_NAMESPACES)),)
include $(call first-makefiles-under,$(LOCAL_PATH))
endif
