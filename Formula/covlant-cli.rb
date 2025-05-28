class CovlantCli < Formula
  desc "Command-line interface for Covlant"
  homepage "https://github.com/covlant/covlant-cli"
  version "1.2.12"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/covlant/covlant-cli/releases/download/v1.2.12/covlant-macos-arm64-v1.2.12.tar.gz"
      sha256 "0b40717624b4068e1fad0d407e688a166d9e813c1a6c593f3386690c0a1b862b"
    else
      odie "Covlant CLI currently only supports ARM-based Macs. Support for  Intel-based Macs is coming soon."
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/covlant/covlant-cli/releases/download/v1.2.12/covlant-linux-x86_64-v1.2.12.tar.gz"
      sha256 "e55dbc21a0f652e93b75265daaf7048a2944cf1a2475757230baac06ed92296a"
    elsif Hardware::CPU.arm?
      url "https://github.com/covlant/covlant-cli/releases/download/v1.2.12/covlant-linux-arm64-v1.2.12.tar.gz"
      sha256 "c9297bc3ff0baf48c1eeb99e3bf96fb4ebcd3a58d776fe6c5bffb6ce9ad96427"
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
