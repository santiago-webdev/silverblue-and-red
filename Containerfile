FROM quay.io/fedora/fedora-silverblue:40

RUN rpm-ostree install --idempotent \
        http://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-40.noarch.rpm \
        http://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-40.noarch.rpm

RUN rm -rf /var/* ~/.*
RUN rpm-ostree cleanup -m

RUN ostree container commit
