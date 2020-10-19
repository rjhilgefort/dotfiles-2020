### OSX antigen file
source ~/.bin/antigen.zsh

### Load the oh-my-zsh's library.
antigen use oh-my-zsh

### Bundles
antigen bundle git
antigen bundle command-not-found
antigen bundle common-aliases
antigen bundle compleat
antigen bundle npm
antigen bundle vi-mode
antigen bundle git-extras
antigen bundle docker
antigen bundle skywind3000/z.lua # https://github.com/skywind3000/z.lua
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-history-substring-search
antigen bundle zdharma/history-search-multi-word
export NVM_LAZY_LOAD=true
export NVM_AUTO_USE=true
antigen bundle lukechilds/zsh-nvm
# antigen bundle lein
# antigen bundle web-search
# antigen bundle heroku
# antigen bundle pip
# antigen bundle brew
# antigen bundle git-flow
# antigen bundle osx

### Theme
# antigen theme robbyrussell
# antigen theme refined # NOTE: pure
antigen theme denysdovhan/spaceship-prompt # NOTE: A little slow to paint the git prompt

# Tell Antigen that you're done.
antigen apply

# Load broken out config files
[[ -s "$HOME/.zsh_env" ]] && source "$HOME/.zsh_env"
[[ -s "$HOME/.zsh_secrets" ]] && source "$HOME/.zsh_secrets"
[[ -s "$HOME/.zsh_functions" ]] && source "$HOME/.zsh_functions"
[[ -s "$HOME/.zsh_aliases" ]] && source "$HOME/.zsh_aliases"

# Run a command
neofetch
