class Ucp < Formula
  desc "Unified Codex provider profile manager"
  homepage "https://github.com/DestroyedTeam/unified-codex-provider"
  license "MIT"

  depends_on :macos

  on_macos do
    on_arm do
      url "https://github.com/DestroyedTeam/unified-codex-provider/releases/download/v0.2.7/ucp-0.2.7-aarch64-apple-darwin.tar.gz"
      sha256 "008c5b16e50d3c86c2554cbeb5c15bc18087deddeea3a0588969a46d41bb6537"
    end

    on_intel do
      url "https://github.com/DestroyedTeam/unified-codex-provider/releases/download/v0.2.7/ucp-0.2.7-x86_64-apple-darwin.tar.gz"
      sha256 "1c63ac74f5f2247c5e6e9716d168f9070530d8b8c6b0546633d9e23ffb51d3c9"
    end
  end

  def install
    bin.install "ucp"
    generate_completions_from_executable(bin/"ucp", "completions")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ucp --version")
    assert_match "UCP doctor", shell_output("#{bin}/ucp doctor")
  end
end
