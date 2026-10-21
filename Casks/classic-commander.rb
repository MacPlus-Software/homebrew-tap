cask "classic-commander" do
  version "0.1.1"
  sha256 "7344993381332ece3568dc9fbadcc5a52191520d9ae72549395bd29efad55424"

  url "https://macplus-software.com/downloads/Classic%20Commander.zip",
      verified: "macplus-software.com/downloads/"
  name "Classic Commander"
  desc "Two-panel file manager with commander-style keys"
  homepage "https://noteifyapp.com/classic-commander/"

  livecheck do
    url "https://macplus-software.com/downloads/Classic%20Commander.xml"
    strategy :sparkle, &:short_version
  end

  auto_updates true
  depends_on macos: ">= :sonoma"

  app "Classic Commander.app"

  zap trash: [
    "~/Library/Application Support/Classic Commander",
    "~/Library/Caches/com.macplus-software.ClassicCommander",
    "~/Library/HTTPStorages/com.macplus-software.ClassicCommander",
    "~/Library/Preferences/com.macplus-software.ClassicCommander.plist",
    "~/Library/Saved Application State/com.macplus-software.ClassicCommander.savedState",
  ]
end
