# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit bash-completion-r1

DESCRIPTION="A dotfile manager for the config files in your home folder"
HOMEPAGE="https://github.com/TheLocehiliosan/yadm/"
SRC_URI="https://github.com/TheLocehiliosan/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="
	app-crypt/gnupg
	dev-vcs/git"

DEPEND="${RDEPEND}"

src_compile() {

	emake "${PN}.md"

}

src_install() {

	einstalldocs

	dobin "${PN}"
	doman "${PN}.1"

	newbashcomp completion/yadm.bash_completion yadm

	insinto /usr/share/zsh/site-functions
	newins completion/yadm.zsh_completion _${PN}

}
