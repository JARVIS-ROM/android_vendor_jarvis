include vendor/jarvis/configs/BoardConfigKernel.mk

ifeq ($(BOARD_USES_QCOM_HARDWARE),true)
include vendor/jarvis/configs/BoardConfigQcom.mk
endif

include vendor/jarvis/configs/BoardConfigSoong.mk
