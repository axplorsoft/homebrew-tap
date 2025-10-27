cask "axplor" do
  version "0.0.29"

  if Hardware::CPU.arm?
    url "https://axplor-builds.s3.ap-south-1.amazonaws.com/platforms/macos/arm/releases/axplor-0.0.29-macos-arm.app.tar.gz"
    sha256 "625f1f2047992f636aa02f6ec136bc0a21334ca652ea2f9bdfc14cd8d3f06d83"
  else
    url "https://axplor-builds.s3.ap-south-1.amazonaws.com/platforms/macos/x86/releases/axplor-0.0.29-macos-x86.app.tar.gz"
    sha256 "5110fa0ff386c1c31c1deabb0b06d04f2d41b2ae7834568e4a679695c6447462"
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

