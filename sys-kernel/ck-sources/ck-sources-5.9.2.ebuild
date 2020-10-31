# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="6"
ETYPE="sources"
KEYWORDS="~amd64 ~x86"

HOMEPAGE="http://kernel.kolivas.org/"

K_SECURITY_UNSUPPORTED="1"

CK_EXTRAVERSION="ck1"

inherit kernel-2
detect_version
detect_arch

DESCRIPTION="Linux ${K_BRANCH_ID}, with Con Kolivas' MuQSS scheduler and patchset"

K_BRANCH_ID="${KV_MAJOR}.${KV_MINOR}"

CK_URI="http://ck.kolivas.org/patches/5.0/${K_BRANCH_ID}/${K_BRANCH_ID}-${CK_EXTRAVERSION}/patch-${K_BRANCH_ID}-${CK_EXTRAVERSION}.xz"

SRC_URI="
	${KERNEL_URI}
	${ARCH_URI}
	${CK_URI}"

UNIPATCH_LIST="
	${FILESDIR}/0006-init-Kconfig-enable-O3-for-all-arches.patch
	${FILESDIR}/4567_distro-Gentoo-Kconfig.patch
	${DISTDIR}/patch-${K_BRANCH_ID}-${CK_EXTRAVERSION}.xz
	${FILESDIR}/${CK_EXTRAVERSION}-revert-version.patch"

UNIPATCH_STRICTORDER="yes"
