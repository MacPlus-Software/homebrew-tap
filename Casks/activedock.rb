cask "activedock" do
  version "2.884"
  sha256 "1d69c3f723ceb8fafa1ef97ffed74223c23a4784c0b1c2f03832fad034d72bca"

  url "https://macplus-software.com/downloads/ActiveDock.zip",
      verified: "macplus-software.com/downloads/"
  name "ActiveDock"
  desc "Customizable dock with window previews, groups and a start menu"
  homepage "https://noteifyapp.com/activedock/"

  livecheck do
    url "https://macplus-software.com/downloads/ActiveDock.xml"
    strategy :sparkle, &:short_version
  end

  auto_updates true
  depends_on macos: ">= :sonoma"

  app "ActiveDock 2.app"

  zap trash: [
    "~/Library/Application Support/ActiveDock 2",
    "~/Library/Caches/com.sergey-gerasimenko.ActiveDock-2",
    "~/Library/HTTPStorages/com.sergey-gerasimenko.ActiveDock-2",
    "~/Library/Preferences/com.sergey-gerasimenko.ActiveDock-2.plist",
    "~/Library/Saved Application State/com.sergey-gerasimenko.ActiveDock-2.savedState",
  ]
end
