# Maintainer: VHSgunzo <vhsgunzo.github.io>

pkgname='runimage-static'
pkgver='0.39.1'
pkgrel='1'
pkgbase="$pkgname"
pkgdesc='Statically compiled binaries for RunImage container'
url="https://github.com/VHSgunzo/runimage-static"
arch=('x86_64')
license=('MIT')
source=("$url/releases/download/v$pkgver/runimage-static-$arch.tar.xz")
sha256sums=('SKIP')

package() {
  mkdir -p "${pkgdir}/var/RunDir"
  cp -rf "${srcdir}/static" "${pkgdir}/var/RunDir/"
}
