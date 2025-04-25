ULTRALYTICS_THOP_VERSION = edb3b10
ULTRALYTICS_THOP_SITE_METHOD = git
ULTRALYTICS_THOP_SITE = https://github.com/ultralytics/thop.git

ULTRALYTICS_THOP_DEPENDENCIES = \
    python-torch \
    python-numpy

ULTRALYTICS_THOP_SETUP_TYPE = setuptools
# Commande de construction (compilation)
define ULTRALYTICS_THOP_BUILD_CMDS
    cd $(@D) && $(HOST_DIR)/bin/python3 setup.py build
endef

# Commande d'installation vers l'image de Buildroot
define ULTRALYTICS_THOP_INSTALL_TARGET_CMDS
    cd $(@D) && $(HOST_DIR)/bin/python3 setup.py install --prefix=$(TARGET_DIR)/usr
endef


$(eval $(python-package))
