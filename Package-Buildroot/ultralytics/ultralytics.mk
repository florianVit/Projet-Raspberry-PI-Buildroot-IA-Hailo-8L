ULTRALYTICS_VERSION = 6ebf893
ULTRALYTICS_SITE_METHOD = git
ULTRALYTICS_SITE = https://github.com/ultralytics/ultralytics.git

ULTRALYTICS_DEPENDENCIES = \
    python3 \
    python-numpy \
    python-cpuinfo \
    python-yaml \
    python-psutil \
    python-matplotlib \
    python-requests \
    python-tqdm \
    python-typing-extensions \
    python-packaging \
    python-cycler \
    python-kiwisolver \
    python-mpmath \
    python-sympy \
    python-pillow \
    python-scipy \
    python-torch \
    python-torchvision \
    python-pandas \
    python-seaborn \
    python-ultralytics-thop


ULTRALYTICS_SETUP_TYPE = setuptools
# Commande de construction (compilation)
define ULTRALYTICS_BUILD_CMDS
    cd $(@D) && $(HOST_DIR)/bin/python3 setup.py build
endef

# Commande d'installation vers l'image de Buildroot
define ULTRALYTICS_INSTALL_TARGET_CMDS
    cd $(@D) && $(HOST_DIR)/bin/python3 setup.py install --prefix=$(TARGET_DIR)/usr
endef


$(eval $(python-package))
