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

# JARVIS OTA update package

JARVIS_TARGET_PACKAGE := $(PRODUCT_OUT)/JARVIS-$(RELEASE).zip

.PHONY: jarvis
jarvis: $(INTERNAL_OTA_PACKAGE_TARGET)
	$(hide) ln -f $(INTERNAL_OTA_PACKAGE_TARGET) $(JARVIS_TARGET_PACKAGE)
	$(hide) $(MD5SUM) $(JARVIS_TARGET_PACKAGE) | sed "s|$(PRODUCT_OUT)/||" > $(JARVIS_TARGET_PACKAGE).md5sum
	@echo "Package Complete: $(JARVIS_TARGET_PACKAGE)" >&2
