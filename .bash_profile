# Add Homebrew `/usr/local/bin` and User `~/bin` to the `$PATH`
export PATH=/usr/local/bin:$PATH
export PATH=$HOME/bin:$PATH

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{path,bash_prompt,exports,aliases,functions,extra}; do
  [ -r "$file" ] && [ -f "$file" ] && source "$file"
done
unset file

# Nvm
export NVM_DIR="$HOME/.nvm"
. "/usr/local/opt/nvm/nvm.sh"

# Postgres App
export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/latest/bin

# Setting PATH for Python 3.5
# The original version is saved in .bash_profile.pysave
export PATH="/Library/Frameworks/Python.framework/Versions/3.5/bin:${PATH}"

# RBenv
eval "$(rbenv init -)"

# Yarn
export PATH="$PATH:`yarn global bin`"

# Erlang
export PATH="$PATH:/usr/local/bin/erl"

# Elixir
export PATH="$PATH:/usr/local/bin/elixir"

# Go
export PATH="$PATH:/usr/local/go/bin"
export GOPATH="$HOME/Developer/go"
