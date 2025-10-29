cask "axplor" do
  version "0.0.32"

  if Hardware::CPU.arm?
    url "https://axplor-builds.s3.ap-south-1.amazonaws.com/platforms/macos/arm/releases/axplor-0.0.32-macos-arm.app.tar.gz"
    sha256 "d6ca180993a0e159fc994e8e1a64726dd9067b62367d8fa9ddc9ffc3eae7056e"
  else
    url "https://axplor-builds.s3.ap-south-1.amazonaws.com/platforms/macos/x86/releases/axplor-0.0.32-macos-x86.app.tar.gz"
    sha256 "f51c86db2134117d548c2f7701eb59aa7c222cf830e8fe4033bb7d8012ce9da2"
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

