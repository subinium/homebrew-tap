class Agf < Formula
  desc "AI Agent Session Finder TUI — unified launcher for Claude Code, Codex, OpenCode, Pi, Kiro, Cursor CLI, and Gemini"
  homepage "https://github.com/subinium/agf"
  version "0.6.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/subinium/agf/releases/download/v#{version}/agf-aarch64-apple-darwin.tar.gz"
      sha256 "f5b3e0608a03bdba4882c36b35566e3933c5bf2596225ab470e1e2ca37ba776a"
    else
      url "https://github.com/subinium/agf/releases/download/v#{version}/agf-x86_64-apple-darwin.tar.gz"
      sha256 "52a42f90af8beca54f237b972290fb95550a8c782d2a376387eb283f1906ee3d"
    end
  end

  on_linux do
    url "https://github.com/subinium/agf/releases/download/v#{version}/agf-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "bbb19f44c5797eaa5ccea4a4fd8bca1d4567c90cf277c9f88c5b516155ed2620"
  end

  def install
    bin.install "agf"
  end

  test do
    assert_match "agf", shell_output("#{bin}/agf --help")
  end
end
