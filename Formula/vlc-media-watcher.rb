class VlcMediaWatcher < Formula
  desc "Local, safe-by-default VLC watch tracking with a terminal UI"
  homepage "https://github.com/Cyberlane/vlc-media-watcher"
  url "https://github.com/Cyberlane/vlc-media-watcher/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "0d1d889f60ecd1c2c3bd44eef39615116c8e1337fc688ae79dcb492822e3bbde"
  license "MIT"

  depends_on "go" => :build

  def install
    ldflags = %w[
      -X main.version=0.2.0
      -X main.commit=v0.2.0
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
    assert_match "vlc-media-watcher 0.2.0", shell_output("#{bin}/vlc-media-watcher version")
  end
end
