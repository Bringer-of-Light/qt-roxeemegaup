#!/bin/sh

if [[ "$1" == "head" ]]; then
    type=master
    SRC_DIR=SparkleMaster
    BUILD_DIR=Sparkle1.X
else
    type=release
    SRC_DIR=Sparkle-sparkle-1.5b6
#    andymatuschak-Sparkle-9eb4368
    BUILD_DIR=Sparkle1.5b6
fi

download(){
    if [[ "$type" == "master" ]]; then
        git clone https://github.com/andymatuschak/Sparkle.git SparkleMaster
    else
        curl https://codeload.github.com/andymatuschak/Sparkle/tar.gz/sparkle-1.5b6 > temp.tar.gz
        tar -xzf temp.tar.gz
        rm temp.tar.gz
    fi
}

build(){
    cd ${SRC_DIR}
    xcodebuild -project Sparkle.xcodeproj -sdk macosx10.7 MACOSX_DEPLOYMENT_TARGET=10.6 -target Sparkle -configuration Release GCC_TREAT_WARNINGS_AS_ERRORS=NO ARCHS=x86_64 ONLY_ACTIVE_ARCH=YES
    # FAILS on master for some reaso... GCC_VERSION=com.apple.compilers.llvmgcc42
    cd -
    rm -Rf ${BUILD_DIR}
    mv ${SRC_DIR}/build/Release ${BUILD_DIR}
    cp ${SRC_DIR}/generate_keys.rb ${BUILD_DIR}/../
    cp ${SRC_DIR}/sign_update.rb ${BUILD_DIR}/../
    chmod u+x ${BUILD_DIR}/../sign_update.rb
    chmod u+x ${BUILD_DIR}/../generate_keys.rb
}

fixbuild(){
# Fix broken includes
    cd ${BUILD_DIR}/Sparkle.framework/Headers/
    ln -s ../Headers Sparkle
    cd -

# Fix resources symlinks
    cd ${BUILD_DIR}/Sparkle.framework/Resources
    rm fr_CA.lproj
#    rm fr.lproj/fr.lproj
    ln -s fr.lproj fr_CA.lproj
    cd -
}

relink(){
    if [[ -e Sparkle  ]]; then
        rm Sparkle
    fi
    ln -s ${BUILD_DIR} Sparkle
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

relink
