EAPI=7

inherit go-module

DESCRIPTION="Container Runtime Sandbox"
HOMEPAGE="https://gvisor.dev"
SRC_URI="https://github.com/Farenjihn/${PN}/archive/release-${PV}.0-go.tar.gz"

IUSE="+containerd"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64"

BDEPEND="dev-lang/go"
RDEPEND=""

S="${WORKDIR}/${PN}-release-${PV}.0-go"

src_prepare() {
    default
    sed -i "s/VERSION_MISSING/${PV}.0/" runsc/version.go
}

src_compile() {
    mkdir bin
    export GOBIN="${S}/bin"

    # `runsc` needs to be purely statically linked
    # because it's placed in its own sandbox and
    # will not find a libc or any other dynamic
    # dependency
    CGO_ENABLED=0 go install -mod vendor ./runsc/...

    # the containerd shim is now built from this project
    if use containerd; then
        go install -mod vendor ./shim/...
    fi
}

src_install() {
    dobin bin/runsc

    if use containerd; then
        newbin bin/shim containerd-shim-runsc-v1
    fi
}
