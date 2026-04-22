#!/usr/bin/env bash
set -euo pipefail

echo "Applying macOS defaults..."

# Keep sudo alive for the duration of the script
sudo -v
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Computer name
sudo scutil --set ComputerName "thatryan-air"
sudo scutil --set LocalHostName "thatryan-air"
sudo scutil --set HostName "thatryan-air"

# ── Finder ────────────────────────────────────────────────────────────────────
defaults write NSGlobalDomain AppleShowAllExtensions -bool true
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false
defaults write com.apple.finder FXPreferredViewStyle -string "clmv"
defaults write com.apple.finder _FXSortFoldersFirst -bool true
defaults write com.apple.finder NewWindowTarget -string "PfHm"
defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}/"
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowPathbar -bool true
defaults write com.apple.finder ShowStatusBar -bool true
defaults write com.apple.finder FinderSpawnTab -bool true
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# Desktop / Stage Manager
defaults write com.apple.WindowManager EnableStandardClickToShowDesktop -bool false

# ── Dock ──────────────────────────────────────────────────────────────────────
defaults write com.apple.dock magnification -bool false
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock orientation -string "bottom"
defaults write com.apple.dock mru-spaces -bool false
defaults write com.apple.dock show-recents -bool false
defaults write com.apple.dock mineffect -string "scale"
defaults write com.apple.dock minimize-to-application -bool true
defaults write com.apple.dock launchanim -bool false

# ── Menu Bar Clock ────────────────────────────────────────────────────────────
defaults write com.apple.menuextra.clock IsAnalog -bool false
defaults write com.apple.menuextra.clock ShowDate -int 1
defaults write com.apple.menuextra.clock ShowDayOfWeek -bool true
defaults write com.apple.menuextra.clock Show24Hour -bool false
defaults write com.apple.menuextra.clock ShowSeconds -bool false

# ── Menu Bar Battery ──────────────────────────────────────────────────────────
defaults write com.apple.controlcenter BatteryShowPercentage -bool true

# ── Power Management ──────────────────────────────────────────────────────────
sudo pmset -b displaysleep 5
sudo pmset -b sleep 15
sudo pmset -b powernap 0
sudo pmset -b tcpkeepalive 1
sudo pmset -c displaysleep 30
sudo pmset -c sleep 0
sudo pmset -c powernap 1
sudo pmset -c tcpkeepalive 1

# ── Mission Control / Spaces ──────────────────────────────────────────────────
# Requires logout to take effect
defaults write com.apple.spaces spans-displays -bool false

# ── Keyboard ──────────────────────────────────────────────────────────────────
defaults write NSGlobalDomain KeyRepeat -int 2
defaults write NSGlobalDomain InitialKeyRepeat -int 15

# ── Typing / autocorrect ──────────────────────────────────────────────────────
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false
defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false
defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -bool false

# ── Trackpad ──────────────────────────────────────────────────────────────────
# Disable three-finger tap "Look Up" (covers both built-in and bluetooth)
defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerTapGesture -int 0
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerTapGesture -int 0

# ── Screenshots ───────────────────────────────────────────────────────────────
defaults write com.apple.screencapture disable-shadow -bool true
defaults write com.apple.screencapture type -string "png"

# ── Privacy ───────────────────────────────────────────────────────────────────
defaults write com.apple.assistant.support "Search Queries Data Sharing Status" -int 2

# ── Windows ───────────────────────────────────────────────────────────────────
# Restore windows when re-opening an app (uncheck "Close windows when quitting")
defaults write NSGlobalDomain NSQuitAlwaysKeepsWindows -bool true
# Open new documents in tabs always
defaults write NSGlobalDomain AppleWindowTabbingMode -string "always"
# No margins on tiled windows
defaults write com.apple.WindowManager EnableTiledWindowMargins -bool false
defaults write com.apple.WindowManager EnableTilingByEdgeDrag -bool false
defaults write com.apple.WindowManager EnableTilingOptionAccelerator -bool false
defaults write com.apple.WindowManager EnableTopTilingByEdgeDrag -bool false

# ── Scrolling ─────────────────────────────────────────────────────────────────
# Click in scrollbar jumps to that position instead of paging
defaults write NSGlobalDomain AppleScrollerPagingBehavior -bool true

# ── TextEdit ──────────────────────────────────────────────────────────────────
defaults write com.apple.TextEdit RichText -int 0

rm -f ~/Library/Preferences/com.apple.finder.plist
killall Finder || true
killall Dock || true

echo ""
echo "Notes:"
echo "  - 'Displays have separate spaces' requires a logout to take effect."
echo "  - Keyboard repeat settings may require a full restart to apply."
echo "Done."
