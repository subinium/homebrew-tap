class Ddudu < Formula
  desc "AI coding harness with a native Rust TUI"
  homepage "https://github.com/subinium/ddududdudu"
  url "https://github.com/subinium/ddududdudu/archive/refs/tags/v0.6.3.tar.gz"
  sha256 "4a8dbcb3f0a0678a0adca2afaa3dfe7e5ff1220d073ee9b7d53280d82f31603f"
  license "MIT"

  depends_on "node@22"
  depends_on "rust" => :build

  def install
    system "npm", "install", "--ignore-scripts"
    system "node", "scripts/transpile-runner.cjs"
    system "cargo", "build", "--release", "--manifest-path", "tui/Cargo.toml"
    mkdir_p "dist/tui"
    cp "tui/target/release/ddudu-tui", "dist/tui/ddudu-tui"
    chmod 0755, "dist/tui/ddudu-tui"
    libexec.install Dir["*"]
    (bin/"ddudu").write_env_script libexec/"dist/index.js",
      PATH: "#{Formula["node@22"].opt_bin}:$PATH"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ddudu --version")
  end
end
