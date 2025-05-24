FROM henry0731/debian

COPY code-server/docker-entrypoint.sh entrypoint.sh
COPY code-server/install.sh /tmp/install.sh

RUN apt-get update && apt-get install --no-install-recommends ca-certificates openssh-client procps zsh git unzip vim wget curl net-tools iputils-ping neofetch python3 python3.11-venv -y

RUN curl -fsSL https://code-server.dev/install.sh | sh -s -- --dry-run \
    && code-server --install-extension redhat.vscode-yaml \
    && code-server --install-extension dbaeumer.vscode-eslint \
    && code-server --install-extension waderyan.gitblame \
    && code-server --install-extension mhutchie.git-graph \
    && code-server --install-extension donjayamanne.githistory \
    && code-server --install-extension dracula-theme.theme-dracula \
    && code-server --install-extension ms-python.python \
    && code-server --install-extension vue.volar \
    && code-server --install-extension ms-ceintl.vscode-language-pack-zh-hans \
    && echo done

RUN chmod +x /tmp/install.sh && chmod +x entrypoint.sh && /bin/bash -c '/tmp/install.sh'

ENV PORT=9091
ENV AUTH=code001

ENTRYPOINT ["entrypoint.sh"]

CMD code-server --bind-addr 0.0.0.0:"${PORT}" --app-name code-server --disable-telemetry --auth "${AUTH}" ~/code-server