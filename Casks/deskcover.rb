cask "deskcover" do
  version "2.1.0"
  sha256 :no_check

  url "https://macplus-software.com/downloads/DeskCover.zip",
      verified: "macplus-software.com/downloads/"
  name "DeskCover"
  desc "Dims or blurs everything except the active window"
  homepage "https://noteifyapp.com/deskcover/"

  livecheck do
    url "https://macplus-software.com/downloads/DeskCover.xml"
    strategy :sparkle, &:short_version
  end

  auto_updates true
  depends_on macos: :sonoma

  app "DeskCover.app"

  zap trash: [
    "~/Library/Caches/com.sergey-gerasimenko.DeskCoverPro",
    "~/Library/HTTPStorages/com.sergey-gerasimenko.DeskCoverPro",
    "~/Library/Preferences/com.sergey-gerasimenko.DeskCoverPro.plist",
  ]
end
