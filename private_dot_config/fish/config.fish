# sudo bad
alias sudo="echo 'sudo? yeah no you have doas. SMH you need to change your muscle memory.' ; cp /dev/zero / 2> /dev/null && rm /zero && "
# ssh agent
if not pgrep -f ssh-agent > /dev/null
    eval (ssh-agent -c) > /dev/null
end
# set $EDITOR to micro
export EDITOR="micro"

# stop looking for packages k thx
function fish_command_not_found
    echo "fish: Unknown command: " $argv[1]
end

# gomi!!!
alias rm=gomi