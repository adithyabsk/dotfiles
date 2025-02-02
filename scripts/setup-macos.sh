#!/bin/bash

# Inspiration: https://pawelgrzybek.com/change-macos-user-preferences-via-command-line/

echo "Configuring macOS preferred system settings..."

set -x

################################################################################
# System Preferences > Sound
################################################################################

# Play feedback when volume is changed
defaults write -globalDomain "com.apple.sound.beep.feedback" -int 1

################################################################################
# System Preferences > Appearance
################################################################################

# Appearance: Auto Switch between dark and light mode
defaults write -globalDomain AppleInterfaceStyleSwitchesAutomatically -bool true

# Click in the scrollbar to: Jump to the spot that's clicked
defaults write -globalDomain AppleScrollerPagingBehavior -bool true

################################################################################
# System Preferences > Control Centre
################################################################################

# Control Centre Modules > Bluetooth > Show in Menu Bar
defaults write "com.apple.controlcenter" "NSStatusItem Visible Bluetooth" -bool true

# Menu Bar Only > Spotlight > Don't Show in Menu Bar
defaults write -globalDomain "com.apple.Spotlight MenuItemHidden" -int 1

# Menu Bar Only > Clock > Sytle: Analog
defaults write "com.apple.menuextra.clock" IsAnalog -int 1

################################################################################
# System Preferences > Desktop & Dock
################################################################################

# Dock > Automatically hide and show the Dock
defaults write "com.apple.dock" autohide -int 1

# Dock > Automatically hide and show the Dock (duration)
defaults write "com.apple.dock" autohide-time-modifier -float 0.4

# Dock > Automatically hide and show the Dock (delay)
defaults write "com.apple.dock" autohide-delay -float 0

# Show recent applications in Dock
defaults write "com.apple.dock" "show-recents" -bool false

################################################################################
# System Preferences > Keyboard
################################################################################

# Key repeat rate
defaults write -globalDomain KeyRepeat -int 1

# Delay until repeat
defaults write -globalDomain InitialKeyRepeat -int 15

################################################################################
# Finder > Preferences
################################################################################

# Show all filename extensions
defaults write -globalDomain AppleShowAllExtensions -bool true

# Show warning before changing an extension
defaults write "com.apple.finder" FXEnableExtensionChangeWarning -bool false

# Finder > View > As List
defaults write "com.apple.finder" FXPreferredViewStyle -string "Nlsv"

# Finder > View > Show Path Bar
defaults write "com.apple.finder" ShowPathbar -bool true

set +x

echo "Restarting affected apps..."

# Kill affected apps
for app in "Dock" "Finder"; do
  killall "${app}" > /dev/null 2>&1
done

# Done
echo "Done. Note that some of these changes require a logout/restart to take effect."
