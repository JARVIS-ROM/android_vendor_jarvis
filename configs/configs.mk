# Copyright (C) 2018-2020 ArrowOS
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

include vendor/jarvis/configs/version.mk

ifeq ($(RELEASE_TYPE),GApps)
$(call inherit-product, vendor/gapps/arm64/arm64-vendor.mk)
endif

ifeq ($(RELEASE_TYPE),microG)
$(call inherit-product, vendor/microg/products/gms.mk)
endif

PRODUCT_PACKAGE_OVERLAYS += \
    vendor/jarvis/overlay/common

PRODUCT_ENFORCE_RRO_EXCLUDED_OVERLAYS += \
    vendor/jarvis/overlay/common

PRODUCT_PACKAGES += \
    NetworkStackOverlay

# bootanimation
PRODUCT_COPY_FILES += \
    vendor/jarvis/prebuilt/bootanimation/bootanimation_1080x2400.zip:$(TARGET_COPY_OUT_PRODUCT)/media/bootanimation.zip

# Dex preopt
PRODUCT_DEXPREOPT_SPEED_APPS += \
    SystemUI \
    Launcher3QuickStep

# Enable Android Beam on all targets
PRODUCT_COPY_FILES += \
    vendor/jarvis/configs/permissions/android.software.nfc.beam.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/android.software.nfc.beam.xml

# Enable SIP+VoIP on all targets
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.sip.voip.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/android.software.sip.voip.xml

# init file
PRODUCT_COPY_FILES += \
    vendor/jarvis/prebuilt/common/etc/init/init.jarvis-system_ext.rc:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/init/init.jarvis-system_ext.rc \
    vendor/jarvis/prebuilt/common/etc/init/init.jarvis-updater.rc:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/init/init.jarvis-updater.rc \
    vendor/jarvis/prebuilt/common/etc/init/init.openssh.rc:$(TARGET_COPY_OUT_PRODUCT)/etc/init/init.openssh.rc

# Backup Tool
PRODUCT_COPY_FILES += \
    vendor/jarvis/build/tools/backuptool.sh:install/bin/backuptool.sh \
    vendor/jarvis/build/tools/backuptool.functions:install/bin/backuptool.functions \
    vendor/jarvis/build/tools/50-jarvis.sh:$(TARGET_COPY_OUT_SYSTEM)/addon.d/50-jarvis.sh

PRODUCT_ARTIFACT_PATH_REQUIREMENT_ALLOWED_LIST += \
    system/addon.d/50-jarvis.sh

ifneq ($(strip $(AB_OTA_PARTITIONS) $(AB_OTA_POSTINSTALL_CONFIG)),)
PRODUCT_COPY_FILES += \
    vendor/jarvis/build/tools/backuptool_ab.sh:$(TARGET_COPY_OUT_SYSTEM)/bin/backuptool_ab.sh \
    vendor/jarvis/build/tools/backuptool_ab.functions:$(TARGET_COPY_OUT_SYSTEM)/bin/backuptool_ab.functions \
    vendor/jarvis/build/tools/backuptool_postinstall.sh:$(TARGET_COPY_OUT_SYSTEM)/bin/backuptool_postinstall.sh

PRODUCT_ARTIFACT_PATH_REQUIREMENT_ALLOWED_LIST += \
    system/bin/backuptool_ab.sh \
    system/bin/backuptool_ab.functions \
    system/bin/backuptool_postinstall.sh

ifneq ($(TARGET_BUILD_VARIANT),user)
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.ota.allow_downgrade=true
endif
endif

# Enable wireless Xbox 360 controller support
PRODUCT_COPY_FILES += \
    frameworks/base/data/keyboards/Vendor_045e_Product_028e.kl:$(TARGET_COPY_OUT_PRODUCT)/usr/keylayout/Vendor_045e_Product_0719.kl

# Sensitive Phone Numbers list
PRODUCT_COPY_FILES += \
    vendor/jarvis/prebuilt/common/etc/sensitive_pn.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/sensitive_pn.xml

# Do not include art debug targets
PRODUCT_ART_TARGET_INCLUDE_DEBUG_BUILD := false

# Strip the local variable table and the local variable type table to reduce
# the size of the system image. This has no bearing on stack traces, but will
# leave less information available via JDWP.
PRODUCT_MINIMIZE_JAVA_DEBUG_INFO := true

# Disable vendor restrictions
PRODUCT_RESTRICT_VENDOR_FILES := false

# Fonts
include vendor/jarvis/configs/fonts.mk

# Packages
include vendor/jarvis/configs/packages.mk

# Props
include vendor/jarvis/configs/properties.mk

# Sounds
include vendor/jarvis/configs/sounds.mk
