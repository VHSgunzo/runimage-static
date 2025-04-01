# Maintainer: VHSgunzo <vhsgunzo.github.io>

pkgname='runimage-static'
pkgver='0.40.7'
pkgrel='2'
sharunver='0.5.7'
pkgdesc='Tools and sharun wrapper over RunImage rootfs to run the container.'
ghrepo='https://github.com/VHSgunzo'
url="$ghrepo/runimage-static"
arch=('x86_64' 'aarch64')
license=('MIT')
options=(!strip)
source=(
  'bin.list'
  "$ghrepo/sharun/releases/download/v$sharunver/sharun-${CARCH}-lite"
  "https://raw.githubusercontent.com/VHSgunzo/sharun/refs/heads/main/lib4bin"
)
sha256sums=('SKIP' 'SKIP' 'SKIP')
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
  install -Dm755 "sharun-${CARCH}-lite" "${pkgdir}/var/RunDir/sharun/sharun"
  install -Dm755 'lib4bin' "${pkgdir}/var/RunDir/sharun/lib4bin"
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
