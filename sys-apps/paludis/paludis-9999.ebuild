# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

EGIT_REPO_URI="https://github.com/MageSlayer/paludis-gentoo-patches.git"
PYTHON_COMPAT=( python2_7 )
RUBY_VER=2.4

inherit bash-completion-r1 cmake-utils git-r3 python-r1 user

DESCRIPTION="Paludis, the Other Package Mangler"
HOMEPAGE="http://paludis.exherbo.org"
SRC_URI=""

IUSE="+doc pbins pink python ruby ruby_targets_ruby${RUBY_VER/./} search-index +xml -eapi7"
LICENSE="GPL-2 vim"
SLOT="0"
KEYWORDS=""

COMMON_DEPEND="
	>=app-admin/eselect-1.4.0
	>=app-shells/bash-5.0:0
	dev-libs/libpcre:=[cxx]
	sys-apps/file:=
	pbins? ( >=app-arch/libarchive-3.4.0:= )
	python? (
		${PYTHON_DEPS}
		dev-libs/boost[python,${PYTHON_USEDEP}]
	)
	ruby? ( dev-lang/ruby:${RUBY_VER} )
	search-index? ( >=dev-db/sqlite-3:= )
	xml? ( >=dev-libs/libxml2-2.8:= )"

DEPEND="
	${COMMON_DEPEND}
	>=app-text/asciidoc-9.0.0
	app-text/htmltidy
	app-text/xmlto
	>=sys-devel/gcc-9.3.0
	doc? (
		app-doc/doxygen
		python? ( dev-python/sphinx[${PYTHON_USEDEP}] )
		ruby? ( dev-ruby/syntax[ruby_targets_ruby${RUBY_VER/./}] )
	)
	virtual/pkgconfig"

RDEPEND="
	${COMMON_DEPEND}
	sys-apps/sandbox"

PDEPEND="app-eselect/eselect-package-manager"

REQUIRED_USE="
	python? ( ${PYTHON_REQUIRED_USE} )
	ruby? ( ruby_targets_ruby${RUBY_VER/./} )"

pkg_pretend() {

	if [ "${MERGE_TYPE}" != buildonly ]; then
		if id paludisbuild >/dev/null 2>/dev/null ; then
			if ! groups paludisbuild | grep --quiet '\<tty\>' ; then
				eerror "The 'paludisbuild' user is now expected to be a member of the 'tty' group."
				eerror "You should add the user to this group before upgrading paludis."
				die "Add paludisbuild to tty group!"
			fi
		fi
	fi

}

pkg_setup() {

	enewgroup "paludisbuild"
	enewuser "paludisbuild" -1 -1 "/var/tmp/paludis" "paludisbuild,tty"

	use python && python-single-r1_pkg_setup

}

src_unpack() {

		if use eapi7; then
			# want experimental EAPI7 support?
			EGIT_BRANCH="eapi7"
        else
			EGIT_BRANCH="master"
        fi
        
		git-r3_fetch
        git-r3_checkout

}

src_prepare() {

	# Fix the script shebang on Ruby scripts.
	# https://bugs.gentoo.org/show_bug.cgi?id=439372#c2
	sed -i -e "1s/ruby/&${RUBY_VER/./}/" ruby/demos/*.rb || die

	cmake-utils_src_prepare

}

src_configure() {

	local mycmakeargs=(
		-DENABLE_DOXYGEN=$(usex doc)
		-DENABLE_GTEST=OFF
		-DENABLE_PBINS=$(usex pbins)
		-DENABLE_PYTHON=$(usex python)
		-DENABLE_PYTHON_DOCS=$(usex doc) # USE=python implicit
		-DENABLE_RUBY=$(usex ruby)
		-DENABLE_RUBY_DOCS=$(usex doc) # USE=ruby implicit
		-DENABLE_SEARCH_INDEX=$(usex search-index)
		-DENABLE_VIM=ON
		-DENABLE_XML=$(usex xml)

		-DPALUDIS_COLOUR_PINK=$(usex pink)
		-DRUBY_VERSION=${RUBY_VER}
		-DPALUDIS_ENVIRONMENTS=all
		-DPALUDIS_DEFAULT_DISTRIBUTION=gentoo
		-DPALUDIS_CLIENTS=all
		-DCONFIG_FRAMEWORK=eselect

		# GNUInstallDirs
		-DCMAKE_INSTALL_DOCDIR="${EPREFIX}/usr/share/doc/${PF}"
	)

	cmake-utils_src_configure

}

src_install() {

	cmake-utils_src_install

	dobashcomp bash-completion/cave

	insinto /usr/share/zsh/site-functions
	doins zsh-completion/_cave

}

pkg_postinst() {

	local pm
	if [ -f "${ROOT}/etc/env.d/50package-manager" ] ; then
		pm=$( source "${ROOT}"/etc/env.d/50package-manager ; printf "%s\n" "${PACKAGE_MANAGER}" )
	fi

	if [ "${pm}" != paludis ] ; then
		elog "Set paludis as primary package manager:"
		elog "    eselect package-manager set paludis"
	fi

}
