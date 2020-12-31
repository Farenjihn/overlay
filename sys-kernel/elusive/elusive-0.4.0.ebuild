EAPI=7

CRATES="
adler-0.2.3
aho-corasick-0.7.15
ansi_term-0.11.0
anyhow-1.0.37
atty-0.2.14
autocfg-1.0.1
bitflags-1.2.1
cc-1.0.66
cfg-if-0.1.10
cfg-if-1.0.0
clap-2.33.3
crc32fast-1.2.1
either-1.6.1
env_logger-0.8.2
flate2-1.0.19
glob-0.3.0
goblin-0.3.0
hermit-abi-0.1.17
humantime-2.0.1
itertools-0.9.0
jobserver-0.1.21
lazy_static-1.4.0
libc-0.2.81
log-0.4.11
memchr-2.3.4
miniz_oxide-0.4.3
plain-0.2.3
proc-macro2-1.0.24
quote-1.0.8
regex-1.4.2
regex-syntax-0.6.21
same-file-1.0.6
scroll-0.10.2
scroll_derive-0.10.4
serde-1.0.118
serde_derive-1.0.118
strsim-0.8.0
syn-1.0.56
termcolor-1.1.2
textwrap-0.11.0
thread_local-1.0.1
toml-0.5.8
unicode-width-0.1.8
unicode-xid-0.2.1
vec_map-0.8.2
walkdir-2.3.1
winapi-0.3.9
winapi-i686-pc-windows-gnu-0.4.0
winapi-util-0.1.5
winapi-x86_64-pc-windows-gnu-0.4.0
zstd-0.6.0+zstd.1.4.8
zstd-safe-3.0.0+zstd.1.4.8
zstd-sys-1.4.19+zstd.1.4.8
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
        >=virtual/rust-1.45"

src_compile() {
    cargo_src_compile
}

src_install() {
    cargo_src_install
}
