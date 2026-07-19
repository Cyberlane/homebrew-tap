class Syncpick < Formula
  desc "Interactive fzf picker for syncing selected SSH folders with rsync"
  homepage "https://github.com/Cyberlane/syncpick"
  url "https://github.com/Cyberlane/syncpick/archive/refs/tags/v0.1.0.tar.gz"
  version "0.1.0"
  sha256 "fe5152306dfa9d1c6913a3ccc24a377c1618434baab00895bba363997e65e5e2"
  license "MIT"

  depends_on "fzf"
  depends_on "rsync"
  depends_on "zsh"

  def install
    inreplace "syncpick", "#!/bin/zsh", "#!#{Formula["zsh"].opt_bin}/zsh"
    bin.install "syncpick"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/syncpick --version")
  end
end
