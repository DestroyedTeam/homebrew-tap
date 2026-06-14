class Ucp < Formula
  desc "Unified Codex provider profile manager"
  homepage "https://github.com/DestroyedTeam/unified-codex-provider"
  license "MIT"

  depends_on :macos

  on_macos do
    on_arm do
      url "https://github.com/DestroyedTeam/unified-codex-provider/releases/download/v0.2.5/ucp-0.2.5-aarch64-apple-darwin.tar.gz"
      sha256 "d3b734b01c8aa5696b50c48fb49106d7b32ba8fdbe23a23c8eecddcb899d2e85"
    end

    on_intel do
      url "https://github.com/DestroyedTeam/unified-codex-provider/releases/download/v0.2.5/ucp-0.2.5-x86_64-apple-darwin.tar.gz"
      sha256 "4ecc88419607fa266b1ff72ddadf8e64fb3f03277d11845788ead4183b7b4e58"
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
