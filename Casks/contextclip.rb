cask "contextclip" do
  version "1.1.1"
  sha256 "1e3aecb2700ef5dd260d83441cdd0b6053bb0f6975083016ceac3074561c5549"

  url "https://macplus-software.com/downloads/ContextClip.zip",
      verified: "macplus-software.com/downloads/"
  name "ContextClip"
  desc "Captures screenshots with UI structure for coding agents"
  homepage "https://noteifyapp.com/contextclip/"

  livecheck do
    url "https://macplus-software.com/downloads/ContextClip.xml"
    strategy :sparkle, &:short_version
  end

  auto_updates true
  depends_on macos: ">= :sequoia"

  app "ContextClip.app"

  zap trash: [
    "~/Library/Application Support/ContextClip",
    "~/Library/Caches/com.macplus-software.ContextClip",
    "~/Library/HTTPStorages/com.macplus-software.ContextClip",
    "~/Library/Preferences/com.macplus-software.ContextClip.plist",
    "~/Library/Saved Application State/com.macplus-software.ContextClip.savedState",
  ]
end
