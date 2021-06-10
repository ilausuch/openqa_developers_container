FROM opensuse/tumbleweed

RUN zypper in -y openQA-devel os-autoinst-distri-opensuse-deps make
RUN zypper in -y tmux

RUN useradd -m openqa

COPY entrypoint.sh /
COPY launch*.sh /home/openqa
RUN chmod a+x /entrypoint.sh
RUN chmod a+x /home/openqa/*.sh

ENTRYPOINT [ "su", "openqa", "/entrypoint.sh" ]
