# Basic consumer variables
include(../vars.pri)

# This is a library (to be ovveridden by eg MSVC specific config)
TEMPLATE = lib

# Requires only core
QT = core

# And be boring
CONFIG +=   QT_NO_CAST_FROM_ASCII \
            QT_NO_CAST_TO_ASCII \
            QT_STRICT_ITERATORS \
            QT_USE_FAST_CONCATENATION QT_USE_FAST_OPERATOR_PLUS

# Yes, this will build a lib
DEFINES += LIBROXEEMEGAUP_LIBRARY

# Basic stuff (version and build/path magic)
include(../conf/confbase.pri)

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
    message( -> Targetting linux)
    include(../conf/confunix.pri)
}

INCLUDEPATH += $$PWD
target.path = $$DESTDIR
INSTALLS += target

CONFIG += absolute_library_soname

#LIBROXEESINAPPSHARED_EXPORT
SOURCES += \
    root.cpp

HEADERS += \
    libroxeemegaup_global.h \
    root.h \
    megaup.h

macx {
    HEADERS +=              cocoainit.h
    OBJECTIVE_SOURCES +=    cocoainit.mm
    OBJECTIVE_SOURCES +=    megaup-mac.mm
}

win32 {
    SOURCES += megaup-win.cpp
}

unix{
    system(mkdir -p $${DESTDIR}/../Frameworks)
    system(ln -s $${PWD}/../third-party/Sparkle1.5b6/Sparkle.framework $${DESTDIR}/../Frameworks)
}
