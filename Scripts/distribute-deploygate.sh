#!/bin/sh
set -eu

#--file Distribution/AdHoc/${APPNAME}.ipa

bundle exec ipa distribute:deploygate \
  --source-dir ./build/Release-iphoneos \
  --file ${APPNAME}.ipa \
  --api_token $DEPLOYGATE_API_TOKEN \
  --distribution_key $DEPLOYGATE_DISTRIBUTION_KEY \
  --release_note $RELEASE_NOTE \
  --visibility public \
  --user_name $DEPLOYGATE_USERNAME
