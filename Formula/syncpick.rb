class Syncpick < Formula
  desc "Interactive fzf picker for syncing selected SSH folders with rsync"
  homepage "https://github.com/Cyberlane/syncpick"
  url "https://github.com/Cyberlane/syncpick/archive/refs/tags/v0.2.3.tar.gz"
  sha256 "0a0f13abc74cce73d7a0e2424314f46c1babe5e051d12ef455d08301babac4cd"
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
