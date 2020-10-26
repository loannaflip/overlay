# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit git-r3 savedconfig

DESCRIPTION="a dynamic window manager for X11"
HOMEPAGE="https://dwm.suckless.org/"
EGIT_REPO_URI="https://github.com/Uniminin/DWM"

LICENSE="MIT"
SLOT="0"
KEYWORDS=""
IUSE="+xinerama"

RDEPEND="
	media-libs/fontconfig
	x11-libs/libX11
	x11-libs/libXft
	xinerama? ( x11-libs/libXinerama )
"

DEPEND="
	${RDEPEND}
	xinerama? ( x11-base/xorg-proto )
"

src_compile() {

	cd "${P}/DWM_SRC"
	make --jobs "$(nproc || printf '%s\n' 1)" build_install
	save_config config.h

}
