SEABORN_VERSION = 86b5481
SEABORN_SITE_METHOD = git
SEABORN_SITE = https://github.com/mwaskom/seaborn.git

SEABORN_DEPENDENCIES = \
    python-matplotlib \
    python-numpy \
    python-pandas \
    python-scipy
    
SEABORN_SETUP_TYPE = setuptools

# Commande de construction (compilation)
define SEABORN_BUILD_CMDS
    cd $(@D) && $(HOST_DIR)/bin/python3 setup.py build
endef

# Commande d'installation vers l'image de Buildroot
define SEABORN_INSTALL_TARGET_CMDS
    cd $(@D) && $(HOST_DIR)/bin/python3 setup.py install --prefix=$(TARGET_DIR)/usr
endef


$(eval $(python-package))
