PROMPT='%F{magenta}%B%n%b%f@%F{blue}%U%m%u%f %F{green}[%~]%f %# '
# 色を使用出来るようにする
autoload -Uz colors
colors

# タブ補完時に大文字小文字を区別しない
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# 日本語ファイル名を表示可能にする
setopt print_eight_bit

# pecoの設定(cortrol+rで呼び出し)
# ヒストリの設定
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000

function peco-history-selection() {
    BUFFER=`history -n 1 | tail -r  | awk '!a[$0]++' | peco`
    CURSOR=$#BUFFER
    zle reset-prompt
}

zle -N peco-history-selection
bindkey '^R' peco-history-selection

# 使用する JDK
jdk() {
    version=$1
    export JAVA_HOME=$(/usr/libexec/java_home -v"$version");
    java -version
}

# nodebrew
export PATH=/Users/sakai/.nodebrew/current/bin:$PATH

# maven
export PATH=/usr/local/Cellar/maven/3.6.3_1/libexec:$PATH
