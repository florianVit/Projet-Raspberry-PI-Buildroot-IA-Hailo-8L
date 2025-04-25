PYTORCH_VERSION = 70b34a4
PYTORCH_SITE_METHOD = git
PYTORCH_SITE = https://github.com/pytorch/pytorch.git

PYTORCH_DEPENDENCIES = \
    python3 \
    python-numpy \
    python-yaml \
    python-typing-extensions \
    python-requests

TORCH_SETUP_TYPE = setuptools
# Commande de construction (compilation)
define PYTORCH_BUILD_CMDS
    cd $(@D) && $(HOST_DIR)/bin/python3 setup.py build
endef

# Commande d'installation vers l'image de Buildroot
define PYTORCH_INSTALL_TARGET_CMDS
    cd $(@D) && $(HOST_DIR)/bin/python3 setup.py install --prefix=$(TARGET_DIR)/usr
endef


$(eval $(python-package))
