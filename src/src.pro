TEMPLATE = lib
QT = core

include($$PWD/../vars.pri)
include($$PWD/../conf/confbase.pri)

# Windows specific configuration
win32{
    message( -> Targetting windows)
    include($$PWD/../conf/confwin.pri)
}

# Mac specific configuration
mac{
    message( -> Targetting osx)
    include($$PWD/../conf/confmacx.pri)
}

# Unix specific configuration
unix:!mac {
    message( -> Targetting *nux)
    include($$PWD/../conf/confunix.pri)
}

DEFINES += LIBROXEEMEGAUP_LIBRARY

contains(ROXEE_LINK_TYPE, static){
    DEFINES += LIBROXEEMEGAUP_USE_STATIC
}

INCLUDEPATH += $$PWD
INCLUDEPATH += $$PWD/include
target.path = $$DESTDIR
INSTALLS += target


SOURCES +=  $$PWD/root.cpp

HEADERS +=  $$PWD/include/libroxeemegaup/libroxeemegaup_global.h \
            $$PWD/include/libroxeemegaup/root.h \
            $$PWD/include/libroxeemegaup/megaup.h

mac {
    HEADERS +=              $$PWD/mac/cocoainit.h
    OBJECTIVE_SOURCES +=    $$PWD/mac/cocoainit.mm
    OBJECTIVE_SOURCES +=    $$PWD/mac/megaup.mm
}

win32 {
    SOURCES += $$PWD/win/megaup.cpp
}

!mac:!win32{
    SOURCES += $$PWD/nux/megaup.cpp
}

