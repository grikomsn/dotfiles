function reset-launchpad --description 'reset launchpad'
    defaults write com.apple.dock ResetLaunchPad -bool true
    killall Dock
end
