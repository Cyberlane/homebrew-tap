class Syncpick < Formula
  desc "Interactive fzf picker for syncing selected SSH folders with rsync"
  homepage "https://github.com/Cyberlane/syncpick"
  url "https://github.com/Cyberlane/syncpick/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "5380fb2e87fae04952493fd080fea77f8b1df5b92d4bf29320e1e9ac12698080"
  license "MIT"
  revision 3

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
