# Copyright (C) 2022 JARVIS-ROM
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

AOSP_BASE := 13.0
COMPILATION_DATE := $(shell date -u +%d%m%y)
RELEASE_TYPE ?= GApps
CURRENT_DEVICE=$(shell echo "$(TARGET_PRODUCT)" | cut -d '_' -f 2,3)
RELEASE := $(AOSP_BASE)-$(RELEASE_TYPE)-$(CURRENT_DEVICE)-$(COMPILATION_DATE)

PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
  ro.jarvis.version=$(AOSP_BASE) \
  ro.jarvis.releasetype=$(RELEASE_TYPE) \
  ro.modversion=$(AOSP_BASE)
