# dotfiles-2020

TODO

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
