#!/bin/sh

# Some things taken from here
# https://github.com/mathiasbynens/dotfiles/blob/master/.osx

# Set the colours you can use
black='\033[0;30m'
white='\033[0;37m'
red='\033[0;31m'
green='\033[0;32m'
yellow='\033[0;33m'
blue='\033[0;34m'
magenta='\033[0;35m'
cyan='\033[0;36m'


#  Reset text attributes to normal + without clearing screen.
alias Reset="tput sgr0"

# Color-echo.
# arg $1 = message
# arg $2 = Color
cecho() {
  echo "${2}${1}"
  Reset # Reset to normal.
  return
}

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until script has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

cecho "##############################################" $white
cecho "#  This script will make your Ã¯Â£Â¿ Mac awesome." $white
cecho "#   Follow the prompts and you'll be fine." $white
cecho "#" $white
cecho "#            ~ Happy Hacking ~" $white
cecho "#############################################" $white


###############################################################################
# General UI/UX
###############################################################################

echo "Setting your computer name (as done via System Preferences & Sharing)"
echo "What would you like it to be?"
read COMPUTER_NAME
sudo scutil --set ComputerName $COMPUTER_NAME
sudo scutil --set HostName $COMPUTER_NAME
sudo scutil --set LocalHostName $COMPUTER_NAME
sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName -string $COMPUTER_NAME

echo "Hiding the Time Machine, Volume, User, and Bluetooth icons"
for domain in ~/Library/Preferences/ByHost/com.apple.systemuiserver.*; do
  defaults write "${domain}" dontAutoLoad -array \
    "/System/Library/CoreServices/Menu Extras/TimeMachine.menu" \
    "/System/Library/CoreServices/Menu Extras/Volume.menu" \
    "/System/Library/CoreServices/Menu Extras/User.menu"
done
defaults write com.apple.systemuiserver menuExtras -array \
  "/System/Library/CoreServices/Menu Extras/Bluetooth.menu" \
  "/System/Library/CoreServices/Menu Extras/AirPort.menu" \
  "/System/Library/CoreServices/Menu Extras/Battery.menu" \
  "/System/Library/CoreServices/Menu Extras/Clock.menu"

echo "Hide the Spotlight icon?"
select yn in "Yes" "No"; do
  case $yn in
    Yes ) sudo chmod 600 /System/Library/CoreServices/Search.bundle/Contents/MacOS/Search
        break;;
    No ) break;;
  esac
done

echo "Disabling OS X Gate Keeper"
echo "(You'll be able to install any app you want from here on, not just Mac App Store apps)"
sudo spctl --master-disable
sudo defaults write /var/db/SystemPolicy-prefs.plist enabled -string no
defaults write com.apple.LaunchServices LSQuarantine -bool false

echo "Increasing the window resize speed for Cocoa applications"
defaults write NSGlobalDomain NSWindowResizeTime -float 0.001

echo "Expanding the save panel by default"
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true

echo "Automatically quit printer app once the print jobs complete"
defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true

# Try e.g. `cd /tmp; unidecode "\x{0000}" > cc.txt; open -e cc.txt`
echo "Displaying ASCII control characters using caret notation in standard text views"
defaults write NSGlobalDomain NSTextShowsControlCharacters -bool true

echo "Disabling system-wide resume"
defaults write NSGlobalDomain NSQuitAlwaysKeepsWindows -bool false

echo "Disabling automatic termination of inactive apps"
defaults write NSGlobalDomain NSDisableAutomaticTermination -bool true

echo "Saving to disk (not to iCloud) by default"
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

echo "Reveal IP address, hostname, OS version, etc. when clicking the clock in the login window"
sudo defaults write /Library/Preferences/com.apple.loginwindow AdminHostInfo HostName

echo "Never go into computer sleep mode"
systemsetup -setcomputersleep Off > /dev/null

echo "Check for software updates daily, not just once per week"
defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 1

echo "Remove duplicates in the 'Open With' menu"
/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user

echo "Disable smart quotes and smart dashes as they're annoying when typing code"
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false


###############################################################################
# Trackpad, mouse, keyboard, Bluetooth accessories, and input
###############################################################################

echo "Increasing sound quality for Bluetooth headphones/headsets"
defaults write com.apple.BluetoothAudioAgent "Apple Bitpool Min (editable)" -int 40

echo "Enabling full keyboard access for all controls (e.g. enable Tab in modal dialogs)"
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

echo "Disabling press-and-hold for keys in favor of a key repeat"
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

echo "Setting a blazingly fast keyboard repeat rate (ain't nobody got time fo special chars while coding!)"
defaults write NSGlobalDomain KeyRepeat -int 0

echo "Disabling auto-correct"
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

echo "Setting trackpad & mouse speed to a reasonable number"
defaults write -g com.apple.trackpad.scaling 2
defaults write -g com.apple.mouse.scaling 2.5

echo "Turn off keyboard illumination when computer is not used for 5 minutes"
defaults write com.apple.BezelServices kDimTime -int 300

###############################################################################
# Screen
###############################################################################

echo "Requiring password immediately after sleep or screen saver begins"
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0

echo "Where do you want screenshots to be stored? (hit ENTER if you want ~/Desktop as default)"
read screenshot_location
if [ -z "$1" ]
then
    echo "Setting location to ~/Desktop"
  defaults write com.apple.screencapture location -string "$HOME/Desktop"
else
    echo "Setting location to ~/$screenshot_location"
  defaults write com.apple.screencapture location -string "$HOME/$screenshot_location"
fi

echo "What format should screenshots be saved as? (hit ENTER for PNG, options: BMP, GIF, JPG, PDF, TIFF) "
read screenshot_format
if [ -z "$1" ]
then
    echo "Setting screenshot format to PNG"
  defaults write com.apple.screencapture type -string "png"
else
    echo "Setting screenshot format to $screenshot_format"
  defaults write com.apple.screencapture type -string "$screenshot_format"
fi


echo "Enabling subpixel font rendering on non-Apple LCDs"
defaults write NSGlobalDomain AppleFontSmoothing -int 2

echo "Enabling HiDPI display modes (requires restart)"
sudo defaults write /Library/Preferences/com.apple.windowserver DisplayResolutionEnabled -bool true

###############################################################################
# Finder
###############################################################################

echo "Not showing icons for hard drives, servers, and removable media on the desktop"
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool false

echo "Show hidden files in Finder by default?"
select yn in "Yes" "No"; do
  case $yn in
    Yes ) defaults write com.apple.Finder AppleShowAllFiles -bool true
        break;;
    No ) break;;
  esac
done

echo "Show dotfiles in Finder by default?"
select yn in "Yes" "No"; do
  case $yn in
    Yes ) defaults write com.apple.finder AppleShowAllFiles TRUE
        break;;
    No ) break;;
  esac
done

echo "Showing all filename extensions in Finder by default"
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

echo "Showing status bar in Finder by default"
defaults write com.apple.finder ShowStatusBar -bool true

echo "Allowing text selection in Quick Look/Preview in Finder by default"
defaults write com.apple.finder QLEnableTextSelection -bool true

echo "Displaying full POSIX path as Finder window title"
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

echo "Disabling the warning when changing a file extension"
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

echo "Use column view in all Finder windows by default"
defaults write com.apple.finder FXPreferredViewStyle Clmv

echo "Avoiding the creation of .DS_Store files on network volumes"
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

echo "Disabling disk image verification"
defaults write com.apple.frameworks.diskimages skip-verify -bool true
defaults write com.apple.frameworks.diskimages skip-verify-locked -bool true
defaults write com.apple.frameworks.diskimages skip-verify-remote -bool true

echo "Enabling snap-to-grid for icons on the desktop and in other icon views"
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist


###############################################################################
# Dock & Mission Control
###############################################################################

# Wipe all (default) app icons from the Dock
# This is only really useful when setting up a new Mac, or if you don't use
# the Dock to launch apps.
defaults write com.apple.dock persistent-apps -array

echo "Setting the icon size of Dock items to 36 pixels for optimal size/screen-realestate"
defaults write com.apple.dock tilesize -int 36

echo "Speeding up Mission Control animations and grouping windows by application"
defaults write com.apple.dock expose-animation-duration -float 0.1
defaults write com.apple.dock "expose-group-by-app" -bool true

echo "Setting Dock to auto-hide and removing the auto-hiding delay"
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock autohide-delay -float 0
defaults write com.apple.dock autohide-time-modifier -float 0


###############################################################################
# Safari & WebKit
###############################################################################

echo "Hiding Safari's bookmarks bar by default"
defaults write com.apple.Safari ShowFavoritesBar -bool false

echo "Hiding Safari's sidebar in Top Sites"
defaults write com.apple.Safari ShowSidebarInTopSites -bool false

echo "Disabling Safari's thumbnail cache for History and Top Sites"
defaults write com.apple.Safari DebugSnapshotsUpdatePolicy -int 2

echo "Enabling Safari's debug menu"
defaults write com.apple.Safari IncludeInternalDebugMenu -bool true

echo "Making Safari's search banners default to Contains instead of Starts With"
defaults write com.apple.Safari FindOnPageMatchesWordStartsOnly -bool false

echo "Removing useless icons from Safari's bookmarks bar"
defaults write com.apple.Safari ProxiesInBookmarksBar "()"

echo "Allow hitting the Backspace key to go to the previous page in history"
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2BackspaceKeyNavigationEnabled -bool true

echo "Enabling the Develop menu and the Web Inspector in Safari"
defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
defaults write com.apple.Safari "com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled" -bool true

echo "Adding a context menu item for showing the Web Inspector in web views"
defaults write NSGlobalDomain WebKitDeveloperExtras -bool true


###############################################################################
# Mail
###############################################################################

echo "Setting email addresses to copy as 'foo@example.com' instead of 'Foo Bar <foo@example.com>' in Mail.app"
defaults write com.apple.mail AddressesIncludeNameOnPasteboard -bool false


###############################################################################
# Terminal
###############################################################################

echo "Enabling UTF-8 ONLY in Terminal.app and setting the Pro theme by default"
defaults write com.apple.terminal StringEncodings -array 4
defaults write com.apple.Terminal "Default Window Settings" -string "Pro"
defaults write com.apple.Terminal "Startup Window Settings" -string "Pro"


###############################################################################
# Time Machine
###############################################################################

echo "Preventing Time Machine from prompting to use new hard drives as backup volume"
defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true

echo "Disabling local Time Machine backups"
hash tmutil &> /dev/null && sudo tmutil disablelocal


###############################################################################
# Messages                                                                    #
###############################################################################

echo "Disable automatic emoji substitution (i.e. use plain text smileys)"
defaults write com.apple.messageshelper.MessageController SOInputLineSettings -dict-add "automaticEmojiSubstitutionEnablediMessage" -bool false

echo "Disable smart quotes as it's annoying for messages that contain code"
defaults write com.apple.messageshelper.MessageController SOInputLineSettings -dict-add "automaticQuoteSubstitutionEnabled" -bool false

echo "Disable continuous spell checking"
defaults write com.apple.messageshelper.MessageController SOInputLineSettings -dict-add "continuousSpellCheckingEnabled" -bool false


###############################################################################
# Transmission.app                                                            #
###############################################################################

echo "Use `~/Downloads/Incomplete` to store incomplete downloads"
defaults write org.m0k.transmission UseIncompleteDownloadFolder -bool true
defaults write org.m0k.transmission IncompleteDownloadFolder -string "${HOME}/Downloads/Incomplete"

echo "Don't prompt for confirmation before downloading"
defaults write org.m0k.transmission DownloadAsk -bool false

echo "Trash original torrent files"
defaults write org.m0k.transmission DeleteOriginalTorrent -bool true

echo "Hide the donate message"
defaults write org.m0k.transmission WarningDonate -bool false

echo "Hide the legal disclaimer"
defaults write org.m0k.transmission WarningLegal -bool false


###############################################################################
# Personal Additions
###############################################################################

echo "Disable hibernation (speeds up entering sleep mode)"
sudo pmset -a hibernatemode 0

echo "Remove the sleep image file to save disk space"
sudo rm /Private/var/vm/sleepimage
echo "creating a zero-byte file instead"
sudo touch /Private/var/vm/sleepimage
echo "and make sure it can't be rewritten"
sudo chflags uchg /Private/var/vm/sleepimage

# echo "Disable the sudden motion sensor as it's not useful for SSDs"
# sudo pmset -a sms 0

echo "Speeding up wake from sleep to 24 hours from an hour"
# http://www.cultofmac.com/221392/quick-hack-speeds-up-retina-macbooks-wake-from-sleep-os-x-tips/
sudo pmset -a standbydelay 86400

echo "Disable annoying backswipe in Chrome"
defaults write com.google.Chrome AppleEnableSwipeNavigateWithScrolls -bool false


###############################################################################
# Sublime Text
###############################################################################
echo "Do you use Sublime Text 3 as your editor of choice and is it installed?"
select yn in "Yes" "No"; do
  case $yn in
    Yes ) echo "Linking Sublime Text command line"
        ln -s "/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl" /usr/local/bin/subl
        echo "Setting Git to use Sublime Text as default editor"
        git config --global core.editor "subl -n -w"
        echo "Removing Mission Control as it interferes with Sublime Text keyboard shortcut for selecting multiple lines"
        defaults write com.apple.dock mcx-expose-disabled -bool TRUE
        break;;
    No ) break;;
  esac
done

###############################################################################
# Git
###############################################################################
echo "Setting up global Git user"
echo "What is your name?"
read git_name
git config --global user.name "$git_name"
echo "What is your email?"
read git_email
git config --global user.email "$git_email"
git config --global push.default simple


###############################################################################
# Kill affected applications
###############################################################################

cecho "Done!" $white
cecho "###############################################################################" $white
cecho "Note that some of these changes require a logout/restart to take effect." $white
cecho "Killing some open applications in order to take effect." $white

find ~/Library/Application\ Support/Dock -name "*.db" -maxdepth 1 -delete
for app in "Activity Monitor" "Address Book" "Calendar" "Contacts" "cfprefsd" \
  "Dock" "Finder" "Mail" "Messages" "Safari" "SystemUIServer" \
  "Terminal" "Transmission"; do
  killall "${app}" > /dev/null 2>&1
done
