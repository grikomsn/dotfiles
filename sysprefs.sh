#!/usr/bin/env bash

sudo -v
while true; do
  sudo -n true
  sleep 60
  kill -0 "$$" || exit
done 2>/dev/null &

echo "Updating system configurations..."
defaults write NSGlobalDomain AppleShowScrollBars -string "Always"
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true
sudo defaults write /Library/Preferences/com.apple.loginwindow AdminHostInfo HostName
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write com.apple.BluetoothAudioAgent "Apple Bitpool Min (editable)" -int 40
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3
defaults write NSGlobalDomain KeyRepeat -int 1
defaults write NSGlobalDomain InitialKeyRepeat -int 10
launchctl unload -w /System/Library/LaunchAgents/com.apple.rcd.plist 2>/dev/null
defaults write com.apple.finder AppleShowAllFiles -bool true
defaults write NSGlobalDomain AppleShowAllExtensions -bool true
defaults write com.apple.finder ShowStatusBar -bool true
defaults write com.apple.finder ShowPathbar -bool true
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true
defaults write com.apple.finder _FXSortFoldersFirst -bool true
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false
defaults write NSGlobalDomain com.apple.springing.enabled -bool true
defaults write NSGlobalDomain com.apple.springing.delay -float 0
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true
defaults write com.apple.frameworks.diskimages skip-verify -bool true
defaults write com.apple.frameworks.diskimages skip-verify-locked -bool true
defaults write com.apple.frameworks.diskimages skip-verify-remote -bool true
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"
defaults write com.apple.NetworkBrowser BrowseAllInterfaces -bool true
chflags nohidden ~/Library && xattr -d com.apple.FinderInfo ~/Library
sudo chflags nohidden /Volumes
defaults write com.apple.dock enable-spring-load-actions-on-all-items -bool true
defaults write com.apple.dock expose-animation-duration -float 0.1
defaults write com.apple.dock mru-spaces -bool false
defaults write com.apple.dock autohide -bool true
defaults write com.apple.Safari UniversalSearchEnabled -bool false
defaults write com.apple.Safari SuppressSearchSuggestions -bool true
defaults write com.apple.Safari WebKitTabToLinksPreferenceKey -bool true
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2TabsToLinks -bool true
defaults write com.apple.Safari ShowFullURLInSmartSearchField -bool true
defaults write com.apple.Safari AutoOpenSafeDownloads -bool false
defaults write com.apple.Safari IncludeInternalDebugMenu -bool true
defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true
defaults write NSGlobalDomain WebKitDeveloperExtras -bool true
defaults write com.apple.Safari WarnAboutFraudulentWebsites -bool true
defaults write com.apple.Safari SendDoNotTrackHTTPHeader -bool true
defaults write com.apple.mail NSUserKeyEquivalents -dict-add "Send" "@\U21a9"
defaults write com.apple.terminal SecureKeyboardEntry -bool true
defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true
defaults write com.apple.addressbook ABShowDebugMenu -bool true
defaults write com.apple.TextEdit RichText -int 0
defaults write com.apple.TextEdit PlainTextEncoding -int 4
defaults write com.apple.TextEdit PlainTextEncodingForWrite -int 4
defaults write com.apple.DiskUtility DUDebugMenuEnabled -bool true
defaults write com.apple.DiskUtility advanced-image-options -bool true
defaults write com.apple.appstore WebKitDeveloperExtras -bool true
defaults write com.apple.appstore ShowDebugMenu -bool true
defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 1
defaults write com.apple.SoftwareUpdate CriticalUpdateInstall -int 1
defaults -currentHost write com.apple.ImageCapture disableHotPlug -bool true

echo "Done! ✨"
