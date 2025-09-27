class CovlantCli < Formula
  desc "Command-line interface for Covlant"
  homepage "https://github.com/covlant/covlant-cli"
  version "1.2.19"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/covlant/covlant-cli/releases/download/v1.2.19/covlant-macos-arm64-v1.2.19.tar.gz"
      sha256 "6797f0f1b4c363ac10c07bd8e413257782e8215040682dada147ddfbf7f6a077"
    else
      odie "Covlant CLI currently only supports ARM-based Macs. Support for  Intel-based Macs is coming soon."
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/covlant/covlant-cli/releases/download/v1.2.19/covlant-linux-x86_64-v1.2.19.tar.gz"
      sha256 "68725afee62dab61d74a84bdb1048f4b5e1caa62901e4a12d7951f1c0f0e0aea"
    elsif Hardware::CPU.arm?
      url "https://github.com/covlant/covlant-cli/releases/download/v1.2.19/covlant-linux-arm64-v1.2.19.tar.gz"
      sha256 "7e452cc11f6a44e18ddf504ef90181fd9a69b1bb4834c474f1932394d6370d1b"
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
