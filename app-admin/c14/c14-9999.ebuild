# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
EGO_PN=github.com/online-net/c14-cli/...
EGO_SRC=github.com/online-net/c14-cli

inherit golang-vcs golang-build

DESCRIPTION="Manage your C14 Online Cold Storage from Command Line"
HOMEPAGE="https://www.online.net/en/c14"
SRC_URI="https://github.com/online-net/c14-cli.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=">=dev-lang/go-1.6"
RDEPEND="${DEPEND}"

src_compile() {
	# cp -sR "$(go env GOROOT)" "${T}/goroot" || die
	# rm -rf "${T}/goroot/src/${EGO_SRC}" || die
	# rm -rf "${T}/goroot/pkg/$(go env GOOS)_$(go env GOARCH)/${EGO_SRC}" || die
	# export GOROOT="${T}/goroot"
	golang-build_src_compile
}

src_install() {
	golang-build_src_install
	einstalldocs
dobin bin/*
}
