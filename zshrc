# ALIAS STUFF
# fs
alias ls='ls -G'
alias mos='cd ~/repos/mid_office_system'
alias ins='cd ~/repos/insight'

# git
alias gap='git add --patch'
alias g='git'

# rake
alias clean='rake clobber && git clean -fd'
alias mt='rake db:migrate RAILS_ENV=test'
alias pp='rake parallel:prepare && rake parallel'

# PATH STUFF
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
export PATH="$HOME/.bin:$PATH"
export PATH="$PATH:/usr/local/lib/node_modules"
eval "$(rbenv init - zsh --no-rehash)"

# AUTO COMPLETE
autoload -U compinit && compinit

# GIT STUFF
git-delete-merged() {
  git branch --merged | grep -v "\*" | xargs -n 1 git branch -d
}

# PROMPT STUFF
setopt prompt_subst
autoload -Uz vcs_info
zstyle ':vcs_info:*' actionformats \
    '%F{5}%F{3}%F{5}[%F{2}%b%F{3}|%F{1}%a%F{5}]%f'
zstyle ':vcs_info:*' formats       \
    '%F{5}%F{3}%F{5}[%F{2}%b%F{5}]%f'
zstyle ':vcs_info:(sv[nk]|bzr):*' branchformat '%b%F{1}:%F{3}%r'

zstyle ':vcs_info:*' enable git cvs svn

# or use pre_cmd, see man zshcontrib
vcs_info_wrapper() {
  vcs_info
  if [ -n "$vcs_info_msg_0_" ]; then
    echo "%{$fg[grey]%}${vcs_info_msg_0_}%{$reset_color%}$del"
  fi
}
PROMPT=$'%~$(vcs_info_wrapper):'
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
