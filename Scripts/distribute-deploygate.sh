#!/bin/sh
set -eu

bundle exec ipa distribute:deploygate \
  --file build/Release-iphoneos/${APPNAME}.ipa \
  --api_token $DEPLOYGATE_API_TOKEN \
  --message $RELEASE_NOTE \
  --visibility public \
  --user_name $DEPLOYGATE_USERNAME