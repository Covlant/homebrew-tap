class CovlantCli < Formula
  desc "Command-line interface for Covlant"
  homepage "https://github.com/covlant/covlant-cli"
  version "1.2.14"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/covlant/covlant-cli/releases/download/v1.2.14/covlant-macos-arm64-v1.2.14.tar.gz"
      sha256 "7530c079f5f069087e90bf221e6db441a0ff85d5d9475a6e8a1641650b56bf42"
    else
      odie "Covlant CLI currently only supports ARM-based Macs. Support for  Intel-based Macs is coming soon."
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/covlant/covlant-cli/releases/download/v1.2.14/covlant-linux-x86_64-v1.2.14.tar.gz"
      sha256 "c16f1e9cc03ec2f3e48105211f355eb7ef1e49382bea33a032e332a9376a83da"
    elsif Hardware::CPU.arm?
      url "https://github.com/covlant/covlant-cli/releases/download/v1.2.14/covlant-linux-arm64-v1.2.14.tar.gz"
      sha256 "25defeab368b4ec411b3f24f7a295442f8cd73d3b3287d37a6a9ad5380120cff"
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
