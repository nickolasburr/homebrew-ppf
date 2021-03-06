class DarwinMountpoint < Formula
  desc "Linux mountpoint(1) ported to Darwin."
  homepage "http://download.savannah.gnu.org/releases/sysvinit/"
  url "http://download.savannah.gnu.org/releases/sysvinit/sysvinit-2.88dsf.tar.bz2"
  sha256 "60bbc8c1e1792056e23761d22960b30bb13eccc2cabff8c7310a01f4d5df1519"
  version "2.88dsf"

  bottle do
    root_url "https://dl.bintray.com/nickolasburr/homebrew-bottles"
    sha256 "93e98f61feedb0d20ddfd8ed88952289224fc36888e45ad06426dab1e21f7076" => :high_sierra
    sha256 "93e98f61feedb0d20ddfd8ed88952289224fc36888e45ad06426dab1e21f7076" => :sierra
    sha256 "93e98f61feedb0d20ddfd8ed88952289224fc36888e45ad06426dab1e21f7076" => :el_capitan
    sha256 "93e98f61feedb0d20ddfd8ed88952289224fc36888e45ad06426dab1e21f7076" => :yosemite
  end

  def install
    system "/usr/bin/sed -i '' 's@#include <sys/stat.h>@#include <sys/types.h>\\\n#include <sys/stat.h>@' src/mountpoint.c"
    system "/usr/bin/cc", "-Wno-everything", "src/mountpoint.c", "-o", "mountpoint"
    system "/usr/bin/gzip -c man/mountpoint.1 > mountpoint.1.gz"

    bin.install "mountpoint"
    man1.install "mountpoint.1.gz"
  end

  test do
    system "mountpoint", "/"
  end
end
