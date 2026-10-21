cask "maxsnap" do
  version "1.9.1"
  sha256 "694e327f8c05f62a2fd8c5683366759c965adc4d5764d2a5ea6d19423f07eee4"

  url "https://macplus-software.com/downloads/MaxSnap.zip",
      verified: "macplus-software.com/downloads/"
  name "MaxSnap"
  desc "Window manager with hotkeys, gestures and drag to resize"
  homepage "https://noteifyapp.com/maxsnap-mac-window-manager/"

  livecheck do
    url "https://macplus-software.com/downloads/MaxSnap.xml"
    strategy :sparkle, &:short_version
  end

  auto_updates true
  depends_on macos: ">= :high_sierra"

  app "MaxSnap.app"

  zap trash: [
    "~/Library/Application Support/MaxSnap",
    "~/Library/Caches/com.sergey-gerasimenko.MaxSnap",
    "~/Library/HTTPStorages/com.sergey-gerasimenko.MaxSnap",
    "~/Library/Preferences/com.sergey-gerasimenko.MaxSnap.plist",
    "~/Library/Saved Application State/com.sergey-gerasimenko.MaxSnap.savedState",
  ]
end
