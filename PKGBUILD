# Maintainer: VHSgunzo <vhsgunzo.github.io>

pkgname='runimage-static'
pkgver='0.40.1'
pkgrel='1'
pkgdesc='Tools and sharun wrapper over RunImage rootfs to run the container.'
url="https://github.com/VHSgunzo/runimage-static"
arch=('x86_64' 'aarch64')
license=('MIT')
options=(!strip)
sharunver='v0.2.3'
sharunurl='https://github.com/VHSgunzo/sharun/releases/download'
source=('bin.list' "$sharunurl/$sharunver/sharun-${CARCH}")
sha256sums=('SKIP' 'SKIP')
install='static.install'
depends=(
  bash coreutils curl findutils gawk grep iproute2
  kmod procps-ng sed tar util-linux which gocryptfs
  libnotify lsof slirp4netns socat xorg-xhost gzip
  xz zstd lz4 jq binutils patchelf file
  runimage-bubblewrap runimage-unionfs-fuse runimage-tini
  runimage-uruntime runimage-chisel runimage-ssrv
)

package() {
  install -Dm755 "sharun-${CARCH}" "${pkgdir}/var/RunDir/sharun/sharun"
  install -Dm644 'bin.list' "${pkgdir}/var/RunDir/sharun/bin.list"
  mkdir -p "${pkgdir}/var/RunDir/sharun"/{bin,shared}
  (cd "${pkgdir}/var/RunDir/sharun" && \
  while read bin
    do ln sharun bin/"$(basename "$bin")"
  done<bin.list && \
  echo "v$pkgver" > bin/.version && \
  ln -sfr bin ../static && \
  ln -sr shared/lib lib)
}
