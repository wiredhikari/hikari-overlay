# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit eutils desktop

DESCRIPTION="All-in-one voice and text chat"

HOMEPAGE="https://discordapp.com/"

SRC_URI="https://dl-canary.discordapp.net/apps/linux/${PV}/discord-canary-${PV}.tar.gz"
RESTRICT="mirror"
KEYWORDS="~amd64"


LICENSE="all-rights-reserved"
KEYWORDS="~amd64"
RESTRICT="mirror bindist"

RDEPEND="
app-accessibility/at-spi2-atk:2
app-accessibility/at-spi2-core:2
dev-libs/atk
dev-libs/expat
dev-libs/glib:2
dev-libs/nspr
dev-libs/nss
media-libs/alsa-lib
media-libs/fontconfig:1.0
media-libs/freetype:2
net-print/cups
sys-apps/dbus
sys-apps/util-linux
x11-libs/cairo
x11-libs/gdk-pixbuf:2
x11-libs/gtk+:3
x11-libs/libX11
x11-libs/libXScrnSaver
x11-libs/libxcb
x11-libs/libXcomposite
x11-libs/libXcursor
x11-libs/libXdamage
x11-libs/libXext
x11-libs/libXfixes
x11-libs/libXi
x11-libs/libXrandr
x11-libs/libXrender
x11-libs/libXtst
x11-libs/pango
"

src_prepare() {
	default

	sed -i \
		-e "s:/usr/share/discord/Discord:/opt/${MY_PN}/${MY_BIN}:g" \
		usr/share/${MY_PN}/${MY_PN}.desktop || die
}

src_install() {
	doicon usr/share/${MY_PN}/${MY_PN}.png
	domenu usr/share/${MY_PN}/${MY_PN}.desktop

	insinto /opt/${MY_PN}
	doins -r usr/share/${MY_PN}/.
	fperms +x /opt/${MY_PN}/${MY_BIN}
	dosym ../../opt/${MY_PN}/${MY_BIN} usr/bin/${MY_PN}

	pax-mark -m "${ED}"/opt/${MY_PN}/${MY_PN}
}
