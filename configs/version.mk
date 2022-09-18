# Copyright (C) 2016 The Pure Nexus Project
# Copyright (C) 2016 The JDCTeam
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

JARVIS_MOD_VERSION = v13.0
JARVIS_BUILD_TYPE := UNOFFICIAL
JARVIS_BUILD_ZIP_TYPE := VANILLA

ifeq ($(JARVIS_BETA),true)
    JARVIS_BUILD_TYPE := BETA
endif

ifeq ($(JARVIS_GAPPS), true)
    $(call inherit-product, vendor/gapps/common/common-vendor.mk)
    JARVIS_BUILD_ZIP_TYPE := GAPPS
endif

CURRENT_DEVICE=$(shell echo "$(TARGET_PRODUCT)" | cut -d'_' -f 2,3)

ifeq ($(JARVIS_OFFICIAL), true)
   LIST = $(shell cat infrastructure/devices/jarvis.devices | awk '$$1 != "#" { print $$2 }')
    ifeq ($(filter $(CURRENT_DEVICE), $(LIST)), $(CURRENT_DEVICE))
      IS_OFFICIAL=true
      JARVIS_BUILD_TYPE := OFFICIAL

PRODUCT_PACKAGES += \
    Updater

    endif
    ifneq ($(IS_OFFICIAL), true)
       JARVIS_BUILD_TYPE := UNOFFICIAL
       $(error Device is not official "$(CURRENT_DEVICE)")
    endif
endif

ifeq ($(JARVIS_COMMUNITY), true)
   LIST = $(shell cat infrastructure/devices/jarvis-community.devices | awk '$$1 != "#" { print $$2 }')
    ifeq ($(filter $(CURRENT_DEVICE), $(LIST)), $(CURRENT_DEVICE))
      IS_COMMUNITY=true
      JARVIS_BUILD_TYPE := COMMUNITY
    endif
    ifneq ($(IS_COMMUNITY), true)
       JARVIS_BUILD_TYPE := UNOFFICIAL
       $(error This isn't a community device "$(CURRENT_DEVICE)")
    endif
endif

JARVIS_VERSION := JARVIS-$(JARVIS_MOD_VERSION)-$(CURRENT_DEVICE)-$(JARVIS_BUILD_TYPE)-$(shell date -u +%Y%m%d)-$(JARVIS_BUILD_ZIP_TYPE)

PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
  ro.jarvis.version=$(JARVIS_VERSION) \
  ro.jarvis.releasetype=$(JARVIS_BUILD_TYPE) \
  ro.jarvis.ziptype=$(JARVIS_BUILD_ZIP_TYPE) \
  ro.modversion=$(JARVIS_MOD_VERSION)

JARVIS_DISPLAY_VERSION := JARVIS-$(JARVIS_MOD_VERSION)-$(JARVIS_BUILD_TYPE)

PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
  ro.jarvis.display.version=$(JARVIS_DISPLAY_VERSION)
