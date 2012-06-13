#!/bin/sh

cd Sparkle1.5b6
# Fix broken includes
cd Sparkle.framework/Headers/
ln -s ../Headers Sparkle



#xcodebuild -sdk macosx10.7 -project src/client/mac/Breakpad.xcodeproj -configuration Release -target All ARCHS=x86_64 ONLY_ACTIVE_ARCH=YES MACOSX_DEPLOYMENT_TARGET=10.6 GCC_VERSION=com.apple.compilers.llvmgcc42
#xcodebuild -sdk macosx10.7 -project src/client/mac/Breakpad.xcodeproj -configuration Debug -target All ARCHS=x86_64 ONLY_ACTIVE_ARCH=YES MACOSX_DEPLOYMENT_TARGET=10.6 GCC_VERSION=com.apple.compilers.llvmgcc42
