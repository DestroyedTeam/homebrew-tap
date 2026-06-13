class Ucp < Formula
  desc "Unified Codex provider profile manager"
  homepage "https://github.com/DestroyedTeam/unified-codex-provider"
  license "MIT"

  depends_on :macos

  on_macos do
    on_arm do
      url "https://github.com/DestroyedTeam/unified-codex-provider/releases/download/v0.2.2/ucp-0.2.2-aarch64-apple-darwin.tar.gz"
      sha256 "59400127bae456adaafd7dffc9e77738c0a7ebc4be8febe1cd15067bc4c67bfa"
    end

    on_intel do
      url "https://github.com/DestroyedTeam/unified-codex-provider/releases/download/v0.2.2/ucp-0.2.2-x86_64-apple-darwin.tar.gz"
      sha256 "d5c8419e6932d677dc794c5af333c14cfd8dadb3113a6616ead623a3ad40d16d"
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
