# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit desktop git-r3

EGO_PN="github.com/Bios-Marcel/${PN}"
EGIT_REPO_URI="https://${EGO_PN}.git"

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


src_unpack() {
		
	git-r3_src_unpack
	S="${WORKDIR}/${PN}"

}

src_compile() {
	
	mkdir build || die
	go build -o build ./... || die

}

src_install() {
	
	dodir /usr/bin
	dobin "build/${PN}"
	domenu "${FILESDIR}/${PN}.desktop"

}

pkg_postinst() {

	elog "You can launch cordless executing cordless from terminal."
	elog "You can also launch cordless from the applications menu."
	elog ""
	elog "In order to login with cordless, check the upstream guide:"
	elog "https://github.com/Bios-Marcel/cordless#login"
	elog ""
	elog "For manual press ALT+Dot and type 'manual'"
	elog ""
	elog "A list of cordless keybindings:"
	elog "https://github.com/Bios-Marcel/cordless#quick-overview---navigation-switching-between-boxes--containers"
}
