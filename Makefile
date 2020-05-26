#
# Copyright (C) 2007-2016 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=nano
PKG_VERSION:=4.9.3
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.xz
PKG_SOURCE_URL:=@GNU/nano
PKG_HASH:=6e3438f033a0ed07d3d74c30d0803cbda3d2366ba1601b7bbf9b16ac371f51b4

PKG_LICENSE:=GPL-3.0-or-later
PKG_LICENSE_FILES:=COPYING
PKG_MAINTAINER:=Jonathan Bennett <JBennett@incomsystems.biz>, Hannu Nyman <hannu.nyman@iki.fi>
PKG_CPE_ID:=cpe:/a:gnu:nano

PKG_INSTALL:=1
PKG_BUILD_PARALLEL:=1

include $(INCLUDE_DIR)/package.mk

define Package/nano-c
  SUBMENU:=Editors
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=An enhanced clone of the Pico text editor
  URL:=https://www.nano-editor.org/
  DEPENDS:=+libncurses +zlib
endef

define Package/nano-c/description
  Nano (Nano's ANOther editor, or Not ANOther editor) is an enhanced clone
  of the Pico text editor, color highlight enabled.
endef

CONFIGURE_ARGS += \
        --enable-utf8 \
        --without-slang \
        --enable-color \
        --enable-nanorc \
        --disable-option-checking \
        --disable-dependency-tracking \
        --disable-largefile \
        --disable-threads \
        --disable-nls \
        --disable-rpath \
        --disable-browser \
        --disable-mouse \
        --disable-speller \

CONFIGURE_VARS += \
	ac_cv_header_regex_h=no \

define Package/nano-c/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/$(PKG_NAME) $(1)/usr/bin/
endef

$(eval $(call BuildPackage,nano-c))

