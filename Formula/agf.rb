class Agf < Formula
  desc "AI Agent Session Finder TUI — unified launcher for Claude Code, Codex, OpenCode, Pi, Kiro, Cursor CLI, and Gemini"
  homepage "https://github.com/subinium/agf"
  version "0.6.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/subinium/agf/releases/download/v#{version}/agf-aarch64-apple-darwin.tar.gz"
      sha256 "7a9c72dc5ea104e60496a5f887e259bdee803eb8b2bc7f312e524600bffccab0"
    else
      url "https://github.com/subinium/agf/releases/download/v#{version}/agf-x86_64-apple-darwin.tar.gz"
      sha256 "4981a0eb5bdaa2f03b13ad9357ceb18bc7334b24bc773d1086d1eebf7cffb835"
    end
  end

  on_linux do
    url "https://github.com/subinium/agf/releases/download/v#{version}/agf-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "22dfdefdf65c6b0be83cee4a60b48187d749d1beb00b05c2b9d4327b9ee03f4d"
  end

  def install
    bin.install "agf"
  end

  test do
    assert_match "agf", shell_output("#{bin}/agf --help")
  end
end
