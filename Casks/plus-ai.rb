cask "plus-ai" do
  version "1.85"
  sha256 "e79d5e6df5eba3f17348e0720e3daf323c404a6e5d227d5005fd4cb88d205103"

  url "https://macplus-software.com/downloads/Plus.zip",
      verified: "macplus-software.com/downloads/"
  name "Plus AI"
  desc "AI text assistant for selected text using an OpenAI API key"
  homepage "https://noteifyapp.com/plus-ai/"

  livecheck do
    url "https://macplus-software.com/downloads/Plus%20AI.xml"
    strategy :sparkle, &:short_version
  end

  auto_updates true
  depends_on macos: ">= :ventura"

  app "Plus.app"

  zap trash: [
    "~/Library/Application Support/Plus",
    "~/Library/Caches/com.macplus-software.PlusAI",
    "~/Library/HTTPStorages/com.macplus-software.PlusAI",
    "~/Library/Preferences/com.macplus-software.PlusAI.plist",
    "~/Library/Saved Application State/com.macplus-software.PlusAI.savedState",
  ]
end
