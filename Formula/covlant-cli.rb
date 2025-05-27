class CovlantCli < Formula
  desc "Command-line interface for Covlant"
  homepage "https://github.com/covlant/covlant-cli"
  version "1.2.11"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/covlant/covlant-cli/releases/download/v1.2.11/covlant-macos-arm64-v1.2.11.tar.gz"
      sha256 "8fd6ed3298fa63811e755cb0026328467f7763d94715162198a0d4adaccc88f5"
    else
      odie "Covlant CLI currently only supports ARM-based Macs. Support for  Intel-based Macs is coming soon."
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/covlant/covlant-cli/releases/download/v1.2.11/covlant-linux-x86_64-v1.2.11.tar.gz"
      sha256 "ed34e3bfd273338127973de4937b84d917cef2383482a95bba16cfb0383545df"
    elsif Hardware::CPU.arm?
      url "https://github.com/covlant/covlant-cli/releases/download/v1.2.11/covlant-linux-arm64-v1.2.11.tar.gz"
      sha256 "605942cee00ab5aaa681ad3b361355528a29c3497c78e048f764ec45a5d5378a"
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
