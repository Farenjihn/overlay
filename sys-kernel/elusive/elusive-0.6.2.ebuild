EAPI=7

CRATES="
adler-1.0.2
aho-corasick-0.7.18
ansi_term-0.11.0
anyhow-1.0.41
atty-0.2.14
autocfg-1.0.1
bitflags-1.2.1
cc-1.0.68
cfg-if-1.0.0
clap-2.33.3
crc32fast-1.2.1
env_logger-0.8.4
flate2-1.0.20
hermit-abi-0.1.19
humantime-2.1.0
jobserver-0.1.22
libc-0.2.97
log-0.4.14
memchr-2.4.0
miniz_oxide-0.4.4
object-0.25.3
proc-macro2-1.0.27
quote-1.0.9
regex-1.5.4
regex-syntax-0.6.25
same-file-1.0.6
serde-1.0.126
serde_derive-1.0.126
strsim-0.8.0
syn-1.0.73
termcolor-1.1.2
textwrap-0.11.0
toml-0.5.8
unicode-width-0.1.8
unicode-xid-0.2.2
vec_map-0.8.2
walkdir-2.3.2
winapi-0.3.9
winapi-i686-pc-windows-gnu-0.4.0
winapi-util-0.1.5
winapi-x86_64-pc-windows-gnu-0.4.0
zstd-0.9.0+zstd.1.5.0
zstd-safe-4.1.1+zstd.1.5.0
zstd-sys-1.6.1+zstd.1.5.0
"

inherit cargo

DESCRIPTION="A simple tool to generate a cpio image for initramfs"
HOMEPAGE="https://github.com/Farenjihn/elusive"
SRC_URI="https://github.com/Farenjihn/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz
$(cargo_crate_uris ${CRATES})"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64"

DEPEND=""

RDEPEND="sys-apps/kmod"

BDEPEND="${RDEPEND}
        >=virtual/rust-1.47"

src_compile() {
    cargo_src_compile
}

src_install() {
    cargo_src_install
}
