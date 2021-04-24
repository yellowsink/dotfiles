# sudo bad
alias sudo="echo 'sudo? yeah no you have doas. SMH you need to change your muscle memory.' ; cp /dev/zero / 2> /dev/null && rm /zero && "
# ssh agent
if not pgrep -f ssh-agent > /dev/null
    eval (ssh-agent -c) > /dev/null
end
# set $EDITOR to micro
export EDITOR="micro"