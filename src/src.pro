# Basic consumer variables
include(../vars.pri)

# Requires only core
QT = core

# Build a lib
TEMPLATE = lib
DEFINES += LIBROXEEMEGAUP_LIBRARY

# Basic stuff (version and build/path magic)
include(../conf/confbase.pri)

# Third-party stuff
include(../third-party/bootstrap.pri)

# Windows specific configuration
win32{
    message( -> Targetting windows)
    include(../conf/confwin.pri)
}

# Mac specific configuration
mac{
    message( -> Targetting osx)
    include(../conf/confmacx.pri)
}

# Unix specific configuration
unix:!mac {
    message( -> Targetting *nux)
    include(../conf/confunix.pri)
}

INCLUDEPATH += $$PWD
INCLUDEPATH += $$PWD/include/libroxeemegaup
target.path = $$DESTDIR
INSTALLS += target

SOURCES +=  root.cpp

HEADERS +=  include/libroxeemegaup/libroxeemegaup_global.h \
            include/libroxeemegaup/root.h \
            include/libroxeemegaup/megaup.h

mac {
    HEADERS +=              cocoainit.h
    OBJECTIVE_SOURCES +=    cocoainit.mm
    OBJECTIVE_SOURCES +=    megaup-mac.mm
}

win32 {
    SOURCES += megaup-win.cpp
}

!mac:!win32{
    SOURCES += megaup-other.cpp
}

