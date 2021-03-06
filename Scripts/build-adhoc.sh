#!/bin/sh
set -eu

XCODE_SCHEME=$APPNAME

####
# shenzhenでipaファイルが作成できなかったため、xcodebuildで対応
#bundle exec sudo chown :wheel /Library/Developer/CoreSimulator/Profiles/Runtimes/iOS\ *.simruntime/Contents/Resources/RuntimeRoot/usr/lib/dyld_sim
#bundle exec sudo ipa build \
#  --workspace "$XCODE_WORKSPACE" \
#  --scheme "$APPNAME" \
#  --configuration Release \
#  --destination Distribution/AdHoc \
#  --embed MobileProvisionings/${APPNAME}Adhoc.mobileprovision \
#  --identity "$DEVELOPER_NAME"

bundle exec xcodebuild -sdk iphoneos \
  -project $APPNAME.xcodeproj -target $APPNAME \
  -configuration Release build \
  CODE_SIGN_IDENTITY='$DEVELOPER_NAME' \
  PROVISIONING_PROFILE='$PROFILE_UUID'

bundle exec xcrun -sdk iphoneos PackageApplication \
  build/Release-iphoneos/$APPNAME.app \
  -o ${PWD}/build/Release-iphoneos/$APPNAME.ipa