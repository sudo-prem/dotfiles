cask "cleanshot@4.8.10" do
  version "4.8.10"
  sha256 "0f1b1cdda9a93908ced0341abb0d505adc55e51d145562013085b1e70f366d84"

  url "https://updates.getcleanshot.com/v3/CleanShot-X-#{version}.dmg"
  name "CleanShot"
  desc "Screen capturing tool"
  homepage "https://cleanshot.com/"

  auto_updates true
  conflicts_with cask: "cleanshot"
  depends_on :macos

  app "CleanShot X.app"
end
