TEMPLATE = lib
QT = core

include($$PWD/../conf/conf.pri)

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

# Copy headers to destination
system(rm -Rf "$$DESTDIR/../include")
system(mkdir -p "$$DESTDIR/../")
system(cp -R "$$PWD/include" "$$DESTDIR/../")
system(rm -Rf "$$DESTDIR/../share")
system(mkdir -p "$$DESTDIR/../share/libroxeemegaup")
system(cp "$$PWD/../res/redist/*" "$$DESTDIR/../share/libroxeemegaup")
