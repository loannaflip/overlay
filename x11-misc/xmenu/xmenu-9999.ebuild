# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

SCM="git-r3"
EGIT_REPO_URI="https://github.com/phillbush/xmenu.git"

inherit eutils ${SCM}

DESCRIPTION="a x11 menu utility"
HOMEPAGE="https://github.com/phillbush/xmenu"

SRC_URI=""
KEYWORDS="~amd64"

LICENSE="MIT"
SLOT="0"
IUSE=""

DEPEND="media-libs/fontconfig
	media-libs/imlib2
	x11-libs/libX11
	x11-libs/libXft
	x11-libs/libXinerama"

RDEPEND="${DEPEND}"
BDEPEND=""

src_install() {

	emake PREFIX= DESTDIR="${D}" MANPREFIX="/usr/share/man" install

}
