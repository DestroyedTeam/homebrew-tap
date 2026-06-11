class Ucp < Formula
  desc "Unified Codex provider profile manager"
  homepage "https://github.com/DestroyedTeam/unified-codex-provider"
  license "MIT"

  depends_on :macos

  on_macos do
    on_arm do
      url "https://github.com/DestroyedTeam/unified-codex-provider/releases/download/v0.2.0/ucp-0.2.0-aarch64-apple-darwin.tar.gz"
      sha256 "dce2a33d3db5d1c66af2818a8a5e13c1c8e1053e6fdb4ddc8665c7455eb167df"
    end

    on_intel do
      url "https://github.com/DestroyedTeam/unified-codex-provider/releases/download/v0.2.0/ucp-0.2.0-x86_64-apple-darwin.tar.gz"
      sha256 "fc16abd1eac69d72be0841694b9542ae124ffaf7f6cd6e9597ef24539ce48be5"
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
