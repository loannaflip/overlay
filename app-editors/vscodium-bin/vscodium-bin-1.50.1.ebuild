# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

MY_PN="${PN/-bin/}"

inherit eutils desktop xdg-utils

DESCRIPTION="Free/Libre Open Source Software Binaries of VSCode"
HOMEPAGE="https://vscodium.com"
SRC_URI="https://github.com/VSCodium/vscodium/releases/download/${PV}/VSCodium-linux-x64-${PV}.tar.gz"
RESTRICT="mirror strip bindist"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="libsecret"

DEPEND="
	>=x11-libs/gtk+-3.0:3
	media-libs/libpng
	x11-libs/cairo
	x11-libs/libXtst"

RDEPEND="
	${DEPEND}
	dev-libs/nss
	media-libs/alsa-lib
	net-print/cups"

QA_PREBUILT="opt/${MY_PN}/*"

S="${WORKDIR}"

src_install() {

    # Install in /opt
    dodir /opt
    cp -pPR "${S}" "${D}/opt/${MY_PN}"
    fperms 0755 /opt/${MY_PN}

    dosym "../../opt/${MY_PN}/bin/codium" "/usr/bin/vs${MY_PN}"
    dosym "../../opt/${MY_PN}/bin/codium" "/usr/bin/vscodium"
    make_desktop_entry "${MY_PN}" "VSCodium" "${MY_PN}" "Editor;Development;IDE"
	newicon "resources/app/resources/linux/code.png" "${MY_PN}.png"

}

pkg_postinst() {

	xdg_desktop_database_update
    xdg_icon_cache_update
    xdg_mimeinfo_database_update

}

pkg_postrm() {

	xdg_desktop_database_update
    xdg_icon_cache_update
    xdg_mimeinfo_database_update

}
