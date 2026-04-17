#!/usr/bin/env bash
set -euo pipefail

echo "Applying macOS defaults..."

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

# ── Dock ──────────────────────────────────────────────────────────────────────
defaults write com.apple.dock magnification -bool false
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock orientation -string "bottom"
defaults write com.apple.dock mru-spaces -bool false
defaults write com.apple.dock show-recents -bool false
defaults write com.apple.dock mineffect -string "scale"
defaults write com.apple.dock minimize-to-application -bool true
defaults write com.apple.dock launchanim -bool false

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

# ── Scrolling ─────────────────────────────────────────────────────────────────
# Click in scrollbar jumps to that position instead of paging
defaults write NSGlobalDomain AppleScrollerPagingBehavior -bool false

# ── TextEdit ──────────────────────────────────────────────────────────────────
defaults write com.apple.TextEdit RichText -int 0

killall Finder || true
killall Dock || true

echo ""
echo "Note: 'displays have separate spaces' requires a logout to take effect."
echo "Done."
