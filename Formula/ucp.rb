class Ucp < Formula
  desc "Unified Codex provider profile manager"
  homepage "https://github.com/DestroyedTeam/unified-codex-provider"
  license "MIT"

  depends_on :macos

  on_macos do
    on_arm do
      url "https://github.com/DestroyedTeam/unified-codex-provider/releases/download/v0.2.8/ucp-0.2.8-aarch64-apple-darwin.tar.gz"
      sha256 "80ec64afd0e5a404187848391bfd8cc4e11ac90f709ac0ec43621c03076bd7ff"
    end

    on_intel do
      url "https://github.com/DestroyedTeam/unified-codex-provider/releases/download/v0.2.8/ucp-0.2.8-x86_64-apple-darwin.tar.gz"
      sha256 "f283233ae4f4ab18cca38d9560b33fba1282c4309aa4a2d01dc5f02416beaee4"
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
