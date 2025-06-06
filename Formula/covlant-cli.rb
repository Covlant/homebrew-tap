class CovlantCli < Formula
  desc "Command-line interface for Covlant"
  homepage "https://github.com/covlant/covlant-cli"
  version "1.2.13"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/covlant/covlant-cli/releases/download/v1.2.13/covlant-macos-arm64-v1.2.13.tar.gz"
      sha256 "123a5598f997d01c263257b75d52114c70051eecf9c50f5cefcdffe395c34e55"
    else
      odie "Covlant CLI currently only supports ARM-based Macs. Support for  Intel-based Macs is coming soon."
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/covlant/covlant-cli/releases/download/v1.2.13/covlant-linux-x86_64-v1.2.13.tar.gz"
      sha256 "d2abe107643e7c479884fdb4975955b6a33b81d8043b61c1977e0a3573c0f20f"
    elsif Hardware::CPU.arm?
      url "https://github.com/covlant/covlant-cli/releases/download/v1.2.13/covlant-linux-arm64-v1.2.13.tar.gz"
      sha256 "c33e47da5e58b25507a2b42e0ebb16fbd0350852daba9d0781277fe145d28224"
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
