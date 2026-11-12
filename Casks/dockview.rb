cask "dockview" do
  version "2.6.2"
  sha256 :no_check

  url "https://macplus-software.com/downloads/DockView%202.zip",
      verified: "macplus-software.com/downloads/"
  name "DockView"
  desc "Window previews for Dock icons"
  homepage "https://noteifyapp.com/dockview/"

  livecheck do
    url "https://macplus-software.com/downloads/DockView%202.xml"
    strategy :sparkle, &:short_version
  end

  auto_updates true
  depends_on macos: :sonoma

  app "DockView 2.app"

  zap trash: [
    "~/Library/Application Support/DockView 2",
    "~/Library/Caches/com.macplus-software.com.DockView-2",
    "~/Library/HTTPStorages/com.macplus-software.com.DockView-2",
    "~/Library/Preferences/com.macplus-software.com.DockView-2.plist",
    "~/Library/Saved Application State/com.macplus-software.com.DockView-2.savedState",
  ]
end
