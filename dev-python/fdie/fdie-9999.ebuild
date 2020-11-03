# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{6,7,8} )

inherit distutils-r1 git-r3

EGIT_REPO_URI="https://github.com/Uniminin/Fdie.git"
KEYWORDS="~amd64"

DESCRIPTION="Simplified Assertion For Your PYTHON Code"
HOMEPAGE="https://github.com/Uniminin/Fdie"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"
