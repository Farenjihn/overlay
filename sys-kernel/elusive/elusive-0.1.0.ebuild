EAPI=7

CRATES="
ansi_term-0.11.0
atty-0.2.13
bitflags-1.2.1
c2-chacha-0.2.3
cfg-if-0.1.10
clap-2.33.0
elusive-0.1.0
fs_extra-1.1.0
getrandom-0.1.13
goblin-0.1.1
libc-0.2.65
log-0.4.8
plain-0.2.3
ppv-lite86-0.2.6
proc-macro2-1.0.6
quote-1.0.2
rand-0.7.2
rand_chacha-0.2.1
rand_core-0.5.1
rand_hc-0.2.0
redox_syscall-0.1.56
remove_dir_all-0.5.2
scroll-0.10.1
scroll_derive-0.10.1
serde-1.0.102
serde_derive-1.0.102
strsim-0.8.0
syn-1.0.8
tempfile-3.1.0
textwrap-0.11.0
toml-0.5.5
unicode-width-0.1.6
unicode-xid-0.2.0
vec_map-0.8.1
wasi-0.7.0
winapi-0.3.8
winapi-i686-pc-windows-gnu-0.4.0
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

RDEPEND="app-arch/cpio
        app-arch/gzip
        sys-apps/findutils"

BDEPEND="${RDEPEND}
        virtual/rust"

src_compile() {
    cargo_src_compile
}

src_install() {
    cargo_src_install --path=.
}
