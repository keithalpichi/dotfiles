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
export PATH="$PATH:$GOPATH/bin"

# Create functions to add/remove bookmarks of directories to quickly cd into (as documented at http://jeroenjanssens.com/2013/08/16/quickly-navigate-your-filesystem-from-the-command-line.html)
export MARKPATH=$HOME/.marks
# jump to symbolically linked directory under "marked" name
function jump {
	cd -P "$MARKPATH/$1" 2>/dev/null || echo "No such mark: $1"
}
# mark $1 arg as symbolic name to use for "jump"
function mark {
	mkdir -p "$MARKPATH"; ln -s "$(pwd)" "$MARKPATH/$1"
}
function unmark {
	rm -i "$MARKPATH/$1"
}
function marks {
	\ls -l "$MARKPATH" | tail -n +2 | sed 's/  / /g' | cut -d' ' -f9- | awk -F ' -> ' '{printf "%-10s -> %s\n", $1, $2}'
}
