# Inherit common jarvis stuff
$(call inherit-product, vendor/jarvis/config/common.mk)

# Inherit jarvis car device tree
$(call inherit-product, device/jarvis/car/jarvis_car.mk)

# Inherit the main AOSP car makefile that turns this into an Automotive build
$(call inherit-product, packages/services/Car/car_product/build/car.mk)
