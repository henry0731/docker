#!/bin/bash

arch() {
  uname_m=$(uname -m)
  case $uname_m in
    aarch64) echo arm64 ;;
    x86_64) echo amd64 ;;
    *) echo "$uname_m" ;;
  esac
}

sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)" 
chsh -s $(which zsh)
export SHELL=$(which zsh)
echo "current shell: $SHELL\n"
ls -la

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/plugins/zsh-syntax-highlighting
echo "source ~/.oh-my-zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ~/.zshrc

git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/plugins/zsh-autosuggestions
echo "source ~/.oh-my-zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh" >> ~/.zshrc

echo 'alias ll="ls -la"' >> ~/.zshrc
echo 'alias vi="vim"' >> ~/.zshrc
echo 'export LANG=zh_CN.UTF-8' >> ~/.zshrc
echo 'export LANGUAGE=zh_CN.UTF-8' >> ~/.zshrc
echo 'export SHELL=/bin/zsh' >>~/.zshrc
echo 'DRACULA_DISPLAY_CONTEXT=1' >> ~/.zshrc
echo 'DRACULA_DISPLAY_FULL_CWD=1' >> ~/.zshrc
echo 'DRACULA_DISPLAY_GIT=1' >> ~/.zshrc
echo 'export DENO_DEPLOY_TOKEN=""' >>~/.zshrc
echo 'cd /data/code-server/workspace' >> ~/.zshrc

curl -fsSL https://deno.land/install.sh | zsh
export PATH="/root/.deno/bin:$PATH"
deno --version
deno install -gArf jsr:@deno/deployctl
deployctl --version

curl -fsSL https://get.pnpm.io/install.sh | zsh -
export PNPM_HOME="/root/.local/share/pnpm" 
export PATH="$PNPM_HOME:$PATH"
pnpm add -g wrangler
pnpm env use 20 --global

cd ~ && python3 -m venv .venv

git config --global user.name "henry0731"
git config --global user.email "henry0731@cmail.uso.edu.kg"
git config --global pull.rebase false

cat >~/.vimrc<<EOF
syntax on
set encoding=utf-8
set smartindent
set wrap
set ruler
EOF

mkdir -p ~/code-server

apt-get purge make gcc g++ -y
apt-get autoremove -y
apt-get clean
rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*