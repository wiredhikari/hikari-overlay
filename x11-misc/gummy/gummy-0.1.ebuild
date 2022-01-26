# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="Adaptive screen brightness/temperature"
HOMEPAGE="https://github.com/Fushko/gummy"

if [[ "${PV}" == *9999* ]]; then
    inherit git-r3
    EGIT_REPO_URI="https://github.com/Fushko/${PN}.git"
else
    SRC_URI="https://github.com/Fushko/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"
    KEYWORDS="~amd64"
fi

LICENSE="GPL-3"
SLOT="0"

RDEPEND="
    dev-qt/qtcore:5
    dev-qt/qtgui:5
    dev-qt/qtdbus:5
    dev-qt/qtwidgets:5
    x11-libs/libXxf86vm
    x11-misc/xcb
    "
DEPEND="
    ${RDEPEND}
    media-gfx/imagemagick
"
