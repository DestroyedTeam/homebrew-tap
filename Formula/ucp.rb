class Ucp < Formula
  desc "Unified Codex provider profile manager"
  homepage "https://github.com/DestroyedTeam/unified-codex-provider"
  license "MIT"

  depends_on :macos

  on_macos do
    on_arm do
      url "https://github.com/DestroyedTeam/unified-codex-provider/releases/download/v0.2.6/ucp-0.2.6-aarch64-apple-darwin.tar.gz"
      sha256 "a11179aa5d8713356224bad1b37ed68d1777a9e44a6f95f01e552551abdf55f4"
    end

    on_intel do
      url "https://github.com/DestroyedTeam/unified-codex-provider/releases/download/v0.2.6/ucp-0.2.6-x86_64-apple-darwin.tar.gz"
      sha256 "53d7784b9efde81d9add703f8f596b11cd5383cce7c176e0e17d2585d83d3cea"
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
