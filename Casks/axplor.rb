cask "axplor" do
  version "0.0.27"

  if Hardware::CPU.arm?
    url "https://axplor-builds.s3.ap-south-1.amazonaws.com/platforms/macos/arm/releases/axplor-0.0.27-macos-arm.app.tar.gz"
    sha256 "b247db71b15f1c35ca69fc9bb2db07162f209ecb2b6bdf531a20da7c60bd20c3"
  else
    url "https://axplor-builds.s3.ap-south-1.amazonaws.com/platforms/macos/x86/releases/axplor-0.0.27-macos-x86_64.app.tar.gz"
    sha256 "6deb61e1d2a68f65d096f853ac9fc9adc6228d03795f42c9c7b53d072207c7b9"
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

