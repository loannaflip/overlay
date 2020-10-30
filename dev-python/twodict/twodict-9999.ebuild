# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python2_7 )

inherit distutils-r1

DESCRIPTION="Simple two way ordered dictionary for Python"
HOMEPAGE="https://github.com/MrS0m30n3/twodict"
LICENSE="Unlicense"
KEYWORDS="~amd64 ~x86"

inherit git-r3
EGIT_REPO_URI="https://github.com/MrS0m30n3/${PN}"

SLOT="0"
DEPEND=""
RDEPEND="${PYTHON_DEPS}"
