TEMPLATE = lib
QT = core

include($$PWD/../config/common.pri)

DEFINES += LIBROXEEMEGAUP_LIBRARY

contains(ROXEE_LINK_TYPE, static){
    DEFINES += LIBROXEEMEGAUP_USE_STATIC
}

INCLUDEPATH += $$PWD
INCLUDEPATH += $$PWD/include
target.path = $$DESTDIR
INSTALLS += target

copyToDestdir($$PWD/include/libroxeemegaup/*, $$DESTDIR/../include/libroxeemegaup)
copyToDestdir($$PWD/../res/redist/*, $$DESTDIR/../share/libroxeemegaup)

!isEmpty(ROXEE_INTERNAL){
    contains(ROXEE_LINK_TYPE, dynamic){
        message( -> Using internal third-party $${ROXEE_INTERNAL_VERSION})
        win32{
            copyToDestdir($$ROXEE_EXTERNAL/lib/WinSparkle.dll, $$DESTDIR)
        }
        mac{
            system(rm -Rf $${DESTDIR}/../Frameworks/Sparkle.framework)
            system(mkdir -p $${DESTDIR}/../Frameworks)
            system(cp -R $${ROXEE_EXTERNAL}/Frameworks/Sparkle.framework $${DESTDIR}/../Frameworks)
        }
    }
}

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
