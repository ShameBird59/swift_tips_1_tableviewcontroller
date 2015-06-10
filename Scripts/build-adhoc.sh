#!/bin/sh
set -eu

XCODE_SCHEME=$APPNAME

bundle exec sudo chown :wheel /Library/Developer/CoreSimulator/Profiles/Runtimes/iOS\ *.simruntime/Contents/Resources/RuntimeRoot/usr/lib/dyld_sim

bundle exec ipa build \
  --workspace "$XCODE_WORKSPACE" \
  --scheme "$APPNAME" \
  --configuration Release \
  --destination Distribution/AdHoc \
  --embed MobileProvisionings/${APPNAME}Adhoc.mobileprovision \
  --identity "$DEVELOPER_NAME"

