cask "flexinet" do
  version "1.0"
  sha256 "f8cd643f58651264c104bfa2d2d416c22604aa138ed4011ce152773e9e517409"

  url "https://macplus-software.com/downloads/FlexiNet.zip",
      verified: "macplus-software.com/downloads/"
  name "FlexiNet"
  desc "Menu bar switcher for network locations"
  homepage "https://noteifyapp.com/flexinet/"

  livecheck do
    skip "No update feed"
  end

  depends_on macos: ">= :mojave"

  app "FlexiNet.app"

  zap trash: [
    "~/Library/Application Support/FlexiNet",
    "~/Library/Caches/com.macplus-software.FlexiNet",
    "~/Library/HTTPStorages/com.macplus-software.FlexiNet",
    "~/Library/Preferences/com.macplus-software.FlexiNet.plist",
    "~/Library/Saved Application State/com.macplus-software.FlexiNet.savedState",
  ]
end
