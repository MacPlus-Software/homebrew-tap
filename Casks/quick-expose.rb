cask "quick-expose" do
  version "3.0.1"
  sha256 "0bffe3aea0b67c79b1caaa7ef2af056a7fd95d80db9a22f677b22d64209a4394"

  url "https://macplus-software.com/downloads/QuickExpose3.zip",
      verified: "macplus-software.com/downloads/"
  name "Quick Exposé"
  desc "Overview of all windows and desktops in classic Exposé style"
  homepage "https://noteifyapp.com/quick-expose/"

  livecheck do
    url "https://macplus-software.com/downloads/QuickExpose3.xml"
    strategy :sparkle, &:short_version
  end

  auto_updates true
  depends_on macos: ">= :sequoia"

  app "Quick Exposé 3.app"

  zap trash: [
    "~/Library/Application Support/Quick Exposé 3",
    "~/Library/Caches/com.macplus-software.quick-expose-3",
    "~/Library/HTTPStorages/com.macplus-software.quick-expose-3",
    "~/Library/Preferences/com.macplus-software.quick-expose-3.plist",
    "~/Library/Saved Application State/com.macplus-software.quick-expose-3.savedState",
  ]
end
