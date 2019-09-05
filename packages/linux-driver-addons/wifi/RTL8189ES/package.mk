# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2017-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="RTL8189ES"
PKG_VERSION="28d8425"
PKG_REV="102"
PKG_SHA256="5e9b9e9b106970d6757beadbe35656461b6fbe1e56696aaa6fd0c78829d630de"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="https://github.com/jwrdegoede/rtl8189ES_linux/"
PKG_URL="https://github.com/jwrdegoede/rtl8189ES_linux/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain linux"
PKG_NEED_UNPACK="$LINUX_DEPENDS"
PKG_SECTION="driver.wifi"
PKG_LONGDESC="Realtek RTL8189ES Linux driver"
PKG_IS_KERNEL_PKG="yes"

PKG_IS_ADDON="embedded"
PKG_ADDON_IS_STANDALONE="yes"
PKG_ADDON_NAME="RTL8189ES wifi drivers"
PKG_ADDON_TYPE="xbmc.service"
PKG_ADDON_VERSION="${ADDON_VERSION}.${PKG_REV}"

pre_make_target() {
  unset LDFLAGS
}

make_target() {

  make ARCH=$TARGET_KERNEL_ARCH \
    KSRC=$(kernel_path) \
    CROSS_COMPILE=$TARGET_KERNEL_PREFIX 
}

makeinstall_target() {
  install_driver_addon_files "$PKG_BUILD/"
}
