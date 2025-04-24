class CovlantCli < Formula
  desc "Command-line interface for Covlant"
  homepage "https://github.com/covlant/covlant-cli"
  version "1.2.10"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/covlant/covlant-cli/releases/download/v1.2.10/covlant-macos-arm64-v1.2.10.tar.gz"
      sha256 "7a36738cfe56c1ba462d1ef0a893ad20120e26f2cd2c9f77b3210dd600984442"
    else
      odie "Covlant CLI currently only supports ARM-based Macs. Support for  Intel-based Macs is coming soon."
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/covlant/covlant-cli/releases/download/v1.2.10/covlant-linux-x86_64-v1.2.10.tar.gz"
      sha256 "8d63f3f5774ff5d107b40b18ec753b3c4e1069ac0f5be930835c8f9e742beeed"
    elsif Hardware::CPU.arm?
      url "https://github.com/covlant/covlant-cli/releases/download/v1.2.10/covlant-linux-arm64-v1.2.10.tar.gz"
      sha256 "3da6063a986a73de052c21993e7607f7909818b7f5a2ac44904be422044ef2ed"
    else
      odie "Covlant CLI currently only supports x86_64 and ARM64 Linux installations."
    end
  end

  def install
    bin.install "covlant"
  end

  test do
    assert_match "Covlant CLI v#{version}", shell_output("#{bin}/covlant --version")
  end
end
