for DOTFILE in `find /Users/bobby/.dotfiles/system`
do
  [ -f $DOTFILE ] && source $DOTFILE
done
