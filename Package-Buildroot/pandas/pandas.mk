PANDAS_VERSION = 7e4d306
PANDAS_SITE_METHOD = git
PANDAS_SITE = https://github.com/pandas-dev/pandas.git

PANDAS_DEPENDENCIES = \
    python-numpy \

PANDAS_SETUP_TYPE = setuptools

# Commande de construction (compilation) - Utilisation de Python de l'hôte
define PANDAS_BUILD_CMDS
    cd $(@D) && $(HOST_DIR)/bin/python3 setup.py build
endef

# Commande d'installation vers l'image de Buildroot
define PANDAS_INSTALL_TARGET_CMDS
    cd $(@D) && $(HOST_DIR)/bin/python3 setup.py install --prefix=$(TARGET_DIR)/usr
endef

$(eval $(python-package))

