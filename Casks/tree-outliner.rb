cask "tree-outliner" do
  version "1.0.8"
  sha256 "492a443a7cab4cf25af8adc2c47deac6c82a8fb1731c94999570a1742fe80f57"

  url "https://macplus-software.com/downloads/Tree%20Outliner.zip",
      verified: "macplus-software.com/downloads/"
  name "Tree Outliner"
  desc "Text outliner with list and horizontal tree views"
  homepage "https://noteifyapp.com/tree-outliner/"

  livecheck do
    url "https://macplus-software.com/downloads/Tree%20Outliner.xml"
    strategy :sparkle, &:short_version
  end

  auto_updates true
  depends_on macos: ">= :sonoma"

  app "Tree Outliner.app"

  zap trash: [
    "~/Library/Application Support/Tree Outliner",
    "~/Library/Caches/com.macplus-software.treeoutliner",
    "~/Library/HTTPStorages/com.macplus-software.treeoutliner",
    "~/Library/Preferences/com.macplus-software.treeoutliner.plist",
    "~/Library/Saved Application State/com.macplus-software.treeoutliner.savedState",
  ]
end
