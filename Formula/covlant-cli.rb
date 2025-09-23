class CovlantCli < Formula
  desc "Command-line interface for Covlant"
  homepage "https://github.com/covlant/covlant-cli"
  version "1.2.15"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/covlant/covlant-cli/releases/download/v1.2.15/covlant-macos-arm64-v1.2.15.tar.gz"
      sha256 "6146ac4fd8dbce5bf8c7c1b4602e67cb5d4b7309256549bdc386a59e2aa0317a"
    else
      odie "Covlant CLI currently only supports ARM-based Macs. Support for  Intel-based Macs is coming soon."
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/covlant/covlant-cli/releases/download/v1.2.15/covlant-linux-x86_64-v1.2.15.tar.gz"
      sha256 "50768783bba949b4a5a0dd55987881074961c973167177165c4a7b6c131e703a"
    elsif Hardware::CPU.arm?
      url "https://github.com/covlant/covlant-cli/releases/download/v1.2.15/covlant-linux-arm64-v1.2.15.tar.gz"
      sha256 "a47504186634f7ed3213125091546830f6d809b4cef200122704886ec8805333"
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
