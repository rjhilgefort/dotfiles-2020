# V4 Updates
# https://spaceship-prompt.sh/blog/2022-spaceship-v4/#breaking-changes

# Display time
SPACESHIP_TIME_SHOW=true

# Display username always
SPACESHIP_USER_SHOW=always

# Do not truncate path in repos
SPACESHIP_DIR_TRUNC_REPO=false

# See: https://github.com/spaceship-prompt/spaceship-vi-mode
# spaceship add --before char vi_mode

spaceship_gitwhoami() {
  spaceship::section "" "" $(git-whoami) ""
}
SPACESHIP_CHAR_SYMBOL="λ "
SPACESHIP_PROMPT_ORDER=(
  time          # Time stamps section
  # user          # Username section
  dir           # Current directory section
  host          # Hostname section
  git           # Git section (git_branch + git_status)
  # hg            # Mercurial section (hg_branch  + hg_status)
  package       # Package version
  # gradle        # Gradle section
  # maven         # Maven section
  # node          # Node.js section
  ruby          # Ruby section
  elixir        # Elixir section
  # xcode         # Xcode section
  # swift         # Swift section
  golang        # Go section
  php           # PHP section
  rust          # Rust section
  haskell       # Haskell Stack section
  # julia         # Julia section
  docker        # Docker section
  # aws           # Amazon Web Services section
  # gcloud        # Google Cloud Platform section
  # venv          # virtualenv section
  # conda         # conda virtualenv section
  python         # Pyenv section
  # dotnet        # .NET section
  # ember         # Ember.js section
  kubectl       # Kubectl context section
  terraform     # Terraform workspace section
  # ibmcloud      # IBM Cloud section
  gitwhoami     # Shows current git user
  exec_time     # Execution time
  line_sep      # Line break
  battery       # Battery level and status
  vi_mode       # Vi-mode indicator
  jobs          # Background jobs indicator
  exit_code     # Exit code section
  char          # Prompt character
)