# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Simple, fast, safe, compiled language for developing maintainable software"
HOMEPAGE="https://vlang.io"
KEYWORDS="~amd64"

SRC_URI="https://github.com/vlang/v/releases/download/${PV}/v_linux.zip -> ${P}.zip"

LICENSE="MIT"
SLOT="0"

DOCS="CHANGELOG.md CODE_OF_CONDUCT.md CONTRIBUTING.md TESTS.md LICENSE README.md"

src_compile() {
	cd "${WORKDIR}"
	make
}

src_install() {
	dobin v
}
