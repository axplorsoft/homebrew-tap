cask "axplor" do
  version "0.0.26"

  if Hardware::CPU.arm?
    url "https://axplor-builds.s3.ap-south-1.amazonaws.com/platforms/macos/arm/releases/axplor-0.0.26-macos-arm.tar.gz"
    sha256 "fec7589b65d5a930426ad08d1df711f72836c7871d4da1ad7de551e9a022ae70"
  else
    url "https://axplor-builds.s3.ap-south-1.amazonaws.com/platforms/macos/x86/releases/axplor-0.0.26-macos-x86_64.tar.gz"
    sha256 "4303924e3510124a6458f66a3496c7eb2bd005252e9be49d29a154f082fb7e61"
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

