ifeq ($(TARGET_BOARD_PLATFORM),msm8937)
PRODUCT_COPY_FILES += device/xiaomi/jasmine_sprout/qcom-caf/media/conf_files/msm8937/media_profiles_8937.xml:system/etc/media_profiles.xml \
                      device/xiaomi/jasmine_sprout/qcom-caf/media/conf_files/msm8937/media_codecs_8937.xml:system/etc/media_codecs.xml \
                      device/xiaomi/jasmine_sprout/qcom-caf/media/conf_files/msm8937/media_codecs_performance_8937.xml:system/etc/media_codecs_performance.xml
endif #TARGET_BOARD_PLATFORM
