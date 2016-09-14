pip2 install --user powerline-status
POWERLINE_LOC=$(python2 -c "import powerline, os.path; \\
                           print(os.path.dirname(powerline.__file__))")
ln -sn ${POWERLINE_LOC} ${PWD}/garden/.powerline

echo "Installing Powerline fonts"
wget https://github.com/Lokaltog/powerline/raw/develop/font/PowerlineSymbols.otf
wget https://github.com/Lokaltog/powerline/raw/develop/font/10-powerline-symbols.conf
sudo mv PowerlineSymbols.otf /usr/share/fonts/
sudo fc-cache -vf
sudo mv 10-powerline-symbols.conf /etc/fonts/conf.d/
