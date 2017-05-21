# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit webapp

DESCRIPTION="self hostable application for saving web pages"
HOMEPAGE="https://www.wallabag.org"
SRC_URI="https://github.com/wallabag/wallabag/archive/${PV}.tar.gz -> ${P}.tar.gz"
LICENSE="MIT"
KEYWORDS="~amd64 ~x86"
IUSE="+mysql postgres +sqlite"

RDEPEND="
	>=virtual/httpd-php-5.4
	net-libs/nodejs[npm]
	>=dev-lang/php-5.6[pdo,session,ctype,xml,hash,simplexml,json,gd,unicode,tidy,iconv,curl,nls,tokenizer,bcmath]
	mysql? ( dev-lang/php[mysql] )
	postgres? ( dev-lang/php[postgres] )
	sqlite? ( dev-lang/php[sqlite] )
"
DEPEND="
	>=dev-lang/php-5.6
	>=dev-php/composer-1.4
"

need_httpd_cgi

#src_unpack() {
#	unpack "${P}.tar.gz"
#}

#src_prepare() {
#	php bin/console wallabag:install --env=prod || die
#	npm install || die
#	grunt || die
#	eapply_user
#}

src_install() {
	webapp_src_preinst

	dodoc -r docs/*
	rm -r docs COPYING.md CREDITS.md README.md RELEASE_PROCESS.md || die
	cp -R * "${D}/${MY_HTDOCSDIR}" || die

	webapp_src_install
}

pkg_postinst() {
	elog "Install and upgrade instructions can be found here:"
	elog "http://doc.wallabag.org/en/v2/user/installation.html"
	elog "remove var/cache after using webapp-config to install"

	webapp_pkg_postinst
}
