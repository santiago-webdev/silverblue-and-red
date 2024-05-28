FROM quay.io/fedora/fedora-silverblue:40

RUN rpm-ostree install --idempotent \
        http://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-40.noarch.rpm \
        http://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-40.noarch.rpm

COPY files/vscode.repo /etc/yum.repos.d/vscode.repo
COPY files/docker-ce.repo /etc/yum.repos.d/docker-ce.repo
COPY files/ideapad /etc/sudoers.d/ideapad
COPY files/modules /etc/modules
COPY files/rpm-ostreed.conf /etc/rpm-ostreed.conf

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
        docker-ce \
        docker-ce-cli \
        containerd.io \
        docker-buildx-plugin \
        docker-compose-plugin \
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

RUN mkdir -p /etc/systemd/system/multi-user.target.wants
RUN ln -s /usr/lib/systemd/system/tuned.service /etc/systemd/system/multi-user.target.wants/tuned.service
RUN ln -s /usr/lib/systemd/system/docker.service /etc/systemd/system/multi-user.target.wants/docker.service
RUN ln -s /usr/lib/systemd/system/sshd.service /etc/systemd/system/multi-user.target.wants/sshd.service
RUN ln -s /usr/lib/systemd/system/rpm-ostreed-automatic.timer /etc/systemd/system/timers.target.wants/

RUN rm -rf /var/* ~/.*
RUN rpm-ostree cleanup -m

RUN ostree container commit
