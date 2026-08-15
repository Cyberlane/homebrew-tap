class VlcMediaWatcher < Formula
  desc "Local, safe-by-default VLC watch tracking with a terminal UI"
  homepage "https://github.com/Cyberlane/vlc-media-watcher"
  url "https://github.com/Cyberlane/vlc-media-watcher/archive/refs/tags/v0.2.1.tar.gz"
  sha256 "bdf0d972816c56b85a17e74132c5d81803b9403af6347e71742f01f06bc297ea"
  license "MIT"

  depends_on "go" => :build

  def install
    ldflags = %w[
      -X main.version=0.2.1
      -X main.commit=v0.2.1
      -X main.date=unknown
      -X main.builtBy=homebrew
    ]
    system "go", "build", *std_go_args(ldflags: ldflags.join(" ")), "./cmd/vlc-media-watcher"
  end

  service do
    run [opt_bin/"vlc-media-watcher", "watch"]
    environment_variables PATH: std_service_path_env
    keep_alive true
    log_path var/"log/vlc-media-watcher.log"
    error_log_path var/"log/vlc-media-watcher.log"
  end

  test do
    assert_match "vlc-media-watcher 0.2.1", shell_output("#{bin}/vlc-media-watcher version")
  end
end
