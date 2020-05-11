EAPI=7

CRATES="
adler32-1.0.4
aho-corasick-0.7.10
ansi_term-0.11.0
anyhow-1.0.28
atty-0.2.14
bitflags-1.2.1
cfg-if-0.1.10
clap-2.33.0
crc32fast-1.2.0
env_logger-0.7.1
flate2-1.0.14
fs_extra-1.1.0
getrandom-0.1.14
goblin-0.2.1
hermit-abi-0.1.12
humantime-1.3.0
lazy_static-1.4.0
libc-0.2.69
log-0.4.8
memchr-2.3.3
miniz_oxide-0.3.6
plain-0.2.3
ppv-lite86-0.2.6
proc-macro2-1.0.12
quick-error-1.2.3
quote-1.0.4
rand-0.7.3
rand_chacha-0.2.2
rand_core-0.5.1
rand_hc-0.2.0
redox_syscall-0.1.56
regex-1.3.7
regex-syntax-0.6.17
remove_dir_all-0.5.2
same-file-1.0.6
scroll-0.10.1
scroll_derive-0.10.1
serde-1.0.106
serde_derive-1.0.106
strsim-0.8.0
syn-1.0.19
tempfile-3.1.0
termcolor-1.1.0
textwrap-0.11.0
thread_local-1.0.1
toml-0.5.6
unicode-width-0.1.7
unicode-xid-0.2.0
vec_map-0.8.2
walkdir-2.3.1
wasi-0.9.0+wasi-snapshot-preview1
winapi-0.3.8
winapi-i686-pc-windows-gnu-0.4.0
winapi-util-0.1.5
winapi-x86_64-pc-windows-gnu-0.4.0
"

inherit cargo

DESCRIPTION="A simple tool to generate a cpio image for initramfs"
HOMEPAGE="https://github.com/Farenjihn/elusive"
SRC_URI="https://github.com/Farenjihn/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz
$(cargo_crate_uris ${CRATES})"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""

RDEPEND="sys-apps/kmod"

BDEPEND="${RDEPEND}
        >=virtual/rust-1.40"

src_compile() {
    cargo_src_compile
}

src_install() {
    cargo_src_install
}
