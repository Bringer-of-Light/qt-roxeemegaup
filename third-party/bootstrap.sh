#!/bin/sh

SRC_DIR=andymatuschak-Sparkle-9eb4368
BUILD_DIR=Sparkle1.5b6

download(){
    curl https://nodeload.github.com/andymatuschak/Sparkle/tarball/sparkle-1.5b6 > temp.tar.gz
    tar -xzf temp.tar.gz
    rm temp.tar.gz
}

build(){
    cd ${SRC_DIR}
    xcodebuild GCC_TREAT_WARNINGS_AS_ERRORS=NO -sdk macosx10.7 -project Sparkle.xcodeproj -configuration Release ARCHS=x86_64 ONLY_ACTIVE_ARCH=YES MACOSX_DEPLOYMENT_TARGET=10.6 GCC_VERSION=com.apple.compilers.llvmgcc42
    cd -
    rm -Rf ${BUILD_DIR}
    mv ${SRC_DIR}/build/Release ${BUILD_DIR}
    cp ${SRC_DIR}/generate_keys.rb ${BUILD_DIR}/../
    cp ${SRC_DIR}/sign_update.rb ${BUILD_DIR}/../
    chmod u+x ${BUILD_DIR}/../sign_update.rb
    chmod u+x ${BUILD_DIR}/../generate_keys.rb
}

fixbuild(){
    cd ${BUILD_DIR}/Sparkle.framework/Headers/

# Fix broken includes
    ln -s ../Headers Sparkle
    cd -

# Fix resources symlinks
    cd ${BUILD_DIR}/Sparkle.framework/Resources
    rm fr_CA.lproj
#    rm fr.lproj/fr.lproj
    ln -s fr.lproj fr_CA.lproj
    cd -
}

if [ ! -d "$SRC_DIR" ]; then
    echo "Downloading"
    download
else
    echo "Already there. If you want to redownload, rm -Rf ${SRC_DIR}"
fi

if [ ! -d "$BUILD_DIR" ]; then
    echo "Building"
    build
    fixbuild
else
    echo "Already built. If you want to rebuild, rm -Rf ${BUILD_DIR}"
fi
