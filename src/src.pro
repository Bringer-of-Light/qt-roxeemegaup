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



defineTest(copyToDestdir) {
    files = $$1
    dest = $$2

    for(FILE, files) {
        DDIR = $$dest

        # Replace slashes in paths with backslashes for Windows
        win32:FILE ~= s,/,\\,g
        win32:DDIR ~= s,/,\\,g

        win32{
            system(mkdir $$quote($$DDIR))
        }else{
            system(mkdir -p $$quote($$DDIR))
        }
        message(********************************************)
        message($$QMAKE_COPY $$quote($$FILE) $$quote($$DDIR) $$escape_expand(\\n\\t))
        message(********************************************)

        QMAKE_POST_LINK += $$QMAKE_COPY $$quote($$FILE) $$quote($$DDIR) $$escape_expand(\\n\\t)
    }

    export(QMAKE_POST_LINK)
}

copyToDestdir($$PWD/include/libroxeemegaup/*, $$DESTDIR/../include/libroxeemegaup)
copyToDestdir($$PWD/../res/redist/*, $$DESTDIR/../share/libroxeemegaup)

# XXX careful with that - if both directories are the same
win32{
    contains(ROXEE_LINK_TYPE, dynamic){
        copyToDestdir($$SPARK/WinSparkle.dll, $$DESTDIR)
#        copyToDestdir($$ROXEE_EXTERNAL/lib/libvlccore.dll, $$DESTDIR)
    #    copyToDestdir($$ROXEE_EXTERNAL/lib/plugins/*, $$DESTDIR/plugins)
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
