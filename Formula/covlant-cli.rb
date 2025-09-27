class CovlantCli < Formula
  desc "Command-line interface for Covlant"
  homepage "https://github.com/covlant/covlant-cli"
  version "1.2.18"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/covlant/covlant-cli/releases/download/v1.2.18/covlant-macos-arm64-v1.2.18.tar.gz"
      sha256 "0e7643225bdd99cf1d29d7504c0131dd986972d0aaf484e44bf01ebdabf146b8"
    else
      odie "Covlant CLI currently only supports ARM-based Macs. Support for  Intel-based Macs is coming soon."
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/covlant/covlant-cli/releases/download/v1.2.18/covlant-linux-x86_64-v1.2.18.tar.gz"
      sha256 "95100d3b33ff7726f0cb1e9ab1d433d88b766f1b2e52d2f6139b6fd00048f32b"
    elsif Hardware::CPU.arm?
      url "https://github.com/covlant/covlant-cli/releases/download/v1.2.18/covlant-linux-arm64-v1.2.18.tar.gz"
      sha256 "3611055fd1a035f330f993765f0b8ee3b0129c003b2ac457fe43767d6d11192c"
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
