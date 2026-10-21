cask "tab-finder" do
  version "2.1.19"
  sha256 "8465771012f2fb2f4b615c82dbc78dbf19a750b9972901428df4cec257f95f60"

  url "https://macplus-software.com/downloads/Tab%20Finder.zip",
      verified: "macplus-software.com/downloads/"
  name "Tab Finder"
  desc "Searchable list of open tabs across browsers"
  homepage "https://noteifyapp.com/tab-finder/"

  livecheck do
    url "https://macplus-software.com/downloads/Tab%20Finder%202.xml"
    strategy :sparkle, &:short_version
  end

  auto_updates true
  depends_on macos: ">= :sonoma"

  app "Tab Finder 2.app"

  zap trash: [
    "~/Library/Application Support/Tab Finder 2",
    "~/Library/Caches/com.macplus-software.com.Tab-Finder-2-Direct",
    "~/Library/HTTPStorages/com.macplus-software.com.Tab-Finder-2-Direct",
    "~/Library/Preferences/com.macplus-software.com.Tab-Finder-2-Direct.plist",
    "~/Library/Saved Application State/com.macplus-software.com.Tab-Finder-2-Direct.savedState",
  ]
end
