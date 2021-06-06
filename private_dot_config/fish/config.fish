# sudo bad
alias sudo="echo 'sudo? yeah no you have doas. SMH you need to change your muscle memory.' ; cp /dev/zero / 2> /dev/null && rm /zero && "
# ssh agent
if not pgrep -f ssh-agent > /dev/null
    eval (ssh-agent -c) > /dev/null
end

# set $EDITOR
export EDITOR="nvim"

# stop looking for packages k thx
function fish_command_not_found
    echo "fish: Unknown command: " $argv[1]
end

# gomi!!!
alias rm=gomi

# chezmoi easier™️
alias chz=chezmoi
alias che="chezmoi edit"
alias chd="chezmoi cd"
alias cha="chezmoi add"
alias chy="chezmoi apply -v"
alias chu="chezmoi update -v"

# exa!
alias ls=exa

# git easier™️
alias gitc="git commit -am"
alias gitp="git push"
alias gitr="git reset --hard HEAD"
alias gita="git add ."

# when the pipewire
alias help_mah_audio_broke="systemctl restart --user pipewire.service pipewire-media-session.service pipewire-pulse.service pipewire.socket pipewire-pulse.socket"

# my PATH!
export PATH="$PATH:/home/cain/.emacs.d/bin:/home/cain/.dotnet/tools"
