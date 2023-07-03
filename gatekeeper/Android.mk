LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE := android.hardware.gatekeeper@1.0-service-recovery.rc
LOCAL_MODULE_TAGS  := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_PATH := $(TARGET_RECOVERY_ROOT_OUT)/vendor/etc/init
LOCAL_SRC_FILES := $(LOCAL_MODULE)
include $(BUILD_PREBUILT)

LOCAL_PATH := hardware/interfaces/gatekeeper/1.0/default

include $(CLEAR_VARS)

LOCAL_MODULE := android.hardware.gatekeeper@1.0-service-recovery
LOCAL_MODULE_PATH := $(TARGET_RECOVERY_ROOT_OUT)/vendor/bin
LOCAL_MODULE_RELATIVE_PATH := hw
LOCAL_REQUIRED_MODULES := android.hardware.gatekeeper@1.0-service-recovery.rc

LOCAL_SRC_FILES := \
    service.cpp

LOCAL_CFLAGS := \
    -Wall \
    -Werror

LOCAL_SHARED_LIBRARIES := \
    android.hardware.gatekeeper@1.0 \
    libhardware \
    libhidlbase \
    libutils \
    liblog

include $(BUILD_EXECUTABLE)

include $(CLEAR_VARS)

LOCAL_MODULE := android.hardware.gatekeeper@1.0-impl-recovery

ifeq ($(TARGET_IS_64_BIT),true)
LOCAL_MODULE_PATH := $(TARGET_RECOVERY_ROOT_OUT)/vendor/lib64
else
LOCAL_MODULE_PATH := $(TARGET_RECOVERY_ROOT_OUT)/vendor/lib
endif

LOCAL_MODULE_RELATIVE_PATH := hw

LOCAL_MULTILIB := first

LOCAL_SRC_FILES := \
    Gatekeeper.cpp

LOCAL_CFLAGS := \
    -Wall \
    -Werror

LOCAL_SHARED_LIBRARIES := \
    android.hardware.gatekeeper@1.0 \
    libhardware \
    libhidlbase \
    libutils \
    liblog

include $(BUILD_SHARED_LIBRARY)
