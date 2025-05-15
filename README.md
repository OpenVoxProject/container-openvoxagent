# OpenVox Agent container

[![CI](https://github.com/openvoxproject/container-openvoxagent/actions/workflows/ci.yaml/badge.svg)](https://github.com/openvoxproject/container-openvoxagent/actions/workflows/ci.yaml)
[![License](https://img.shields.io/github/license/openvoxproject/container-openvoxagent.svg)](https://github.com/openvoxproject/container-openvoxagent/blob/main/LICENSE)
[![Sponsored by betadots GmbH](https://img.shields.io/badge/Sponsored%20by-betadots%20GmbH-blue.svg)](https://www.betadots.de)

---

- [OpenVox Agent container](#openvox-agent-container)
  - [Version schema](#version-schema)

---

This project hosts the Containerfile and the required scripts to build a OpenVox Agent container image.

⚠️ It is/can be used as an example/test agent (f.e. in CRAFTY).
It is ***not*** intended to be used in production or as a replacement for the OpenVox agent package.

For a compose file see: [CRAFTY](https://github.com/voxpupuli/crafty/tree/main/openvox/oss)

The entrypoint is the `openvox-agent` script which is a wrapper around the `openvox-agent` binary.

## Version schema

The version schema has the following layout:

```text
<openvox.major>.<openvox.minor>.<openvox.patch>-v<container.major>.<container.minor>.<container.patch>
```

Example usage:

```shell
podman pull ghcr.io/openvoxproject/openvoxagent:8.11.0-v1.2.3
```

| Name | Description |
| --- | --- |
| openvox.major | Describes the contained major OpenVox version (7 or 8) |
| openvox.minor | Describes the contained minor OpenVox version |
| openvox.patch | Describes the contained patchlevel OpenVox version |
| container.major | Describes the major version of the base container (Ubunutu 24.04) or incompatible changes |
| container.minor | Describes new features or refactoring with backward compatibility |
| container.patch | Describes if minor changes or bugfixes have been implemented |
