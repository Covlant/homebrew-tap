class CovlantCli < Formula
  desc "Command-line interface for Covlant"
  homepage "https://github.com/covlant/covlant-cli"
  version "1.2.14"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/covlant/covlant-cli/releases/download/v1.2.14/covlant-macos-arm64-v1.2.14.tar.gz"
      sha256 "a1f81305d6d204b8d32561372a19b74e8a887b15d3aad4c66d4747309a23117b"
    else
      odie "Covlant CLI currently only supports ARM-based Macs. Support for  Intel-based Macs is coming soon."
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/covlant/covlant-cli/releases/download/v1.2.14/covlant-linux-x86_64-v1.2.14.tar.gz"
      sha256 "d974df30aa9f3613ffbf8cb17365745356f659d195e99e0220d6ec8342cc9bee"
    elsif Hardware::CPU.arm?
      url "https://github.com/covlant/covlant-cli/releases/download/v1.2.14/covlant-linux-arm64-v1.2.14.tar.gz"
      sha256 "f0d0ffe6b6fb5e4fa803c27b094d45c2f27cde54b335b04d8e3b8bdf2bfc519a"
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
