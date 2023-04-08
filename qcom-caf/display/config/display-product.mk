# Soong Namespace
SOONG_CONFIG_NAMESPACES += qtidisplay

# Soong Keys
SOONG_CONFIG_qtidisplay := gralloc_handle_has_reserved_size

# Soong Values
SOONG_CONFIG_qtidisplay_gralloc_handle_has_reserved_size := true

ifeq ($(TARGET_GRALLOC_HANDLE_HAS_RESERVED_SIZE),false)
    SOONG_CONFIG_qtidisplay_gralloc_handle_has_reserved_size := false
endif
