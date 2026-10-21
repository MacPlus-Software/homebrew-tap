cask "clipboardgrid" do
  version "1.0.2"
  sha256 "38809902de48cd495351e4ff47e7090ccf3d34631334feee814a9010c92eb351"

  url "https://macplus-software.com/downloads/ClipboardGrid.zip",
      verified: "macplus-software.com/downloads/"
  name "ClipboardGrid"
  desc "Clipboard history shown as a grid of large cards"
  homepage "https://noteifyapp.com/clipboardgrid/"

  livecheck do
    url "https://macplus-software.com/downloads/ClipboardGrid.xml"
    strategy :sparkle, &:short_version
  end

  auto_updates true
  depends_on macos: ">= :sonoma"

  app "ClipboardGrid.app"

  zap trash: [
    "~/Library/Application Support/ClipboardGrid",
    "~/Library/Caches/com.macplus-software.ClipboardGrid",
    "~/Library/HTTPStorages/com.macplus-software.ClipboardGrid",
    "~/Library/Preferences/com.macplus-software.ClipboardGrid.plist",
    "~/Library/Saved Application State/com.macplus-software.ClipboardGrid.savedState",
  ]
end
