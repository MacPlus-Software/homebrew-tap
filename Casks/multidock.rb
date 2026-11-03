cask "multidock" do
  version "2.10"
  sha256 "7446f12112eefe488fecb504e564b22a33911555b52984bcd1dc742aa0e52ff3"

  url "https://macplus-software.com/downloads/MultiDock%202.zip",
      verified: "macplus-software.com/downloads/"
  name "MultiDock"
  desc "Extra panels for apps, files and folders next to the Dock"
  homepage "https://noteifyapp.com/multidock/"

  livecheck do
    url "https://macplus-software.com/downloads/MultiDock%202.xml"
    strategy :sparkle, &:short_version
  end

  auto_updates true
  depends_on macos: ">= :sequoia"

  app "MultiDock 2.app"

  zap trash: [
    "~/Library/Application Support/MultiDock 2",
    "~/Library/Caches/com.sergiigerasimenko.MultiDock2",
    "~/Library/HTTPStorages/com.sergiigerasimenko.MultiDock2",
    "~/Library/Preferences/com.sergiigerasimenko.MultiDock2.plist",
    "~/Library/Saved Application State/com.sergiigerasimenko.MultiDock2.savedState",
  ]
end
