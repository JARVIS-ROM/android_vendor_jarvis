include vendor/jarvis/config/BoardConfigKernel.mk

ifeq ($(BOARD_USES_QCOM_HARDWARE),true)
include vendor/jarvis/config/BoardConfigQcom.mk
endif

include vendor/jarvis/config/BoardConfigSoong.mk
