TORCHVISION_VERSION = ef4718a
TORCHVISION_SITE_METHOD = git
TORCHVISION_SITE = https://github.com/pytorch/vision.git

TORCHVISION_DEPENDENCIES = \
    python-torch \
    python-numpy \
    python-pillow \
    python-requests

TORCHVISION_SETUP_TYPE = setuptools
# Commande de construction (compilation)
define TORCHVISION_BUILD_CMDS
    cd $(@D) && $(HOST_DIR)/bin/python3 setup.py build
endef

# Commande d'installation vers l'image de Buildroot
define TORCHVISION_INSTALL_TARGET_CMDS
    cd $(@D) && $(HOST_DIR)/bin/python3 setup.py install --prefix=$(TARGET_DIR)/usr
endef


$(eval $(python-package))
