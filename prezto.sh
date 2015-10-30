ZPREZTO=${PWD}/garden/.zprezto
git clone --recursive -b pegged git@github.com:dbzm/prezto.git ${ZPREZTO}
ln -sf ${ZPREZTO} $HOME/
setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done
