# @rjhilgefort Dotfiles

@rjhilgefort's dotfiles. These are the most recent as of 2022.

## New Mac Setup

Almost certainly incomplete instructions for what you need to do when setting up a new machine. This was last updated on _06/11/2022_.

### Home Brew + Apps

```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

Make yourself a quick script and copy this in

```sh
brew tap wez/wezterm && brew install --cask wez/wezterm/wezterm
brew install alfred
brew install discord
brew install 1password
brew install tig
brew install notion
brew install cacher
brew install todoist
brew install nvm
brew install neofetch
brew install antigen
brew install lua
# brew install insomnia
brew install tree
brew install keycastr
brew install rcm
brew install rg
brew install karabiner-elements
brew install tophat/bar/yvm
brew install wget
brew install ngrok
brew install battle-net
brew install jq
# brew install gimp
brew install drawio
brew install istat-menus
brew install google-cloud-sdk
# brew install balenaetcher
# brew install wimlib
brew install go
brew install visual-studio-code
brew install python
brew install tunnelblick
brew install runjs
brew install plex
brew install plexamp
# brew install toggl-track
brew install signal
brew install git-extras
brew install fig
brew install fzf
brew install steam
brew install postman
brew install android-file-transfer
brew install ripgrep
brew install ripgrep-all
brew install vlc
brew install git-lfs
brew install docker
brew install expressvpn
brew install obs
brew install blackhole-2ch
brew install raycast
brew install redis
brew install dbus && brew services start dbus
brew install android-messages
```

### Synology

```sh
brew install homebrew/cask-drivers/synology-drive
```

Need to sync `Store`

- Alfred settings
- Fonts

### Key Repeat

```sh
defaults write NSGlobalDomain InitialKeyRepeat -int 10
defaults write NSGlobalDomain KeyRepeat -int 1
```

### Track Pad settings

- Tap to click
  - System Preferences > Trackpad > Tap to click.
- Three finger drag
  - System Preferences > Accessibility > Pointer Controls > Trackpad Options > Enable Dragging > three finger drag

### SSH

Grab your settings from your old machine and put them in `.ssh`. You'll likely need to tighten restrictions like this:

```sh
chmod 600 ~/.ssh/<private_key>
```

### Fonts

FOnt is mostly configured to use "Dank Mono". Thank can be found in your `Store` folder:

```
cd ~/Store/Programming/Fonts/DankMono-491/
open .
```

I've always installed the `otf` ones but `ttf` will also work. Open the folder and double click each file.

### Dotfiles, RCM, Antigen, Kitty

```sh
# Dotfiles download
mkdir ~/Code
cd ~/Code
git clone git@github.com:rjhilgefort/dotfiles-2020.git
cd ~
ln -s ~/Code/dotfiles-2020 ~/.dotfiles

# RCM
brew install rcm
lsrc # dry run
rcup

# Antigen
brew install antigen
brew install lua
mkdir ~/.bin
cp -a /usr/local/share/antigen/antigen.zsh ~/.bin/
# Open a new shell

# Kitty
git clone --depth 1 git@github.com:dexpota/kitty-themes.git ~/.config/kitty/kitty-themes
ln -sf ./kitty-themes/themes/snazzy.conf ~/.config/kitty/theme.conf
```

### Yabai

For macOS 12.x.x

```sh
brew install jq
brew install koekeishiya/formulae/yabai --HEAD
brew install koekeishiya/formulae/skhd

brew services start yabai && brew services start skhd

sudo yabai --install-sa
sudo yabai --load-sa

brew services restart yabai && brew services restart skhd
```

### VSCode

```sh
brew install visual-studio-code

# Allows press and hold in VIM
defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false

# Unmaintained extension that I store
cp -a ~/Store/Programming/VSCodeExtensions/jakelucas.code-file-nav-0.7.2 ~/.vscode/extensions
```

## Make Calendar Light Mode Always

Overrides system preference.

```sh
osascript -e 'id of app "Calendar"'
defaults write com.apple.iCal NSRequiresAquaSystemAppearance -bool Yes
```

Restore defaults

```sh
defaults delete com.apple.iCal NSRequiresAquaSystemAppearance
```
