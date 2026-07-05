class Ucp < Formula
  desc "Unified Codex provider profile manager"
  homepage "https://github.com/DestroyedTeam/unified-codex-provider"
  license "MIT"

  depends_on :macos

  on_macos do
    on_arm do
      url "https://github.com/DestroyedTeam/unified-codex-provider/releases/download/v0.2.9/ucp-0.2.9-aarch64-apple-darwin.tar.gz"
      sha256 "9311c266a63b24055d3fd29a92f2609400275f1fd87ae65a8873809a3980839d"
    end

    on_intel do
      url "https://github.com/DestroyedTeam/unified-codex-provider/releases/download/v0.2.9/ucp-0.2.9-x86_64-apple-darwin.tar.gz"
      sha256 "0d029249d8fad2ca6847b064cc55978d7043ed962f3f1df4dc3912f802a91253"
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
