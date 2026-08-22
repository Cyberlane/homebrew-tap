class Syncpick < Formula
  desc "Interactive fzf picker for syncing selected SSH folders with rsync"
  homepage "https://github.com/Cyberlane/syncpick"
  url "https://github.com/Cyberlane/syncpick/archive/refs/tags/v0.3.0.tar.gz"
  sha256 "3ce910886c445db6cd16fe12e1a639f0bbf2bd3d46b7bed847fc9e0d21cce221"
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
