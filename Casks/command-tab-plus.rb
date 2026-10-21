cask "command-tab-plus" do
  version "2.9.13"
  sha256 "ff96ecbbc4d8aad346090b9b05c25f98ddfc723515349739aece7d6183103944"

  url "https://macplus-software.com/downloads/Command-Tab%20Plus%202.zip",
      verified: "macplus-software.com/downloads/"
  name "Command-Tab Plus"
  desc "Keyboard app and window switcher"
  homepage "https://noteifyapp.com/command-tab-plus/"

  livecheck do
    url "https://macplus-software.com/downloads/CommandTabPlus2.xml"
    strategy :sparkle, &:short_version
  end

  auto_updates true
  depends_on macos: ">= :sonoma"

  app "Command-Tab Plus 2.app"

  zap trash: [
    "~/Library/Application Support/Command-Tab Plus 2",
    "~/Library/Caches/com.sergey-gerasimenko.Command-Tab-Plus-2",
    "~/Library/HTTPStorages/com.sergey-gerasimenko.Command-Tab-Plus-2",
    "~/Library/Preferences/com.sergey-gerasimenko.Command-Tab-Plus-2.plist",
    "~/Library/Saved Application State/com.sergey-gerasimenko.Command-Tab-Plus-2.savedState",
  ]
end
