# syntax=docker/dockerfile:1.4-labs
from debian:stable

run apt update

# arm related
run <<EOF
apt install -y gcc-arm-linux-gnueabi qemu qemu-user qemu-system-arm make
ln -s /usr/arm-linux-gnueabi/lib/ld-linux.so.3 /lib/
EOF

# config zsh
run <<EOF
apt install -y zsh git curl
chsh -s /bin/zsh
mkdir -p /usr/share/zsh/plugins/fast-syntax-highlighting
git clone https://github.com/zdharma-continuum/fast-syntax-highlighting /usr/share/zsh/plugins/fast-syntax-highlighting
mkdir -p /root/.cache/zsh
EOF
copy ./zshrc /root/.zshrc

# config vim
run <<EOF
apt install -y vim
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
EOF
copy ./vimrc /root/.vimrc
run vim +PlugInstall +qall

# config tmux
run apt install -y tmux
copy ./tmux.conf /root/.tmux.conf

workdir /root

env TERM="xterm-256color"

cmd ["zsh"]
