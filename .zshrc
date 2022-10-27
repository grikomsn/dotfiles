# https://github.com/ohmyzsh/ohmyzsh/blob/master/templates/zshrc.zsh-template

# Local brew prefix check, see https://dotfiles.griko.id/check-arch.sh
ARCH_NAME="$(uname -m)"
if [ "${ARCH_NAME}" = "x86_64" ]; then
  BREW_PREFIX="/usr/local"
elif [ "${ARCH_NAME}" = "arm64" ]; then
  BREW_PREFIX="/opt/homebrew"
fi

# Temporary overrides
export _PIP_LOCATIONS_NO_WARN_ON_MISMATCH=1
export NODE_EXTRA_CA_CERTS="$(mkcert -CAROOT)/rootCA.pem"

# Register custom paths
export PATH=/usr/local/bin:/usr/local/sbin:$PATH

export DENO_INSTALL=$HOME/.deno
export PATH=$DENO_INSTALL/bin:$PATH

export GOPATH=$HOME/.go
export PATH=$GOPATH/bin:$PATH

export OPENJDK_INSTALL=$BREW_PREFIX/opt/openjdk
export PATH=$OPENJDK_INSTALL/bin:$PATH

export PNPM_HOME=$HOME/Library/pnpm
export PATH=$PNPM_HOME:$PATH

export RUST_INSTALL=$HOME/.cargo
export PATH=$RUST_INSTALL/bin:$PATH

export PATH=$HOME/.fnm:$PATH
export PATH=$HOME/.local/bin:$PATH
export PATH=$HOME/.yarn/bin:$PATH

export PATH=$BREW_PREFIX/opt/curl/bin:$PATH
export PATH=$BREW_PREFIX/opt/openjdk/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
zstyle ':omz:update' mode disabled # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(brew common-aliases docker git last-working-dir pip rust sudo virtualenv zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8
export LC_ALL='en_US.UTF-8'

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Custom aliases
alias git="hub"
alias vim="nvim"

# Integration for fnm
eval "$(fnm env --use-on-cd --shell zsh)"

# Integration and overrides for fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'

# Integration for pnpm
[[ -f ~/.config/tabtab/zsh/__tabtab.zsh ]] && . ~/.config/tabtab/zsh/__tabtab.zsh || true

# Custom function to run all update/upgrade commands
brew-everything() {
  deno upgrade
  fnm install --lts &&
    fnm install 16 &&
    fnm alias 16 default
  pip3 install --upgrade pip &&
    pip3 install neovim virtualenv watchdog
  rustup upgrade
  brew update -vvv
  brew upgrade -vvv
  brew cleanup -vvv
  brew doctor -vvv
  brew autoremove -vvv
  omz update -vvv
}

# Custom function to create a data url from a file
dataurl() {
  local mimeType=$(file -b --mime-type "$1")
  if [[ $mimeType == text/* ]]; then
    mimeType="${mimeType};charset=utf-8"
  fi
  echo "data:${mimeType};base64,$(openssl base64 -in "$1" | tr -d '\n')"
}

# Custom function to list dangling commits
git-save-me() {
  git log --graph --oneline --decorate $(git fsck --no-reflog | awk '/dangling commit/ {print $3}')
}

# Custom function to remove duplicate "Open with" entries
dedupe-open-with-entries() {
  /System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user
}

# Custom function to reinstall yarn global packages
node-update-globals() {
  # npm -g i npm corepack
  corepack enable pnpm
  corepack enable yarn
  corepack prepare --activate pnpm@latest
  corepack prepare --activate yarn@1.22.19
  local NODE_GLOBAL_PACKAGES=(
    @cloudflare/wrangler
    @vercel/ncc
    graphql
    graphql-language-service-cli
    neovim
    node-jose-tools
    quicktype
    prettier
    serve
    speed-test
    typescript
    vercel
  )
  pnpm --global add $NODE_GLOBAL_PACKAGES
}
