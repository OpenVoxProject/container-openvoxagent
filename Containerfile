FROM ubuntu:24.04

ARG OPENVOX_RELEASE=8
ARG OPENVOX_USER_UID=999
ARG OPENVOX_USER_GID=999
ARG UBUNTU_VERSION=24.04
ARG OPENVOXAGENT_VERSION=8.11.0-1+ubuntu${UBUNTU_VERSION}
ARG OPENVOX_RELEASE_PACKAGE=openvox${OPENVOX_RELEASE}-release-ubuntu${UBUNTU_VERSION}.deb

ADD https://apt.overlookinfratech.com/${OPENVOX_RELEASE_PACKAGE} /
RUN apt-get update && \
    apt-get install -y ca-certificates /${OPENVOX_RELEASE_PACKAGE} && \
    rm /${OPENVOX_RELEASE_PACKAGE}

RUN groupadd -g ${OPENVOX_USER_GID} puppet && \
    useradd -m -u ${OPENVOX_USER_UID} -g puppet puppet && \
    apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y openvox-agent=${OPENVOXAGENT_VERSION} && \
    apt-get autoremove -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

COPY Containerfile /

WORKDIR /data

ENTRYPOINT [ "/opt/puppetlabs/bin/puppet" ]
CMD [ "agent", "-h" ]
