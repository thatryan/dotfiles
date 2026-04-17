# macOS manual setup notes

Items that can be scripted are in defaults.sh. This file covers what must be done by hand.

## Finder / Desktop
- sidebar: remove unwanted items, add favorites
- desktop icon size: adjust to preference (System Settings → Desktop & Dock → Size slider)
- desktop icon grid spacing and arrangement

## Spotlight
- prune unwanted result categories (System Settings → Siri & Spotlight)

## Displays / Spaces
- "displays have separate spaces" is scripted in defaults.sh but requires a logout to take effect

## Screenshots
- disable default macOS screenshot hotkeys so they don't conflict with CleanShot
  System Settings → Keyboard → Keyboard Shortcuts → Screenshots → uncheck all
- configure CleanShot save location and hotkeys

## Trackpad
- click pressure / feel (System Settings → Trackpad)
- scrolling direction (System Settings → Trackpad → Scroll & Zoom)
- three-finger tap "Look Up" is disabled via defaults.sh

## Browser
- set default browser to Chrome (System Settings → Desktop & Dock → Default web browser)
  or prompted on first Chrome launch

## Menu bar / Control Center
- confirm what should stay visible
- re-check after Bartender is set up
