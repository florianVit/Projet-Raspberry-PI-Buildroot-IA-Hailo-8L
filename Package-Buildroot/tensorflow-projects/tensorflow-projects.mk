################################################################################
# tensorflow-projects.mk - Exemple de paquet perso avec TFLite
################################################################################

TENSORFLOW_PROJECTS_SITE = $(TOPDIR)/package/tensorflow-projects
TENSORFLOW_PROJECTS_SITE_METHOD = local

TENSORFLOW_PROJECTS_DEPENDENCIES = tensorflow-lite

TENSORFLOW_PROJECTS_BUILD_CMDS = \
    $(TARGET_CXX) -std=c++17 \
    $(shell PKG_CONFIG_SYSROOT_DIR=$(STAGING_DIR) \
             PKG_CONFIG_LIBDIR=$(STAGING_DIR)/usr/lib/pkgconfig \
             pkg-config --cflags --libs opencv4) \
    -ltensorflow-lite \
    $(@D)/main.cpp -o $(@D)/tflite_demo


define TENSORFLOW_PROJECTS_INSTALL_TARGET_CMDS
    $(INSTALL) -D $(@D)/tflite_demo $(TARGET_DIR)/usr/bin/tflite_demo
    $(INSTALL) -D $(TENSORFLOW_PROJECTS_PKGDIR)/model.tflite $(TARGET_DIR)/usr/share/tflite/model.tflite
endef

$(eval $(generic-package))
