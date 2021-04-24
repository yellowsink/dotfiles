# sudo bad
alias sudo="echo 'sudo? yeah no you have doas. SMH you need to change your muscle memory.' ; cp /dev/zero / 2> /dev/null && rm /zero && "
# ssh agent
echo "Starting ssh-agent..." ; eval (ssh-agent -c)
# set $EDITOR to micro
export EDITOR="micro"