EAPI=8
MY_PN="${PN%-bin}"
MY_BIN="${MY_PN^}"
inherit cmake flag-o-matic unpacker optfeature


DESCRIPTION="Extract closed captioning subtitles from video to SRT"
HOMEPAGE="https://www.ccextractor.org/"
SRC_URI="https://github.com/CCExtractor/ccextractorfluttergui/releases/download/v$PV/linux.zip"
S="${WORKDIR}/${P}/src"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"

BDEPEND="app-arch/unzip
		virtual/pkgconfig
		app-text/tesseract
		dev-util/ninja
		x11-libs/gtk+:3
		media-video/ccextractor"
RDEPEND="
		app-text/tesseract
		media-video/ffmpeg
		media-video/ccextractor"

DEPEND="${RDEPEND}"


src_prepare() {
	default

	sed -i \
		-e "s:/usr/share/ccextractor/Ccextractor-gui::ccextractor-gui" \
		usr/share/${MY_PN}/${MY_PN}.desktop || die
}

src_install() {
	doicon usr/share/${MY_PN}/${MY_PN}.png
	domenu usr/share/${MY_PN}/${MY_PN}.desktop
	doexe ccxgui
	insinto /opt/${MY_PN}
	doins -r usr/share/${MY_PN}/.
	fperms +x /opt/${MY_PN}/${MY_BIN}
	dosym -r /opt/${MY_PN}/${MY_BIN} /usr/bin/${MY_PN}

	pax-mark -m "${ED}"/opt/${MY_PN}/${MY_PN}
}

