# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Simple, fast, safe, compiled language for developing maintainable software"
HOMEPAGE="https://vlang.io"

if [[ ${PV} == "9999" ]]; then
	EGIT_REPO_URI="https://github.com/vlang/v.git"
	inherit git-r3
else
	SRC_URI="
		https://github.com/vlang/v/releases/download/v${PV}/v.zip -> ${P}.zip
		https://raw.githubusercontent.com/vlang/vc/master/v.c -> v.c"
	KEYWORDS="~amd64"
fi

LICENSE="MIT"
SLOT="0"

S="${WORKDIR}"

DOCS="CHANGELOG.md CODE_OF_CONDUCT.md CONTRIBUTING.md TESTS.md LICENSE README.md"

src_compile() {
	cd "${WORKDIR}"
	cc -std=gnu11 -w -o v "${DISTDIR}"/v.c
	./v -o v compiler
}

src_install() {
	dobin v
}
