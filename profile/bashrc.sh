#env_java8() {
#export JAVA_HOME=/opt/java/jdk1.8.0_121
#export PATH=/usr/lib/jvm/java-8-openjdk-amd64/bin:$PATH
#export ANDROID_JAVA_HOME=/opt/java/jdk1.8.0_121
#}

export PATH=$PATH:~/Android/Sdk/build-tools/25.0.2/:/opt/emacs/bin
export LC_CTYPE=zh_CN.UTF-8
export LANG=en_US.UTF-8
export PS1='\[\e[31;47m\]\W $\[\e[0m\] '      # zsh 显示问题，放到 .bashrc 中
# export PROMPT_COMMAND=""
export TERM=xterm-256color

alias ..='cd ..'
alias ...='cd ../..'
alias cdl='cd `ls |peco`'
alias xemacs='emacsclient -c -a "" &'
alias ec='emacsclient -t -a ""'
alias ag='ag --color-line-number="35;1"'

# alias for git
alias gis='git status'
# alias gil="git branch |grep '^\*' |awk '{print \$NF}' |xargs -I {} git pull origin {}"
alias gip="git branch |grep '^\*' |awk '{print \$NF}' |xargs -I {} git push origin HEAD:refs/for/{}"
alias gia="git status |peco |awk '{print \$NF}' |xargs -I {} git add {}"
# alias gid="git status |percol |awk '{print \$NF}' |xargs -I {} git diff {}"

alias paf="awk '{print \$1}' |peco"
alias pzf="awk '{print \$NF}' |peco"
alias chop="sed 's/.$//'"

function lg {
sed -n "1p;/$1/p"
}

function pa {
if [[ $# == 1 ]]; then
    awk -v name=$1 '{print $name}'
else
    awk -v name=$1 ${@:2} '{print $name}'
fi;
};

# tmux
alias tml='tmux list-session'
alias tmd='tmux attach-session -t'
# screen
alias sc='screen'
alias scl='screen -ls'
alias scr='screen -r'
alias scd='screen -d'

# export USE_CCACHE=1
