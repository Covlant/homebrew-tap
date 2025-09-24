class CovlantCli < Formula
  desc "Command-line interface for Covlant"
  homepage "https://github.com/covlant/covlant-cli"
  version "1.2.16"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/covlant/covlant-cli/releases/download/v1.2.16/covlant-macos-arm64-v1.2.16.tar.gz"
      sha256 "d692237d59dc5902d63ee0940774e575decec58eccbd8a79c023a2f12d34d5e4"
    else
      odie "Covlant CLI currently only supports ARM-based Macs. Support for  Intel-based Macs is coming soon."
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/covlant/covlant-cli/releases/download/v1.2.16/covlant-linux-x86_64-v1.2.16.tar.gz"
      sha256 "c5c263f4431ce614890f6d1731f46635f336dfcff2f539f63d543bff93a81dff"
    elsif Hardware::CPU.arm?
      url "https://github.com/covlant/covlant-cli/releases/download/v1.2.16/covlant-linux-arm64-v1.2.16.tar.gz"
      sha256 "0d7993f6ab2f74afbfcf68c6bba3583641d7a78f1d15f043e876448c772e00a5"
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
