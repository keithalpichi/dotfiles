# Nothing to see here — Everything's in .bash_profile
[ -n "$PS1" ] && source ~/.bash_profile
export NVM_DIR="/Users/keithalpichi/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

export PATH="$HOME/.yarn/bin:$PATH"

# added by travis gem
[ -f /Users/keithalpichi/.travis/travis.sh ] && source /Users/keithalpichi/.travis/travis.sh

