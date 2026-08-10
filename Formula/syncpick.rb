class Syncpick < Formula
  desc "Interactive fzf picker for syncing selected SSH folders with rsync"
  homepage "https://github.com/Cyberlane/syncpick"
  url "https://github.com/Cyberlane/syncpick/archive/refs/tags/v0.2.2.tar.gz"
  sha256 "3e76c674ba82c748bd5ab6a18c718ede685c95d6cb1f67fd7de23f59cf890000"
  license "MIT"

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
