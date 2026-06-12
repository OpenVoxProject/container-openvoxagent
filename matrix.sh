#!/bin/bash

yq -o=json build_platforms.yaml > build_platforms.json
yq -o=json build_versions.yaml > build_versions.json

if [ "$1" == "build" ]; then
  jq -rc --slurp '{ include: [ .[1].include[] as $i | .[0].platforms[] as $p | $i + {"agent_semver": ($i.agent_version | split("-")[0]), "platform": $p.platform, "runner": $p.runner} ] }' build_platforms.json build_versions.json
fi

if [ "$1" == "tag" ]; then
  jq -cr '.include |= map({ release: .release, agent_version: .agent_version, agent_semver: (.agent_version | split("-")[0]) })' build_versions.json
fi

rm build_platforms.json
rm build_versions.json
