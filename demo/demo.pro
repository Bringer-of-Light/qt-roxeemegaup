TEMPLATE = app
QT = core widgets

SOURCES +=  $$PWD/main.cpp

include($$PWD/../config/common.pri)

LIBS += -l$${ROXEE_LINK_NAME}

INCLUDEPATH += $$PWD
target.path = $$DESTDIR
INSTALLS += target

contains(ROXEE_LINK_TYPE, static){
    DEFINES += LIBROXEEMEGAUP_USE_STATIC

    !isEmpty(ROXEE_INTERNAL){
        message( -> Using internal third-party $${ROXEE_INTERNAL_VERSION})
        win32{
            copyToDestdir($$ROXEE_EXTERNAL/lib/WinSparkle.dll, $$DESTDIR)
        }
        mac{
            QMAKE_LFLAGS += -F$${ROXEE_EXTERNAL}/Frameworks
            system(rm -Rf $${DESTDIR}/roxeemegaup.app/Contents/Frameworks/Sparkle.framework)
            system(mkdir -p $${DESTDIR}/roxeemegaup.app/Contents/Frameworks)
            system(cp -R $${ROXEE_EXTERNAL}/Frameworks/Sparkle.framework $${DESTDIR}/roxeemegaup.app/Contents/Frameworks)
        }
    }
}


mac {
    OTHER_FILES += $$PWD/Info.plist
    QMAKE_INFO_PLIST = $${PWD}/Info.plist
}
