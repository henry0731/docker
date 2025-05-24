FROM henry0731/debian

COPY code-server/docker-entrypoint.sh /usr/bin/entrypoint.sh
COPY code-server/install.sh /tmp/install.sh

RUN apt-get update && apt-get install --no-install-recommends ca-certificates openssh-client procps zsh git unzip vim wget curl net-tools iputils-ping neofetch python3 python3.11-venv -y

RUN curl -fsSL https://code-server.dev/install.sh | sh -s -- --dry-run \
    && /usr/bin/code-server --install-extension redhat.vscode-yaml \
    && /usr/bin/code-server --install-extension dbaeumer.vscode-eslint \
    && /usr/bin/code-server --install-extension waderyan.gitblame \
    && /usr/bin/code-server --install-extension mhutchie.git-graph \
    && /usr/bin/code-server --install-extension donjayamanne.githistory \
    && /usr/bin/code-server --install-extension dracula-theme.theme-dracula \
    && /usr/bin/code-server --install-extension ms-python.python \
    && /usr/bin/code-server --install-extension vue.volar \
    && /usr/bin/code-server --install-extension ms-ceintl.vscode-language-pack-zh-hans \
    && echo done

RUN chmod +x /tmp/install.sh && chmod +x /usr/bin/entrypoint.sh && /bin/bash -c '/tmp/install.sh'

ENV PORT=9091
ENV AUTH=code001

ENTRYPOINT ["/usr/bin/entrypoint.sh"]

CMD /usr/bin/code-server --bind-addr 0.0.0.0:"${PORT}" --app-name code-server --disable-telemetry --auth "${AUTH}" ~/code-server