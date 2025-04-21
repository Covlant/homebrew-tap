class CovlantCli < Formula
    desc "Command-line interface for Covlant"
    homepage "https://github.com/covlant/covlant-cli"
    version "1.2.9"
    license "MIT"
    
    on_macos do
      if Hardware::CPU.arm?
        url "https://github.com/covlant/covlant-cli/releases/download/v1.2.9/covlant-macos-arm64-v1.2.9.tar.gz"
        sha256 "d4864e34beca184a7aad3b36c5d6bef3116027f374f896e9a5f3f8f16486cbad"
      else
        odie "Covlant CLI currently only supports ARM-based Macs. Support for Intel-based Macs is coming soon."
      end
    end
    
    on_linux do
      if Hardware::CPU.intel?
        url "https://github.com/covlant/covlant-cli/releases/download/v1.2.9/covlant-linux-x86_64-v1.2.9.tar.gz"
        sha256 "4d0e66fb1bd5c6d656107aed5243d1f71893080404533d954794c9fadb8ef35e"
      elsif Hardware::CPU.arm?
        url "https://github.com/covlant/covlant-cli/releases/download/v1.2.9/covlant-linux-arm64-v1.2.9.tar.gz"
        sha256 "65e9b5a17c374f6cb08afcfb38f590a71e098983d0630391efccccd30b3a5a0b"
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