# @rjhilgefort Dotfiles

@rjhilgefort's dotfiles. These are the most recent as of 2022.

## New Mac Setup

Almost certainly incomplete instructions for what you need to do when setting up a new machine. This was last updated on _03/06/2022_.

### Home Brew + Apps

TODO: Grep your output, include their instructions

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
