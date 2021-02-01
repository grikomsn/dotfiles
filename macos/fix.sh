#!/usr/bin/env zsh

# fix codesign related issues
codesign --remove-signature /Applications/GitKraken.app/Contents/Frameworks/GitKraken\ Helper\ \(Renderer\).app
codesign -f -s - /Applications/Discord.app/Contents/Frameworks/Discord\ Helper\ \(Renderer\).app

echo "Done! ✨"
