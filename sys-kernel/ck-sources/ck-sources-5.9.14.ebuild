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
	${FILESDIR}/0000-sphinx-workaround.patch
	${FILESDIR}/0001-ZEN-Add-sysctl-and-CONFIG-to-disallow-unprivileged-C.patch
	${FILESDIR}/0002-Bluetooth-Fix-LL-PRivacy-BLE-device-fails-to-connect.patch
	${FILESDIR}/0003-Bluetooth-Fix-attempting-to-set-RPA-timeout-when-uns.patch
	${FILESDIR}/0004-HID-quirks-Add-Apple-Magic-Trackpad-2-to-hid_have_sp.patch
	${FILESDIR}/enable_additional_cpu_optimizations_for_gcc_v10.patch
	${FILESDIR}/0006-init-Kconfig-enable-O3-for-all-arches.patch
	${FILESDIR}/4567_distro-Gentoo-Kconfig.patch
	${DISTDIR}/patch-${K_BRANCH_ID}-${CK_EXTRAVERSION}.xz
	${FILESDIR}/${CK_EXTRAVERSION}-revert-version.patch"

UNIPATCH_STRICTORDER="yes"
