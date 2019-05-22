########################################
# OS 別の設定
case ${OSTYPE} in
    darwin*)
        #Mac用の設定
        export CLICOLOR=1
        alias ls='ls -G -F'
        ;;
    linux*)
        #Linux用の設定
        alias ls='ls -F --color=auto'
		alias pbcopy='xsel --clipboard --input'
        ;;
esac

########################################
# 環境別の設定　
if [ -f "$HOME/.zshrc.local" ]; then
    source "$HOME/.zshrc.local"
fi

########################################
# 環境変数
export LANG=ja_JP.UTF-8


# 色を使用出来るようにする
autoload -Uz colors
colors

# ヒストリの設定
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000


# 単語の区切り文字を指定する
autoload -Uz select-word-style
select-word-style default
# ここで指定した文字は単語区切りとみなされる
# / も区切りと扱うので、^W でディレクトリ１つ分を削除できる
zstyle ':zle:*' word-chars " /=;@:{},|"
zstyle ':zle:*' word-style unspecified

zstyle ':completion:*:processes' command 'ps x -o pid,s,args'


########################################
# プロンプトの表示設定
autoload -Uz vcs_info
autoload -Uz add-zsh-hook

zstyle ':vcs_info:*' formats '%F{green}(%s)-[%b]%f'
zstyle ':vcs_info:*' actionformats '%F{red}(%s)-[%b|%a]%f'

VIM_NORMAL="%K{208}%F{black}%k%f%K{208}%F{white} % NORMAL %k%f%K{black}%F{208}%k%f"
VIM_INSERT="%K{075}%F{black}%k%f%K{075}%F{white} % INSERT %k%f%K{black}%F{075}%k%f"
function zle-line-init zle-keymap-select {
    PROMPT="%{${fg[green]}%}[%n@%m]%{${reset_color}%} %~
${${KEYMAP/vicmd/$VIM_NORMAL}/(main|viins)/$VIM_INSERT}
%# "
    zle reset-prompt
}
zle -N zle-line-init
zle -N zle-keymap-select

function _update_vcs_info_msg() {
    LANG=en_US.UTF-8 vcs_info
    RPROMPT="${vcs_info_msg_0_}"
}
add-zsh-hook precmd _update_vcs_info_msg


########################################
# オプション
# 日本語ファイル名を表示可能にする
setopt print_eight_bit

# beep を無効にする
setopt no_beep

# フローコントロールを無効にする
setopt no_flow_control

# Ctrl+Dでzshを終了しない
setopt ignore_eof

# '#' 以降をコメントとして扱う
setopt interactive_comments

# ディレクトリ名だけでcdする
setopt auto_cd

# cd したら自動的にpushdする
setopt auto_pushd
# 重複したディレクトリを追加しない
setopt pushd_ignore_dups

# 同時に起動したzshの間でヒストリを共有する
setopt share_history

# 同じコマンドをヒストリに残さない
setopt hist_ignore_all_dups

# スペースから始まるコマンド行はヒストリに残さない
setopt hist_ignore_space

# ヒストリに保存するときに余分なスペースを削除する
setopt hist_reduce_blanks

# 高機能なワイルドカード展開を使用する
setopt extended_glob

########################################
# エイリアス

alias l='ls'
alias sl='ls'
alias la='ls -a'
alias ll='ls -la'

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

alias mkdir='mkdir -p'

# sudo の後のコマンドでエイリアスを有効にする
alias sudo='sudo '

# グローバルエイリアス
alias -g L='| less'
alias -g G='| grep'

# --------------------------------------------------
#  git エイリアス
# --------------------------------------------------

alias g="git"

alias gs='git status --short --branch'
alias ga='git add -A'
alias gc='git commit -m'
alias gps='git push'
alias gpsu='git push -u origin'
alias gp='git pull origin'
alias gf='git fetch'

# logを見やすく
alias gl='git log --abbrev-commit --no-merges --date=short --date=iso'
# grep
alias glg='git log --abbrev-commit --no-merges --date=short --date=iso --grep'
# ローカルコミットを表示
alias glc='git log --abbrev-commit --no-merges --date=short --date=iso origin/html..html'

alias gd='git diff'
alias gco='git checkout'
alias gcob='git checkout -b'
alias gb='git branch'

alias gm='git merge'
alias gr='git reset'


# --------------------------------------------------
# docker completion
# --------------------------------------------------
fpath=(~/.zsh/completion $fpath)
autoload -Uz compinit && compinit -i

# --------------------------------------------------
# docker エイリアス
# --------------------------------------------------

alias d="docker"

alias dps='docker ps -a'
alias drm='docker rm'
alias drmi='docker rmi'
alias ds='docker stop'
alias dki='docker run -it --name'
alias dkd='docker run -td --name'
alias dsa='docker stop $(docker ps -q)'
alias drma='docker rm $(docker ps -q -a)'
alias dec='docker exec -it'
alias dl='docker logs'
dbu() {docker build -t=$1 .;}

# -------------------------------------------------
# kubernetes エイリアス
# -------------------------------------------------

alias k='kubectl'
alias kdel='kubectl delete'
alias kget='kubectl get'
alias kdes='kubectl describe'
alias kc='kubectl create -f'
alias kl='kubectl logs'
alias ka='kubectl apply -f'
alias kec='kubectl exec -it'


# -------------------------------------------------
# kube-ps1
# -------------------------------------------------
if [ -e "/usr/local/opt/kube-ps1/share/kube-ps1.sh" ]; then
    source "/usr/local/opt/kube-ps1/share/kube-ps1.sh"
    PS1='$(kube_ps1)'$PS1

# デフォルトでは切るようにする
    kubeoff
fi

# -------------------------------------------------
# cargo
# -------------------------------------------------

if [ -e $HOME/.cargo/env ]; then
    source $HOME/.cargo/env
fi

# -------------------------------------------------
# tmux
# -------------------------------------------------

# 初回シェル起動時のみtmux起動
if [ $SHLVL = 1 ]; then
    tmux
fi


# -------------------------------------------------
# vim
# -------------------------------------------------
bindkey -v #vim mode
alias vi='vim'
alias vz='vim ~/.zshrc'
alias vv='vim ~/.vimrc'

# -------------------------------------------------
# emacs エイリアス
# -------------------------------------------------
alias emacs='vim'

# ls のディレクトリの色を変更
#export LSCOLORS='di=01;36'
export LSCOLORS=gxfxcxdxbxegedabagacad


# C で標準出力をクリップボードにコピーする
# mollifier delta blog : http://mollifier.hatenablog.com/entry/20100317/p1
if which pbcopy >/dev/null 2>&1 ; then
    # Mac
    alias -g C='| pbcopy'
elif which xsel >/dev/null 2>&1 ; then
    # Linux
    alias -g C='| xsel --input --clipboard'
elif which putclip >/dev/null 2>&1 ; then
    # Cygwin
    alias -g C='| putclip'
fi


# --------------------------------------------------
# go
# --------------------------------------------------

export PATH=$PATH:$GOPATH/bin

# --------------------------------------------------
# ros
# --------------------------------------------------
if [ -e /opt/ros/kinetic/setup.zsh ] && [ -e $HOME/catkin_ws/devel/setup.zsh ]; then
    source /opt/ros/kinetic/setup.zsh
    source $HOME/catkin_ws/devel/setup.zsh
fi

