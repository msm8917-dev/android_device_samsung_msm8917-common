#
# Copyright (C) 2019-2020 The LineageOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

COMMON_PATH := device/samsung/msm8917-common
BOARD_VENDOR := samsung

BUILD_BROKEN_DUP_RULES := true
BUILD_BROKEN_USES_BUILD_COPY_HEADERS := true
BUILD_BROKEN_ELF_PREBUILT_PRODUCT_COPY_FILES := true

TARGET_SYSTEM_PROP += $(COMMON_PATH)/system.prop

# Architecture
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_VARIANT := cortex-a53

# Platform
TARGET_BOARD_PLATFORM := msm8937
TARGET_BOARD_PLATFORM_GPU := qcom-adreno308

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := RG13A002KU
TARGET_NO_BOOTLOADER := true

# Security patch level
VENDOR_SECURITY_PATCH := 2019-04-01

# Binder trick
TARGET_USES_64_BIT_BINDER := true

# Kernel
BOARD_KERNEL_CMDLINE := console=null androidboot.hardware=qcom msm_rtb.filter=0x237 ehci-hcd.park=3 androidboot.bootdevice=7824900.sdhci lpm_levels.sleep_disabled=1 androidboot.selinux=permissive loop.max_part=7
BOARD_KERNEL_BASE := 0x80000000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_MKBOOTIMG_ARGS := --ramdisk_offset 0x02000000 --tags_offset 0x01e00000
ifneq ($(TARGET_DEVICE), j2y18lte)
BOARD_KERNEL_IMAGE_NAME := zImage-dtb
else
BOARD_KERNEL_IMAGE_NAME := zImage
BOARD_KERNEL_SEPARATED_DT := true
endif
TARGET_KERNEL_ARCH := arm
TARGET_KERNEL_SOURCE := kernel/samsung/msm8917
TARGET_KERNEL_CLANG_COMPILE := true

# FM
BOARD_HAS_QCA_FM_SOC := "cherokee"
BOARD_HAVE_QCOM_FM := true

# ANT
BOARD_ANT_WIRELESS_DEVICE := "vfs-prerelease"

ifneq ($(TARGET_DEVICE), j2y18lte)
# Init
TARGET_INIT_VENDOR_LIB := //$(COMMON_PATH):libinit_msm8917
endif

# Audio
AUDIO_FEATURE_ENABLED_AAC_ADTS_OFFLOAD := true
AUDIO_FEATURE_ENABLED_ALAC_OFFLOAD := true
AUDIO_FEATURE_ENABLED_ANC_HEADSET := true
AUDIO_FEATURE_ENABLED_APE_OFFLOAD := true
AUDIO_FEATURE_ENABLED_COMPRESS_CAPTURE := false
AUDIO_FEATURE_ENABLED_COMPRESS_VOIP := true
AUDIO_FEATURE_ENABLED_CUSTOMSTEREO := true
AUDIO_FEATURE_ENABLED_DEV_ARBI := false
AUDIO_FEATURE_ENABLED_EXT_AMPLIFIER := false
AUDIO_FEATURE_ENABLED_EXTN_FORMATS := true
AUDIO_FEATURE_ENABLED_FLAC_OFFLOAD := true
AUDIO_FEATURE_ENABLED_FLUENCE := true
AUDIO_FEATURE_ENABLED_FM_POWER_OPT := true
AUDIO_FEATURE_ENABLED_HFP := true
AUDIO_FEATURE_ENABLED_KPI_OPTIMIZE := true
AUDIO_FEATURE_ENABLED_MULTI_VOICE_SESSIONS := true
AUDIO_FEATURE_ENABLED_PCM_OFFLOAD := true
AUDIO_FEATURE_ENABLED_PCM_OFFLOAD_24 := true
AUDIO_FEATURE_ENABLED_PROXY_DEVICE := true
AUDIO_FEATURE_ENABLED_SOURCE_TRACKING := true
AUDIO_FEATURE_ENABLED_VBAT_MONITOR := true
AUDIO_FEATURE_ENABLED_VORBIS_OFFLOAD := true
AUDIO_FEATURE_ENABLED_WMA_OFFLOAD := true
AUDIO_USE_LL_AS_PRIMARY_OUTPUT := true
BOARD_SUPPORTS_SOUND_TRIGGER := true
BOARD_USES_ALSA_AUDIO := true
USE_CUSTOM_AUDIO_POLICY := 1
AUDIO_FEATURE_ENABLED_FM_POWER_OPT := true

# APEX
TARGET_FLATTEN_APEX := true

# Bluetooth
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(COMMON_PATH)/bluetooth/include
BOARD_HAVE_BLUETOOTH_QCOM := true
BLUETOOTH_HCI_USE_MCT := true
QCOM_BT_USE_SMD_TTY := true
QCOM_BT_USE_BTNV := true

# Camera
MALLOC_SVELTE_FOR_LIBC32 := true
TARGET_NEEDS_LEGACY_CAMERA_HAL1_DYN_NATIVE_HANDLE := true
BOARD_USE_SAMSUNG_CAMERAFORMAT_NV21 := true
TARGET_USES_QTI_CAMERA_DEVICE := true
USE_DEVICE_SPECIFIC_CAMERA := true
TARGET_USES_MEDIA_EXTENSIONS := true

# Dex
ifeq ($(HOST_OS),linux)
  ifneq ($(TARGET_BUILD_VARIANT),eng)
    WITH_DEXPREOPT ?= true
    WITH_DEXPREOPT_BOOT_IMG_AND_SYSTEM_SERVER_ONLY ?= true
  endif
endif

# DT2W
TARGET_TAP_TO_WAKE_NODE := "/sys/android_touch/doubletap2wake"

# Fingerprint
TARGET_SEC_FP_HAL_VARIANT := bauth

# HIDL
DEVICE_MANIFEST_FILE := $(COMMON_PATH)/manifest.xml

ifeq ($(shell ls hardware/samsung/AdvancedDisplay > /dev/null 2>&1 && echo true),true)
DEVICE_MANIFEST_FILE += $(COMMON_PATH)/manifest_livedisplay.xml
endif

DEVICE_MATRIX_FILE := $(COMMON_PATH)/compatibility_matrix.xml
DEVICE_FRAMEWORK_COMPATIBILITY_MATRIX_FILE := $(COMMON_PATH)/framework_compatibility_matrix.xml

ifneq ($(TARGET_DEVICE), j2y18lte)
DEVICE_MANIFEST_FILE += $(COMMON_PATH)/manifest_skeymaster.xml
ODM_MANIFEST_SKUS += NFC
ODM_MANIFEST_NFC_FILES := $(COMMON_PATH)/manifest_nfc.xml
endif

# Filesystem
BOARD_BOOTIMAGE_PARTITION_SIZE := 67108864
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 67108864
BOARD_USERDATAIMAGE_PARTITION_SIZE := 12348030976 # 25765059584 - 16384
BOARD_CACHEIMAGE_PARTITION_SIZE := 106954752
BOARD_FLASH_BLOCK_SIZE := 131072 # (BOARD_KERNEL_PAGESIZE * 64)

TARGET_USERIMAGES_USE_EXT4 := true
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4

TARGET_FS_CONFIG_GEN := $(COMMON_PATH)/config.fs

BOARD_ROOT_EXTRA_SYMLINKS := \
    /vendor/dsp:/dsp \
    /vendor/firmware_mnt:/firmware \
    /mnt/vendor/persist:/persist

# Graphics
BOARD_USES_ADRENO := true

TARGET_USES_ION := true
TARGET_USES_C2D_COMPOSITION := true
TARGET_USES_GRALLOC1 := true
TARGET_USES_HWC2 := true

MAX_EGL_CACHE_KEY_SIZE := 12*1024
MAX_EGL_CACHE_SIZE := 2048*1024
OVERRIDE_RS_DRIVER := libRSDriver_adreno.so

# Lights
TARGET_PROVIDES_LIBLIGHT=true

# Power
TARGET_USES_NON_LEGACY_POWERHAL := true

# Qualcomm
BOARD_USES_QCOM_HARDWARE := true

# RIL
BOARD_PROVIDES_LIBRIL := true
ENABLE_VENDOR_RIL_SERVICE := true

# Root
BOARD_ROOT_EXTRA_FOLDERS := config omr efs

# Recovery
TARGET_RECOVERY_FSTAB := $(COMMON_PATH)/rootdir/etc/fstab.qcom

# SELinux
include device/qcom/sepolicy-legacy-um/SEPolicy.mk
BOARD_VENDOR_SEPOLICY_DIRS += $(COMMON_PATH)/sepolicy/vendor
BOARD_PLAT_PUBLIC_SEPOLICY_DIR += $(COMMON_PATH)/sepolicy/public
BOARD_PLAT_PRIVATE_SEPOLICY_DIR += $(COMMON_PATH)/sepolicy/private

# Shims
TARGET_LD_SHIM_LIBS := \
    /system/vendor/lib/libsec-ril.so|libshims_ril.so \
    /system/vendor/lib/libsec-ril-dsds.so|libshims_ril.so

# Treble
BOARD_PROPERTY_OVERRIDES_SPLIT_ENABLED := true
BOARD_VNDK_VERSION := current
BOARD_PROPERTY_OVERRIDES_SPLIT_ENABLED := true

# WiFi
BOARD_HAS_QCOM_WLAN := true
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_qcwcn
BOARD_WLAN_DEVICE := qcwcn
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_qcwcn
TARGET_DISABLE_WCNSS_CONFIG_COPY := true
WPA_SUPPLICANT_VERSION := VER_0_8_X
BOARD_HAVE_SAMSUNG_WIFI := true

-include vendor/samsung/msm8917-common/BoardConfigVendor.mk
