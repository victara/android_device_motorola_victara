#
# Copyright (C) 2014 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# inherit from the proprietary version
-include vendor/motorola/victara/BoardConfigVendor.mk

LOCAL_PATH := device/motorola/victara

TARGET_GLOBAL_CFLAGS += -mfpu=neon -mfloat-abi=softfp
TARGET_GLOBAL_CPPFLAGS += -mfpu=neon -mfloat-abi=softfp
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_SMP := true
TARGET_CPU_VARIANT := krait
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
ARCH_ARM_HAVE_TLS_REGISTER := true

# Bluetooth
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(LOCAL_PATH)/bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_QCOM := true
BLUETOOTH_HCI_USE_MCT := true

# Audio
#AUDIO_FEATURE_DISABLED_FM := true
#BOARD_USES_ALSA_AUDIO := true
#BOARD_USES_FLUENCE_INCALL := true
#BOARD_USES_LEGACY_ALSA_AUDIO := true
#BOARD_USES_SEPERATED_AUDIO_INPUT := true
#BOARD_USES_SEPERATED_VOICE_SPEAKER := true
#TARGET_QCOM_AUDIO_VARIANT := caf
#TARGET_USES_QCOM_COMPRESSED_AUDIO := true

# Camera
USE_DEVICE_SPECIFIC_CAMERA := true

# Krait optimizations
TARGET_USE_KRAIT_BIONIC_OPTIMIZATION := true
TARGET_USE_KRAIT_PLD_SET := true
TARGET_KRAIT_BIONIC_PLDOFFS := 10
TARGET_KRAIT_BIONIC_PLDTHRESH := 10
TARGET_KRAIT_BIONIC_BBTHRESH := 64
TARGET_KRAIT_BIONIC_PLDSIZE := 64

# Display
BOARD_EGL_CFG := $(LOCAL_PATH)/configs/egl.cfg
NUM_FRAMEBUFFER_SURFACE_BUFFERS := 3
TARGET_DISPLAY_USE_RETIRE_FENCE := true
TARGET_QCOM_DISPLAY_VARIANT := caf
TARGET_USES_C2D_COMPOSITION := true
TARGET_USES_ION := true
USE_OPENGL_RENDERER := true

TARGET_NO_BOOTLOADER := true
TARGET_BOOTLOADER_BOARD_NAME := victara

BOARD_KERNEL_CMDLINE := console=ttyHSL0,115200,n8 androidboot.hardware=qcom msm_rtb.filter=0x37 ehci-hcd.park=3 vmalloc=400M utags.blkdev=/dev/block/platform/msm_sdcc.1/by-name/utags

BOARD_KERNEL_BASE := 0x0000000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_MKBOOTIMG_ARGS := --kernel_offset 0x0000000 --ramdisk_offset 0x01000000 --second_offset 0x0f00000 --tags_offset 0x0000100 --dt device/motorola/victara/dtb

# prebuilt kernel
#TARGET_PREBUILT_KERNEL := device/motorola/victara/kernel
# else uncomment below to build from sauce
TARGET_KERNEL_SOURCE := kernel/motorola/victara
TARGET_KERNEL_CONFIG := victara_defconfig
# apparently this dont work but should ;x
# TARGET_KERNEL_APPEND_DTB := true
# use this instead
# BOARD_KERNEL_IMAGE_NAME := zImage-dtb

BOARD_BOOTIMAGE_PARTITION_SIZE := 14485760
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 10526720
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1073741824
BOARD_USERDATAIMAGE_PARTITION_SIZE := 2147483648
BOARD_FLASH_BLOCK_SIZE := 131072 # (BOARD_KERNEL_PAGESIZE * 64)
BOARD_VOLD_EMMC_SHARES_DEV_MAJOR := true

TARGET_USERIMAGES_USE_EXT4 := true
BOARD_HAS_NO_SELECT_BUTTON := true
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"

DEVICE_RESOLUTION := 1080x1920
RECOVERY_GRAPHICS_USE_LINELENGTH := true
TW_NO_USB_STORAGE := true
#TW_INCLUDE_JB_CRYPTO := true
BOARD_SUPPRESS_SECURE_ERASE := true
RECOVERY_SDCARD_ON_DATA := true
BOARD_HAS_NO_REAL_SDCARD := true
TW_DISABLE_TTF := true
TW_SCREEN_BLANK_ON_BOOT := true
TW_NO_EXFAT_FUSE := true
TW_EXCLUDE_ENCRYPTED_BACKUPS := true
