cask "axplor" do
  version "0.0.31"

  if Hardware::CPU.arm?
    url "https://axplor-builds.s3.ap-south-1.amazonaws.com/platforms/macos/arm/releases/axplor-0.0.31-macos-arm.app.tar.gz"
    sha256 "ac0ff2b6ef312df448ad704853bee679e6e3c584a20c0ad1404487505e8e1f62"
  else
    url "https://axplor-builds.s3.ap-south-1.amazonaws.com/platforms/macos/x86/releases/axplor-0.0.31-macos-x86.app.tar.gz"
    sha256 "faecf9e3355dc7b636a8d942a9658ec1991e28400ad80c691454c3ffa2ec3f0b"
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

