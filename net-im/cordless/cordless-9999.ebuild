# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit desktop

EGIT_REPO_URI="https://github.com/Bios-Marcel/cordless.git"

DESCRIPTION="The Discord terminal client you never knew you wanted."
HOMEPAGE="https://github.com/Bios-Marcel/cordless"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="+X wayland"

DEPEND="
	>=dev-lang/go-1.13.0:0"

RDEPEND="${DEPEND}
	wayland? ( gui-apps/wl-clipboard )
	X? ( x11-misc/xclip )"


src_compile() {
	
	go build || die

}

src_install() {

	if [ -f cordless ]; then
		dodir /usr/bin
		dobin cordless
	fi
	
	domenu "${FILESDIR}/${PN}.desktop"

}

pkg_postinst() {

	elog "You can launch cordless executing cordless from terminal."
	elog ""
	elog "You can also launch cordless from the applications menu."

}
