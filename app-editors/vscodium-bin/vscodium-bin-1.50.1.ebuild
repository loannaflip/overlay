# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit desktop pax-utils

MY_PN="${PN/-bin}"

DESCRIPTION="Free/Libre Open Source Software Binaries of VSCode"
HOMEPAGE="https://vscodium.com"

SRC_URI="
	amd64? ( https://github.com/VSCodium/vscodium/releases/download/${PV}/VSCodium-linux-x64-${PV}.tar.gz )
	arm? ( https://github.com/VSCodium/vscodium/releases/download/${PV}/VSCodium-linux-armhf-${PV}.tar.gz )
	arm64? ( https://github.com/VSCodium/vscodium/releases/download/${PV}/VSCodium-linux-arm64-${PV}.tar.gz )"

RESTRICT="mirror strip bindist"

LICENSE="MIT"
SLOT="0"
KEYWORDS="-* ~amd64 ~arm ~arm64"
IUSE="+libsecret -cups +libnotify +nss +cairo"

DEPEND="
	!app-editors/vscodium
	>=x11-libs/gtk+-3.0:3
	media-libs/libpng
	x11-libs/cairo
	x11-libs/libXtst"

RDEPEND="
	${DEPEND}
	dev-libs/nss
	app-accessibility/at-spi2-atk
	media-libs/alsa-lib
	x11-libs/libnotify
	x11-libs/libXScrnSaver
	net-print/cups
	app-crypt/libsecret[crypt]"

QA_PRESTRIPPED="*"
QA_PREBUILT="opt/${MY_PN}/codium"

S="${WORKDIR}"


src_install() {

	mkdir -p "${ED%/}/opt/${MY_PN}"
	cp -r . "${ED%/}/opt/${MY_PN}/"
	
	dodir /usr/bin
	dosym ../../opt/${MY_PN}/bin/codium /usr/bin/${MY_PN}
	dosym ../../opt/${MY_PN}/bin/codium /usr/bin/codium
	domenu "${FILESDIR}/${PN}.desktop"
	
	newicon "resources/app/resources/linux/code.png" ${MY_PN}.png	
	pax-mark m "${ED%/}"/opt/${MY_PN}/codium

}

pkg_postinst() {

	elog "You may install some additional utils, so check them in:"
	elog "https://code.visualstudio.com/Docs/setup#_additional-tools"
	echo
	elog "Upstream renamed the binary from vscodium to codium."
	elog "You can launch vscodium from terminal executing codium or vscodium."

}
