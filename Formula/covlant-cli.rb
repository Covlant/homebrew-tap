class CovlantCli < Formula
  desc "Command-line interface for Covlant"
  homepage "https://github.com/covlant/covlant-cli"
  version "1.2.17"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/covlant/covlant-cli/releases/download/v1.2.17/covlant-macos-arm64-v1.2.17.tar.gz"
      sha256 "51511c4c006514c2f50d45bb7da90269bdb7c70762cb2b5038077e9c4cb26d87"
    else
      odie "Covlant CLI currently only supports ARM-based Macs. Support for  Intel-based Macs is coming soon."
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/covlant/covlant-cli/releases/download/v1.2.17/covlant-linux-x86_64-v1.2.17.tar.gz"
      sha256 "4ef5bd445c512e5cf66cbc82f51fc77b1b6d40487de99b8b47dc1312272ad5e9"
    elsif Hardware::CPU.arm?
      url "https://github.com/covlant/covlant-cli/releases/download/v1.2.17/covlant-linux-arm64-v1.2.17.tar.gz"
      sha256 "417f15d72278e521a8439657a8e3b0218b1ac4bd32af70b39963862f5534fe68"
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
