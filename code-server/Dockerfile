FROM henry0731/debian

# COPY code-server/docker-entrypoint.sh entrypoint.sh
COPY code-server/install.sh /tmp/install.sh

RUN apt-get update && apt-get install --no-install-recommends ca-certificates openssh-client procps zsh git unzip vim wget curl net-tools iputils-ping neofetch python3 python3.11-venv -y

RUN curl -fsSL https://code-server.dev/install.sh | sh \
    && code-server --install-extension ms-python.black-formatter \
    && code-server --install-extension dbaeumer.vscode-eslint \
    && code-server --install-extension esbenp.prettier-vscode \
    && code-server --install-extension tencent-cloud.coding-copilot \
    && code-server --install-extension dracula-theme.theme-dracula \
    && code-server --install-extension ms-python.python \
    && code-server --install-extension vue.volar \
    && code-server --install-extension pkief.material-icon-theme \
    && code-server --install-extension dbaeumer.vscode-eslint \
    && code-server --install-extension ms-ceintl.vscode-language-pack-zh-hans \
    && echo done

RUN chmod +x /tmp/install.sh && /bin/bash -c '/tmp/install.sh'

ENV PORT=9091
ENV PASSWORD=code001

# ENTRYPOINT ["entrypoint.sh"]

CMD code-server --bind-addr 0.0.0.0:"${PORT}" --app-name code-server --disable-telemetry --auth "${PASSWORD}" ~/workspace