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
#

#
# This file is the build configuration for a full Android
# build for victara hardware. This cleanly combines a set of
# device-specific aspects (drivers) with a device-agnostic
# product configuration (apps). Except for a few implementation
# details, it only fundamentally contains two inherit-product
# lines, full and victara, hence its name.
#

# Inherit from victara device
$(call inherit-product, device/motorola/victara/device_victara.mk)

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit from our omni product configuration
$(call inherit-product, vendor/omni/config/common.mk)

# Pull in GSM-specific stuff such as APNs
$(call inherit-product, vendor/omni/config/gsm.mk)

PRODUCT_PACKAGES += \
    charger_res_images \
    charger

PRODUCT_COPY_FILES += device/motorola/victara/fstab.qcom:recovery/root/fstab.qcom

PRODUCT_NAME := omni_victara
PRODUCT_DEVICE := victara
PRODUCT_BRAND := Motorola
PRODUCT_MODEL := XT1092
PRODUCT_MANUFACTURER := Motorola

# Kernel inline build
TARGET_KERNEL_CONFIG := victara_defconfig
TARGET_VARIANT_CONFIG := victara_defconfig
TARGET_SELINUX_CONFIG := victara_defconfig
