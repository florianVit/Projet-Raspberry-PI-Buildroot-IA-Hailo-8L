################################################################################
#
# python-numpy & host-python-numpy
#
################################################################################

PYTHON_NUMPY_VERSION = v2.0.0
PYTHON_NUMPY_GIT_REPO = https://github.com/numpy/numpy.git

# Pour la cible
PYTHON_NUMPY_SITE = $(PYTHON_NUMPY_GIT_REPO)
PYTHON_NUMPY_SITE_METHOD = git
PYTHON_NUMPY_GIT_SUBMODULES = YES
PYTHON_NUMPY_SETUP_TYPE = setuptools

# Pour l'host
HOST_PYTHON_NUMPY_VERSION = $(PYTHON_NUMPY_VERSION)
HOST_PYTHON_NUMPY_SITE = $(PYTHON_NUMPY_GIT_REPO)
HOST_PYTHON_NUMPY_SITE_METHOD = git
HOST_PYTHON_NUMPY_GIT_SUBMODULES = YES
HOST_PYTHON_NUMPY_SETUP_TYPE = setuptools



# Clone des sources depuis le github
define PYTHON_NUMPY_EXTRACT_CMDS
	git clone --branch $(PYTHON_NUMPY_VERSION) $(PYTHON_NUMPY_GIT_REPO) $(PYTHON_NUMPY_SOURCE_DIR)
endef

# Dépendances
PYTHON_NUMPY_DEPENDENCIES = host-python-cython python3
HOST_PYTHON_NUMPY_DEPENDENCIES = host-python-cython

#Pour le problème avec le setup.py
define PYTHON_NUMPY_BUILD
	cd $(PYTHON_NUMPY_SOURCE_DIR) && python3 setup.py build
endef
PYTHON_NUMPY_BUILD_HOOKS += PYTHON_NUMPY_BUILD

# Si besoin de lapack
ifeq ($(BR2_PACKAGE_LAPACK),y)
	PYTHON_NUMPY_DEPENDENCIES += lapack
	PYTHON_NUMPY_CONF_OPTS += -Dlapack=lapack
else
	PYTHON_NUMPY_CONF_OPTS += -Dlapack=""
endif
#Si besoin de openblas
ifeq ($(BR2_PACKAGE_OPENBLAS),y)
	PYTHON_NUMPY_DEPENDENCIES += openblas
	PYTHON_NUMPY_CONF_OPTS += -Dblas=openblas
else
	PYTHON_NUMPY_CONF_OPTS += -Dblas=""
endif

# Quand problème npymath
define PYTHON_NUMPY_FIXUP_NPY_PKG_CONFIG_FILES
	$(SED) '/^pkgdir=/d;/^prefix=/i pkgdir=$(PYTHON3_PATH)/site-packages/numpy/core' \
		$(PYTHON3_PATH)/site-packages/numpy/core/lib/npy-pkg-config/npymath.ini
endef
PYTHON_NUMPY_POST_INSTALL_STAGING_HOOKS += PYTHON_NUMPY_FIXUP_NPY_PKG_CONFIG_FILES
PYTHON_NUMPY_INSTALL_STAGING = YES
#Pour mettre les sources dans un endroit visible par le compilateur
define PYTHON_NUMPY_EXTRACT_CMDS
	rm -rf $(@D)
	mkdir -p $(@D)
	cp -a $(DL_DIR)/python-numpy/git/. $(@D)/
endef
# tentative de correction de l'erreur meson
PYTHON_NUMPY_BUILD_OPTS = \
	--config-setting=setup-args=--cross-file=$(PWD)/package/python-numpy/meson-cross-aarch64.txt

$(eval $(python-package))
$(eval $(host-python-package))
