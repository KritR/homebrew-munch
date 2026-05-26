class Munch < Formula
  desc "AI shell command widget for Zsh and Fish"
  homepage "https://github.com/KritR/munch"
  version "0.1.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/KritR/munch/releases/download/v#{version}/munch_#{version}_darwin_arm64.tar.gz"
      sha256 "3a156082321675ff7916838d949c384ff7195e0e1e2761a5b55f56f3b9289113"
    else
      url "https://github.com/KritR/munch/releases/download/v#{version}/munch_#{version}_darwin_amd64.tar.gz"
      sha256 "8650897934c3f10df4fe7f23d1a5e90412f543d26e224cf798579ec43aa978e2"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/KritR/munch/releases/download/v#{version}/munch_#{version}_linux_arm64.tar.gz"
      sha256 "7d2dffc526c86f627503ba68aa0bfd4f11eeaaf8d91692156b6a712e7f195f61"
    else
      url "https://github.com/KritR/munch/releases/download/v#{version}/munch_#{version}_linux_amd64.tar.gz"
      sha256 "cad8b7ff6c913cae9e8de16fe9c7162941a95b2b5e221fed40939dcd8aab15aa"
    end
  end

  head do
    url "https://github.com/KritR/munch.git", branch: "main"
    depends_on "go" => :build
  end

  def install
    if build.head?
      ENV["CGO_ENABLED"] = "0"
      ldflags = "-s -w -X github.com/krithikr/munch/internal/command.Version=#{version}"
      system "go", "build", *std_go_args(ldflags: ldflags), "./cmd/munch"
    else
      bin.install "munch"
      doc.install "README.md" if File.exist?("README.md")
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/munch --version")
    assert_match "bindkey", shell_output("#{bin}/munch init zsh")
    assert_match "bind ", shell_output("#{bin}/munch init fish")
  end
end
