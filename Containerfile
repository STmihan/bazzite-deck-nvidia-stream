FROM ghcr.io/ublue-os/bazzite-deck-nvidia:stable

RUN rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-terra43-extras && \
    rpm -e --nodeps --allmatches gamescope gamescope-libs && \
    dnf5 -y --refresh --enablerepo=terra-extras install \
        terra-gamescope \
        terra-gamescope-libs.x86_64 \
        terra-gamescope-libs.i686 && \
    rpm -q terra-gamescope terra-gamescope-libs && \
    dnf5 clean all && \
    ostree container commit
