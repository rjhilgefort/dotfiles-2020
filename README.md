# @rjhilgefort Dotfiles

@rjhilgefort's dotfiles. These are the most recent as of 2022.

## New Mac Setup

Almost certainly incomplete instructions for what you need to do when setting up a new machine. This was last updated on _06/11/2022_.

## Home Brew + Apps

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
brew install cleanshot
brew install bartender
brew install daisydisk
brew install spotify
brew install zsa-wally
brew install --cask 1password/tap/1password-cli
brew install arctype
brew install fantastical
brew install postgresql
brew install difftastic
```

Pruned list 2024

```sh
brew install arc
brew install 1password
brew install raycast
brew install karabiner-elements
brew install slack
brew install jq
brew install git-extras
brew install --cask wezterm
brew install fantastical
brew install direnv
brew install starship
brew install synology-drive
brew install rcm
brew install antigen
brew install lua
brew install jq
brew install koekeishiya/formulae/yabai
brew install koekeishiya/formulae/skhd
brew install visual-studio-code
brew install nvm
brew install tig
brew install borders
brew install cleanshot
brew install spotify
brew install todoist
# https://github.com/creimers/heic-to-jpg
brew install imagemagick
python3 -m pip install heic-to-jpg
```

## Synology

```sh
brew install synology-drive
```

Need to sync `Store`

- Alfred settings
- Fonts
- Raycast export

## Key Repeat

```sh
defaults write NSGlobalDomain InitialKeyRepeat -int 10
defaults write NSGlobalDomain KeyRepeat -int 1
```

Log out and log back in.

## Track Pad settings

- Tap to click
  - System Preferences > Trackpad > Tap to click.
- Three finger drag
  - System Preferences > Accessibility > Pointer Controls > Trackpad Options > Enable Dragging > three finger drag

## Spaces Reordering

By default, spaces will reorder so you'll want to turn that off:
System Preferences > Mission Control > Automatically rearrange > off

## Dock

To have the dock be delayed from popping up, set the delay to a really long time

```sh
defaults write com.apple.dock autohide-delay -float 1000; killall Dock
```

Restore the behavior with

```sh
defaults delete com.apple.dock autohide-delay; killall Dock
```

Instead of setting a small delay to get your dock back when needed, simply unhide the dock with command-option-D. This basically gives you full control on when you want to see your dock.

## SSH

Can be found in your `Store` folder. Symlink them to your home directory (`.ssh`).

```sh
ln -s ~/Store/AppData/ssh ~/.ssh
```

You'll likely need to tighten restrictions like this:

```sh
chmod 600 ~/.ssh/id_rsa # or whatever private key
```

## Fonts

Font is mostly configured to use "Dank Mono". Can be found in your `Store` folder:

```
cd ~/Store/Programming/Fonts/DankMono-491/
open .
```

I've always installed the `otf` ones but `ttf` will also work. Open the folder and double click each file.

### Dotfiles, RCM, Antigen

```sh
# Dotfiles download
mkdir ~/Code
cd ~/Code
mkdir personal
cd personal
git clone git@github.com:rjhilgefort/dotfiles-2020.git
cd ~
ln -s ~/Code/personal/dotfiles-2020 ~/.dotfiles

# RCM
brew install rcm
lsrc # dry run
rcup

# Antigen
brew install antigen
brew install lua
mkdir ~/.bin
cp -a /opt/homebrew/share/antigen/antigen.zsh ~/.bin/
# Open a new shell
```

To add a new `config` directory and link it to the home directory:

```sh
cd ~/Code/personal/dotfiles-2020
cd config
# add the new config directory
mkrc [directory]
cd ~/
rcup -v
```

More info: https://thoughtbot.github.io/rcm/rcm.7.html

### Yabai

https://github.com/koekeishiya/yabai/wiki/Installing-yabai-(latest-release)

```sh
# Disable SIP

brew install jq
# install "borders", see yabairc
brew install koekeishiya/formulae/yabai
brew install koekeishiya/formulae/skhd

sudo nvram boot-args=-arm64e_preview_abi
# reboot

sudo yabai --install-sa
sudo yabai --load-sa

yabai --start-service && skhd --start-service
# or
yabai --restart-service && skhd --restart-service
```

### VSCode

Install VSCode

```sh
brew install visual-studio-code

# Allows press and hold in VIM
defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false
```

Turn on settings sync, sign in with GitHub.

Setup `code-file-nav` extension.

```sh
cp -a ~/Store/Programming/VSCodeExtensions/jakelucas.code-file-nav-0.7.2 ~/.vscode/extensions
```

Update `~/.vscode/extensions/extensions.json` to include the following (in alphabetical order I think?):

```json
  {
    "identifier": {
      "id": "jakelucas.code-file-nav",
      "uuid": "e3f26909-4865-4350-a891-1dfd2a411fc1"
    },
    "version": "0.7.2",
    "location": {
      "$mid": 1,
      "path": "/Users/<YOUR_USERNAME>/.vscode/extensions/jakelucas.code-file-nav-0.7.2",
      "scheme": "file"
    },
    "relativeLocation": "jakelucas.code-file-nav-0.7.2",
    "metadata": {
      "id": "e3f26909-4865-4350-a891-1dfd2a411fc1",
      "publisherId": "d903e6ed-dc7a-4bf6-847c-31043b25bcc4",
      "publisherDisplayName": "Jake Lucas"
    }
  },
```

Restart VSCode. If it errors, try again

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

## Raycast

You can find latest export in `~/Store/AppData/raycast`. Boot Raycast and import your settings.

### Bookmarks

```sh
git clone git@github.com:JoshYork/raycast-bookmarks.git
cd raycast-bookmarks
npm install
npm run build
```

- Import the extension in Raycast
- Select the root folder that you cloned (not some build directory)
- Add GH token (1Pass)
- Add Gist id: `98117c3e24c9c0ca3152eb682eb12926`
- Then setup your shortcuts and hotkeys (b, ba)

## Cleanshot

```sh
brew install cleanshot
```

Go to preferences on your old machine and match them on the new machine.

## Metamask + Ronin Wallet

Chrome extensions, recover your wallet with your seed phrase and remove from old computer.

Test out by playing Axie Infinity.
