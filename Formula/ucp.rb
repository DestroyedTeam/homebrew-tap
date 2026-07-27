class Ucp < Formula
  desc "Unified Codex provider profile manager"
  homepage "https://github.com/DestroyedTeam/unified-codex-provider"
  license "MIT"

  depends_on :macos

  on_macos do
    on_arm do
      url "https://github.com/DestroyedTeam/unified-codex-provider/releases/download/v0.2.10/ucp-0.2.10-aarch64-apple-darwin.tar.gz"
      sha256 "4cf38251dd5f1436ab95b8d06ea9d4c1de387916166afa1de2aab42cb0956114"
    end

    on_intel do
      url "https://github.com/DestroyedTeam/unified-codex-provider/releases/download/v0.2.10/ucp-0.2.10-x86_64-apple-darwin.tar.gz"
      sha256 "58530ea7e61620281b8454b23d98ae5e0b7df5417f75f058d33733ca118eafa2"
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
