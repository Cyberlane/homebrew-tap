class Syncpick < Formula
  desc "Interactive fzf picker for syncing selected SSH folders with rsync"
  homepage "https://github.com/Cyberlane/syncpick"
  url "https://github.com/Cyberlane/syncpick/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "2b0e186bc6fec9df680f93786e3817f213f62999c7fcd84f2d5e274ef9a7882e"
  license "MIT"
  revision 4

  depends_on "fzf"
  depends_on "rsync"
  depends_on "zsh"

  def install
    inreplace "syncpick", "#!/bin/zsh", "#!#{formula_opt_bin("zsh")}/zsh"
    bin.install "syncpick"
    bin.install_symlink bin/"syncpick" => "sp"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/syncpick --version")
  end
end
