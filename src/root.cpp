/**
 * Copyright (c) 2012, WebItUp <contact@webitup.fr>
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:
 *
 * Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
 * Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

#include "root.h"

/*! \cond */

namespace RoxeeMegaUp{

const QString Root::getName(){
    return PROJECT_NAME;
}

const QString Root::getVersion(){
    return VERSION_FULL;
}

const QString Root::getRevision(){
    return VERSION_GIT;
}

const QString Root::getBuildType(){
    return PROJECT_BUILDTYPE;
}

const QString Root::getLinkType(){
    return PROJECT_LINKTYPE;
}

const QString Root::getChangeset(){
    return VERSION_CHANGE;
}


const QString Root::getLibName(){
#ifdef Q_OS_MAC
    return QString::fromAscii("sparkle");
#endif
#ifdef Q_OS_WIN
    return QString::fromAscii("win-sparkle");
#endif
}

const QString Root::getLibVersion(){
#ifdef Q_OS_MAC
    // XXX should better read the info.plist
    return QString::fromAscii("1");
#endif
#ifdef Q_OS_WIN
    return QString::fromAscii(WIN_SPARKLE_VERSION_MAJOR);
#endif
}

const QString Root::getLibRevision(){
#ifdef Q_OS_MAC
    // XXX should better read the info.plist
    return QString::fromAscii("5b6");
#endif
#ifdef Q_OS_WIN
    return QString::fromAscii(WIN_SPARKLE_VERSION_MINOR);
#endif
}

}

/*! \endcond */