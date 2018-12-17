# Copyright 1999-2018 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Simple cloud storage for command line users"
HOMEPAGE="http://push.tf"
SRC_URI="https://github.com/${PN}/${PN}-client/archive/master.zip"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="net-misc/curl"
RDEPEND="${DEPEND}"
BDEPEND=""

src_prepare() {
	eapply "${FILESDIR}/installpath.patch"
	eapply_user
}

S="${WORKDIR}/pushtf-client-master/"

src_install() {
	mkdir -p "${D}/usr/bin"
	emake DESTDIR="${D}/usr/bin/" install
}
