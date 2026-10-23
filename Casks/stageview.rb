cask "stageview" do
  version "2.0"
  sha256 "ec02717958b71516b60697ae44af5038a4bbe5ef65189ec3b28f69549c56cf7d"

  url "https://macplus-software.com/downloads/StageView%202.zip",
      verified: "macplus-software.com/downloads/"
  name "StageView"
  desc "Window previews for Stage Manager groups"
  homepage "https://noteifyapp.com/stage-view/"

  livecheck do
    url "https://macplus-software.com/downloads/StageView%202.xml"
    strategy :sparkle, &:short_version
  end

  auto_updates true
  depends_on macos: ">= :sonoma"

  app "StageView 2.app"

  zap trash: [
    "~/Library/Application Support/StageView 2",
    "~/Library/Caches/com.macplus-software.Stage-View",
    "~/Library/HTTPStorages/com.macplus-software.Stage-View",
    "~/Library/Preferences/com.macplus-software.Stage-View.plist",
    "~/Library/Saved Application State/com.macplus-software.Stage-View.savedState",
  ]
end
