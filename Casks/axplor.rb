cask "axplor" do
  version "0.0.26"

  if Hardware::CPU.arm?
    url "https://axplor-builds.s3.ap-south-1.amazonaws.com/platforms/macos/arm/releases/axplor-#{version}-macos-arm.tar.gz"
    sha256 "ARM64-SHA256-HERE"
  else
    url "https://axplor-builds.s3.ap-south-1.amazonaws.com/platforms/macos/x86/releases/axplor-#{version}-macos-x86_64.tar.gz"
    sha256 "X86-SHA256-HERE"
  end

  name "Axplor"
  desc "Modern database IDE for developers"
  homepage "https://axplor.com"

  depends_on macos: ">= :big_sur"

  app "Axplor.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/Axplor.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Application Support/Axplor",
    "~/Library/Preferences/com.axplorsoft.axplor.plist",
    "~/Library/Caches/com.axplorsoft.axplor",
  ]
end

