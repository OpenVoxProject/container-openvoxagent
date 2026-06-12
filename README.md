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

Images are published to `ghcr.io/openvoxproject/openvoxagent` and
`docker.io/voxpupuli/openvoxagent`.

| Tag | Example | Description |
| --- | --- | --- |
| `<openvox.version>-v<container.version>` | `8.28.0-v1.2.3` | Immutable container release |
| `<openvox.version>` | `8.28.0` | Latest build for an OpenVox Agent version |
| `<openvox.major>` | `8` | Latest build for an OpenVox major version |
| `latest` | `latest` | Latest build from the `main` branch |

Builds from the `main` branch are additionally tagged as
`<openvox.version>-main`.

Example using an immutable container release:

```shell
podman pull ghcr.io/openvoxproject/openvoxagent:8.28.0-v1.2.3
```

The OpenVox version describes the agent version contained in the image. The
container version follows semantic versioning and describes changes to the
container image independently of the OpenVox version.
