#!/usr/bin/env bash
set -euo pipefail

PROGDIR=$(cd "$(dirname "$0")" && pwd)

if [[ -z ${1:-} ]]; then
    echo "Usage: $0 <version>"
fi

VERSION=${1}
ID="pkg:generic/eclipse/eclipse.jdt.ls@v${VERSION}"
BASENAME=$(wget -q -O - "https://download.eclipse.org/jdtls/milestones/${VERSION}/latest.txt")
URL="https://download.eclipse.org/jdtls/milestones/${VERSION}/${BASENAME}"

PACKAGE_YAML=${PROGDIR}/packages/jdtls/package.yaml

# shellcheck disable=SC2016
yq --in-place --arg id "$ID" --arg url "$URL" -y '.
  | .source.id = $id
  | .source.download = (.source.download | map(.files["jdtls.tar.gz"] = $url))
' "${PACKAGE_YAML}"
