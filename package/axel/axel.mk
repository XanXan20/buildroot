################################################################################
#
# axel
#
################################################################################

AXEL_VERSION = 2.17.14
AXEL_SITE = https://github.com/axel-download-accelerator/axel/releases/download/v$(AXEL_VERSION)
AXEL_SOURCE = axel-$(AXEL_VERSION).tar.xz
AXEL_LICENSE = GPL-2.0+
AXEL_LICENSE_FILES = COPYING
AXEL_CPE_ID_VALID = YES
AXEL_DEPENDENCIES = host-pkgconf $(TARGET_NLS_DEPENDENCIES)

AXEL_CONF_OPTS = \
	CFLAGS="$(TARGET_CFLAGS)"

ifeq ($(BR2_PACKAGE_OPENSSL),y)
AXEL_CONF_OPTS += --with-ssl=openssl
AXEL_DEPENDENCIES += openssl
else ifeq ($(BR2_PACKAGE_WOLFSSL_ALL),y)
AXEL_CONF_OPTS += --with-ssl=wolfssl
AXEL_DEPENDENCIES += wolfssl
else
AXEL_CONF_OPTS += --without-ssl
endif

$(eval $(autotools-package))
