export EDITOR=nvim

source ~/.zplug/init.zsh

zplug 'zplug/zplug', hook-build:'zplug --self-manage'

# Make sure to use double quotes
zplug "zsh-users/zsh-history-substring-search"

# Use the package as a command
# And accept glob patterns (e.g., brace, wildcard, ...)
zplug "Jxck/dotfiles", as:command, use:"bin/{histuniq,color}"

# Can manage everything e.g., other person's zshrc
zplug "tcnksm/docker-alias", use:zshrc

# Disable updates using the "frozen" tag
zplug "k4rthik/git-cal", as:command, frozen:1

# Grab binaries from GitHub Releases
# and rename with the "rename-to:" tag

# Supports oh-my-zsh plugins and the like
zplug "plugins/git",   from:oh-my-zsh

# Also prezto
#zplug "modules/prompt", from:prezto

# Run a command after a plugin is installed/updated
# Provided, it requires to set the variable like the following:
# ZPLUG_SUDO_PASSWORD="********"
zplug "jhawthorn/fzy", \
    as:command, \
    rename-to:fzy, \
    hook-build:"make && sudo make install"

# Supports checking out a specific branch/tag/commit
zplug "b4b4r07/enhancd", at:v1
zplug "mollifier/anyframe", at:4c23cb60

# Can manage gist file just like other packages
zplug "b4b4r07/79ee61f7c140c63d2786", \
    from:gist, \
    as:command, \
    use:get_last_pane_path.sh

# Support bitbucket
zplug "b4b4r07/hello_bitbucket", \
    from:bitbucket, \
    as:command, \
    use:"*.sh"

# Rename a command with the string captured with `use` tag
zplug "b4b4r07/httpstat", \
    as:command, \
    use:'(*).sh', \
    rename-to:'$1'

# Note: To specify the order in which packages should be loaded, use the defer
#       tag described in the next section

# Set the priority when loading
# e.g., zsh-syntax-highlighting must be loaded
# after executing compinit command and sourcing other plugins
# (If the defer tag is given 2 or above, run after compinit command)
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "zsh-users/zsh-completions", defer:2
zplug "zsh-users/zsh-autosuggestions", defer:2

# Can manage local plugins
zplug "~/.zsh", from:local

# Load theme file
# zplug romkatv/powerlevel10k, as:theme, depth:1

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
zplug load

alias vim="nvim"
alias ls="eza --icons always"

# Start TMUX first; try to reattach a session
if [[ -z $TMUX ]]; then
  ATTACH_OPT=$(tmux ls | grep -vq attached && echo "attach -d")
  exec eval "tmux $ATTACH_OPT"
fi

GPG_TTY=$(tty)
export GPG_TTY

export CLICOLOR=1
export LS_COLORS="$(vivid generate catppuccin-mocha)"
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' completer _extensions _complete _approximate
zstyle ':completion:*' menu select

autoload -U compinit; compinit

export PATH="${HOME}/.cargo/bin":$PATH
export PATH="${HOME}/go/bin":$PATH

export FLYCTL_INSTALL="/home/sammyshear/.fly"
export PATH="$FLYCTL_INSTALL/bin:$PATH"

# fnm
FNM_PATH="/home/sammyshear/.local/share/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="/home/sammyshear/.local/share/fnm:$PATH"
  eval "`fnm env`"
fi

# bun completions
[ -s "/home/sammyshear/.bun/_bun" ] && source "/home/sammyshear/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
export PATH="$HOME/.luarocks/bin/:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/momw-tools-pack-linux/:$PATH"


# go speechsdk
#export SPEECHSDK_ROOT="$HOME/speechsdk"
#export CGO_CFLAGS="-I$SPEECHSDK_ROOT/include/c_api"
#export CGO_LDFLAGS="-L$SPEECHSDK_ROOT/lib/x64 -lMicrosoft.CognitiveServices.Speech.core"
#export LD_LIBRARY_PATH="$SPEECHSDK_ROOT/lib/x64:$LD_LIBRARY_PATH"

# pnpm
export PNPM_HOME="/home/sammyshear/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/sammyshear/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/sammyshear/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/sammyshear/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/sammyshear/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# fnm
FNM_PATH="/home/sammyshear/.local/share/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="/home/sammyshear/.local/share/fnm:$PATH"
  eval "`fnm env`"
fi

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/sammyshear/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/home/sammyshear/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/sammyshear/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/sammyshear/Downloads/google-cloud-sdk/completion.zsh.inc'; fi

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt SHARE_HISTORY

eval "$(starship init zsh)"
eval "$(zoxide init zsh)"
eval "$(pyenv init - zsh)"
alias cd="z"
alias cdi="zi"
nerdfetch

