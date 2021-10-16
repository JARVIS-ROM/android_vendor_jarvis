# Set jarvis specific identifier for Android Go enabled products
PRODUCT_TYPE := go

# Inherit mini common jarvis stuff
$(call inherit-product, vendor/jarvis/config/common_mini_phone.mk)
