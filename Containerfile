FROM quay.io/fedora/fedora-silverblue:40

RUN rpm-ostree install --idempotent \
        http://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-40.noarch.rpm \
        http://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-40.noarch.rpm

COPY files/vscode.repo /etc/yum.repos.d/vscode.repo
COPY files/docker.repo /etc/yum.repos.d/docker.repo
COPY files/ideapad /etc/sudoers.d/ideapad
COPY files/modules /etc/modules

RUN rpm-ostree uninstall --idempotent \
        default-editor \
        gnome-initial-setup \
        gnome-tour \
        nano-default-editor \
        power-profiles-daemon \
        yelp \
        ffmpeg-free \
        libavcodec-free \
        libavdevice-free \
        libavfilter-free \
        libavformat-free \
        libavutil-free \
        libpostproc-free \
        libswresample-free \
        libswscale-free

RUN rpm-ostree install --idempotent \
        code \
        distrobox \
        dkms \
        efibootmgr \
        ffmpeg \
        ffmpegthumbs \
        flatpak-xdg-utils \
        intel-media-driver \
        just \
        libnotify \
        libportal \
        openssl \
        openssl-devel \
        pkg-config \
        gnome-browser-connector \
        gnome-tweaks \
        slirp4netns \
        stow \
        tuned \
        tuned-ppd \
        tuned-utils \
        wl-clipboard \
        xdg-desktop-portal \
        xdg-desktop-portal-gnome \
        xdg-user-dirs

RUN systemd enable \
        docker \
        sshd \
        tuned

RUN rm -rf /var/* ~/.*
RUN rpm-ostree cleanup -m

RUN ostree container commit
