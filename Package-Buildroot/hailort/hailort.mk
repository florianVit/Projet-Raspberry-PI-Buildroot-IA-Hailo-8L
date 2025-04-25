HAILORT_VERSION = v4.21.0
HAILORT_SITE_METHOD = git
HAILORT_SITE = https://github.com/hailo-ai/hailort.git
HAILORT_GIT_SUBMODULES = YES
HAILORT_CONF_OPTS += -DCMAKE_INSTALL_PREFIX=/usr
HAILORT_LICENSE = MIT
HAILORT_LICENSE_FILES = hailort/LICENSE
HAILORT_SUPPORTS_IN_SOURCE_BUILD = NO

HAILORT_DEPENDENCIES = host-protobuf protobuf eigen spdlog

HAILORT_CONF_OPTS += -DCMAKE_TOOLCHAIN_FILE=$(CMAKE_TOOLCHAIN_FILE)
HAILORT_CONF_OPTS += -DCMAKE_INSTALL_PREFIX=$(TARGET_DIR)
HAILORT_CONF_OPTS += -DEigen3_DIR=$(STAGING_DIR)/usr/share/eigen3/cmake
HAILORT_CONF_OPTS += -DSPDLOG_DIR=$(STAGING_DIR)/usr
HAILORT_CONF_OPTS += -DPROTOBUF_DIR=$(STAGING_DIR)/usr
HAILORT_CONF_OPTS += -DBUILD_DOC=OFF -DBUILD_TESTS=OFF -DBUILD_EXAMPLES=OFF
HAILORT_CONF_OPTS += -DCMAKE_INSTALL_PREFIX=/usr
HAILORT_CONF_ENV += CMAKE_INSTALL_PREFIX=/usr



define HAILORT_PRE_CONFIGURE_HOOK
    echo 'Ajout de l\'export manquant pour les *_proto...'
    echo 'install(TARGETS hef_proto EXPORT HailoRTTargets)' >> $(HAILORT_SRCDIR)/hailort/hrpc_protocol/CMakeLists.txt
    echo 'install(TARGETS profiler_proto EXPORT HailoRTTargets)' >> $(HAILORT_SRCDIR)/hailort/hrpc_protocol/CMakeLists.txt
    echo 'install(TARGETS scheduler_mon_proto EXPORT HailoRTTargets)' >> $(HAILORT_SRCDIR)/hailort/hrpc_protocol/CMakeLists.txt
endef



$(eval $(cmake-package))
