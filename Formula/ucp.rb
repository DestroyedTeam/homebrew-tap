class Ucp < Formula
  desc "Unified Codex provider profile manager"
  homepage "https://github.com/DestroyedTeam/unified-codex-provider"
  version "0.1.0"
  license "MIT"

  depends_on :macos

  on_macos do
    on_arm do
      url "https://github.com/DestroyedTeam/unified-codex-provider/releases/download/v0.1.0/ucp-0.1.0-aarch64-apple-darwin.tar.gz"
      sha256 "36f0ff00f0e2ae73c6a7ca2ccc5763ad8911afe8f5cc459e58edfbac0999c361"
    end

    on_intel do
      url "https://github.com/DestroyedTeam/unified-codex-provider/releases/download/v0.1.0/ucp-0.1.0-x86_64-apple-darwin.tar.gz"
      sha256 "99522898f59cfb2064b9aad5e4e3c24f2e274ac549f80e12c9120b1e93a21789"
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
