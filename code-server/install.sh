#!/bin/bash

ARCH=$(dpkg --print-architecture)

sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)" 
chsh -s $(which zsh)
export SHELL=$(which zsh)
echo "current shell: $SHELL\n"
ls -la

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/plugins/zsh-syntax-highlighting
echo "source ~/.oh-my-zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ~/.zshrc

git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/plugins/zsh-autosuggestions
echo "source ~/.oh-my-zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh" >> ~/.zshrc

# golang
curl -o /tmp/go-linux.tar.gz -L "https://go.dev/dl/go1.24.3.linux-${ARCH}.tar.gz"
tar zxf /tmp/go-linux.tar.gz -C /usr/local/
export PATH=$PATH:/usr/local/go/bin
go version

echo 'alias ll="ls -lah"' >> ~/.zshrc
echo 'alias vi="vim"' >> ~/.zshrc
echo 'alias gs="git status"' >> ~/.zshrc
echo 'alias gc="git commit -m"' >> ~/.zshrc
echo 'alias guc="git commit -am"' >> ~/.zshrc
echo 'export LANG=zh_CN.UTF-8' >> ~/.zshrc
echo 'export LANGUAGE=zh_CN.UTF-8' >> ~/.zshrc
echo 'export SHELL=/bin/zsh' >>~/.zshrc
echo 'DRACULA_DISPLAY_CONTEXT=1' >> ~/.zshrc
echo 'DRACULA_DISPLAY_FULL_CWD=1' >> ~/.zshrc
echo 'DRACULA_DISPLAY_GIT=1' >> ~/.zshrc
echo 'export GOPATH=~/.local/share/go' >> ~/.zshrc
echo 'export DENO_DEPLOY_TOKEN=""' >>~/.zshrc
echo 'export PATH=/usr/local/go/bin:$PATH' >> ~/.zshrc
echo 'export PATH=/root/.deno/bin:$PATH' >> ~/.zshrc

curl https://rclone.org/install.sh | zsh

curl -fsSL https://deno.land/install.sh | zsh
export PATH="/root/.deno/bin:$PATH"
deno --version
deno install -gArf jsr:@deno/deployctl
deployctl --version

curl -fsSL https://get.pnpm.io/install.sh | zsh -
export PNPM_HOME="/root/.local/share/pnpm" 
export PATH="$PNPM_HOME:$PATH"
pnpm env use 20 --global
pnpm add -g wrangler@latest
pnpm add -g eslint

git config --global user.name "henry0731"
git config --global user.email "henry0731@cmail.uso.edu.kg"
git config --global pull.rebase false
git config --global credential.helper "store --file=~/.git/.git-credentials"

cat >~/.vimrc<<EOF
syntax on
set encoding=utf-8
set smartindent
set wrap
set ruler
EOF

cat>~/.local/share/code-server/User/argv.json<<EOF
{ "locale":"zh-CN" }
EOF

cat>~/.local/share/code-server/User/setting.json<<EOF
{
    "terminal.integrated.fontSize": 18,
    "workbench.startupEditor": "none",
    "editor.fontFamily": "JetBrains Mono, Menlo, Monaco, Courier New, monospace",
    "editor.fontWeight": "normal",
    "editor.fontSize": 22,
    "editor.lineHeight": 1.5,
    "editor.letterSpacing": 0,
    "editor.wordWrap": "on",
    "debug.console.fontSize": 13,
    "window.commandCenter": false,
    "workbench.preferredDarkColorTheme": "Dracula Theme",
    "workbench.preferredLightColorTheme": "Dracula Theme",
    "workbench.iconTheme": "material-icon-theme",
    "window.autoDetectColorScheme": true,
    "workbench.layoutControl.enabled": false,
    "editor.minimap.enabled": false,
    "editor.pasteAs.enabled": false,
    "editor.formatOnSave": true,
    "eslint.enable": true,
    "editor.codeActionsOnSave": {
        "source.fixAll.eslint": true
    },
    "[sh]": {
        "editor.defaultFormatter": "esbenp.prettier-vscode"
    },
    "[shellscript]": {
        "editor.defaultFormatter": "esbenp.prettier-vscode"
    },
    "[javascript]": {
        "editor.defaultFormatter": "esbenp.prettier-vscode"
    },
    "[css]": {
        "editor.defaultFormatter": "esbenp.prettier-vscode"
    },
    "[html]": {
        "editor.defaultFormatter": "esbenp.prettier-vscode"
    },
    "[typescript]": {
        "editor.defaultFormatter": "esbenp.prettier-vscode"
    },
    "[jsonc]": {
        "editor.defaultFormatter": "esbenp.prettier-vscode"
    },
    "[json]": {
        "editor.defaultFormatter": "esbenp.prettier-vscode"
    },
    "[python]": {
        "editor.defaultFormatter": "ms-python.black-formatter"
    },

    "prettier.printWidth": 120,
    "prettier.tabWidth": 4,
    "prettier.semi": false,
    "prettier.singleQuote": true,
    "prettier.bracketSpacing": true,
    "prettier.endOfLine": "auto"
}
EOF

mkdir -p /workspace/.vscode/

cd /workspace
python3 -m venv .venv
# . .venv/bin/activate
# pip install playwright sanic requests aioredis aiohttp pysocks python-dotenv 
# playwright install chrome

apt-get purge make gcc g++ -y
apt-get autoremove -y
apt-get clean
rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*