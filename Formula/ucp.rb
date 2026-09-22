class Ucp < Formula
  desc "Unified Codex provider profile manager"
  homepage "https://github.com/DestroyedTeam/unified-codex-provider"
  license "MIT"

  depends_on :macos

  on_macos do
    on_arm do
      url "https://github.com/DestroyedTeam/unified-codex-provider/releases/download/v0.2.12/ucp-0.2.12-aarch64-apple-darwin.tar.gz"
      sha256 "9e6122e5906d51488feb0bc8c304221279467dfc6c0ab896a8d96bff0182b1ef"
    end

    on_intel do
      url "https://github.com/DestroyedTeam/unified-codex-provider/releases/download/v0.2.12/ucp-0.2.12-x86_64-apple-darwin.tar.gz"
      sha256 "4e1695e93e81a8c5299b6a5fa60af7c9fbd95c0c72b6f92e52c09e9b5d6cff11"
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
