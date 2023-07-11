LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE := libshim_beanpod

ifeq ($(TARGET_IS_64_BIT),true)
LOCAL_MODULE_PATH := $(TARGET_RECOVERY_ROOT_OUT)/vendor/lib64
else
LOCAL_MODULE_PATH := $(TARGET_RECOVERY_ROOT_OUT)/vendor/lib
endif

LOCAL_MULTILIB := first

LOCAL_SRC_FILES := \
    libshim_beanpod.cpp

LOCAL_SHARED_LIBRARIES := \
    libkeymaster_messages

LOCAL_HEADER_LIBRARIES := \
    libhardware_headers

LOCAL_C_INCLUDES := \
    system/keymaster/include

include $(BUILD_SHARED_LIBRARY)
