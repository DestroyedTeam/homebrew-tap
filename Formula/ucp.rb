class Ucp < Formula
  desc "Unified Codex provider profile manager"
  homepage "https://github.com/DestroyedTeam/unified-codex-provider"
  license "MIT"

  depends_on :macos

  on_macos do
    on_arm do
      url "https://github.com/DestroyedTeam/unified-codex-provider/releases/download/v0.2.4/ucp-0.2.4-aarch64-apple-darwin.tar.gz"
      sha256 "6c9ee7a9e97adeec2c5fba0e6d8be992bc512b645a7c10fb018f57a8b298767a"
    end

    on_intel do
      url "https://github.com/DestroyedTeam/unified-codex-provider/releases/download/v0.2.4/ucp-0.2.4-x86_64-apple-darwin.tar.gz"
      sha256 "d9df4d60bad0025df80a7b9bd734184517fadffacd210a7a64a110889ec29190"
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
