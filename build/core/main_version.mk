# Version
JARVIS_VERSION := 12
JARVIS_BUILDTYPE ?= unofficial

# Build fingerprint
ifneq ($(BUILD_FINGERPRINT),)
ADDITIONAL_SYSTEM_PROPERTIES += \
    ro.build.fingerprint=$(BUILD_FINGERPRINT)
endif

# JARVIS System Version
ADDITIONAL_SYSTEM_PROPERTIES += \
    ro.jarvis.version=$(JARVIS_VERSION) \
    ro.jarvis.releasetype=$(JARVIS_BUILDTYPE) \
    ro.jarvis.build.version=$(JARVIS_VERSION) \
    ro.modversion=$(JARVIS_VERSION)

# JARVIS Platform Display Version
ADDITIONAL_SYSTEM_PROPERTIES += \
    ro.jarvis.display.version=$(JARVIS_VERSION)
