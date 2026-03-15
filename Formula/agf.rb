class Agf < Formula
  desc "AI Agent Session Finder TUI — unified launcher for Claude Code, Codex, OpenCode, Pi, Kiro, Cursor CLI, and Gemini"
  homepage "https://github.com/subinium/agf"
  version "0.6.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/subinium/agf/releases/download/v#{version}/agf-aarch64-apple-darwin.tar.gz"
      sha256 "a696f946d38a812d0ca71d6ca4c5ca24ae478bba6562d0d92a41bb46842c054f"
    else
      url "https://github.com/subinium/agf/releases/download/v#{version}/agf-x86_64-apple-darwin.tar.gz"
      sha256 "e53e1040e54f83743104002b553cc3fab13fb4a45589554114bd7586da80c8ee"
    end
  end

  on_linux do
    url "https://github.com/subinium/agf/releases/download/v#{version}/agf-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "d7073828e3fadcd386966866e00e632dd39a7717c5293c2fe99bc54af3645180"
  end

  def install
    bin.install "agf"
  end

  test do
    assert_match "agf", shell_output("#{bin}/agf --help")
  end
end
