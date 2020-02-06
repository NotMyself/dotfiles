# Add NVM
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

# Custom Functions
function ensure-1p {
  op list vaults > /dev/null 2>&1 || eval $(op signin auth0)
}

function code(){
    code-insiders $1
}

function chatty(){
    open /Applications/Chatty/Chatty.jar
}

# Aliases
alias notes="hads /Users/bobby/OneDrive/Notes -o"
alias site="ssh -i /Users/bobby/OneDrive/Security/louiebot.pem ubuntu@ec2-52-9-39-181.us-west-1.compute.amazonaws.com"

#Prompt
function powerline_precmd() {
    PS1="$(powerline-shell --shell zsh $?)"
}

function install_powerline_precmd() {
  for s in "${precmd_functions[@]}"; do
    if [ "$s" = "powerline_precmd" ]; then
      return
    fi
  done
  precmd_functions+=(powerline_precmd)
}

if [ "$TERM" != "linux" ]; then
    install_powerline_precmd
fi
