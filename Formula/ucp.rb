class Ucp < Formula
  desc "Unified Codex provider profile manager"
  homepage "https://github.com/DestroyedTeam/unified-codex-provider"
  license "MIT"

  depends_on :macos

  on_macos do
    on_arm do
      url "https://github.com/DestroyedTeam/unified-codex-provider/releases/download/v0.2.1/ucp-0.2.1-aarch64-apple-darwin.tar.gz"
      sha256 "49730e3bb699426e83a0953266fd79d17a87f37c434b156223e69077456bd5b6"
    end

    on_intel do
      url "https://github.com/DestroyedTeam/unified-codex-provider/releases/download/v0.2.1/ucp-0.2.1-x86_64-apple-darwin.tar.gz"
      sha256 "2ce59403631974d669fdd36e23292664582fbc2b9f07b8801d2764751c96b16e"
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
