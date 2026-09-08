cask "sudo-prem-bettermouse@1.6.8812" do
  version "1.6,8812"
  sha256 "2accad170889f362da8f9383efb4738e5fab88d8f5345f4e356ed52c47372de6"

  url "https://better-mouse.com/wp-content/uploads/BetterMouse.#{version.csv.first}.#{version.csv.second}.zip"
  name "BetterMouse"
  desc "Utility improving third-party mouse performance and functionality"
  homepage "https://better-mouse.com/"

  auto_updates true
  conflicts_with cask: "bettermouse"
  depends_on macos: :big_sur

  app "BetterMouse.app"
end
