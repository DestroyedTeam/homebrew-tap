class Ucp < Formula
  desc "Unified Codex provider profile manager"
  homepage "https://github.com/DestroyedTeam/unified-codex-provider"
  license "MIT"

  depends_on :macos

  on_macos do
    on_arm do
      url "https://github.com/DestroyedTeam/unified-codex-provider/releases/download/v0.2.3/ucp-0.2.3-aarch64-apple-darwin.tar.gz"
      sha256 "5f7afc198f5e3829e04dbeb3ad6dbeea4beaecad719b65f957b257021d34e83b"
    end

    on_intel do
      url "https://github.com/DestroyedTeam/unified-codex-provider/releases/download/v0.2.3/ucp-0.2.3-x86_64-apple-darwin.tar.gz"
      sha256 "00e2a7600e26b252c78db57122c5f902f4fa35fe8ff2e3dfd6fb24b4267ab8d3"
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
