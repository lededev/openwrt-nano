#
# Copyright (C) 2007-2016 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=nano
PKG_O_NAME:=nano
PKG_VERSION:=4.0
PKG_RELEASE:=1
PKG_LICENSE:=GPL-3.0+
PKG_LICENSE_FILES:=COPYING

PKG_SOURCE:=$(PKG_O_NAME)-$(PKG_VERSION).tar.xz
PKG_SOURCE_URL:=@GNU/nano
PKG_HASH:=1e2fcfea35784624a7d86785768b772d58bb3995d1aec9176a27a113b1e9bac3

PKG_INSTALL:=1
PKG_BUILD_PARALLEL:=1

include $(INCLUDE_DIR)/package.mk

define Package/nano-c
  SUBMENU:=Editors
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=Color An enhanced clone of the Pico text editor
  URL:=http://www.nano-editor.org/
  MAINTAINER:=Jonathan Bennett <JBennett@incomsystems.biz>, \
		Hannu Nyman <hannu.nyman@iki.fi>
  DEPENDS:=+libncurses
endef

define Package/nano-c/description
  Nano (Nano's ANOther editor, or Not ANOther editor) is an enhanced clone
  of the Pico text editor, color highlight enabled.
endef

CONFIGURE_ARGS += \
	--enable-tiny \
	--disable-utf8 \
	--without-slang \
	--enable-color \
	--enable-nanorc \

CONFIGURE_VARS += \
	ac_cv_header_regex_h=no \

define Package/nano-c/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/$(PKG_O_NAME) $(1)/usr/bin/
endef

$(eval $(call BuildPackage,nano-c))

