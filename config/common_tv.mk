# Inherit common jarvis stuff
$(call inherit-product, vendor/jarvis/config/common.mk)

# Inherit jarvis atv device tree
$(call inherit-product, device/jarvis/atv/jarvis_atv.mk)
