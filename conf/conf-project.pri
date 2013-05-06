contains(TEMPLATE, app){
    INCLUDEPATH +=  $$DESTDIR/../include
    LIBS += -L$$DESTDIR/../lib
    win32{
        contains(ROXEE_LINK_TYPE, static){
            LIBS += -l$${TARGET}
        }else{
            LIBS += -l$${TARGET}0
        }
    }else{
        LIBS += -l$${TARGET}
    }
}
win32{
    SPARK = $${PWD}/../third-party/WinSparkle-git-20130401
}


contains(TEMPLATE, lib){
    win32{
        INCLUDEPATH += $${SPARK}
        LIBS += -L$${SPARK}
    }
}

mac{
    !isEmpty(ROXEE_EXTERNAL){
        QMAKE_LFLAGS += -F$${ROXEE_EXTERNAL}/Frameworks/
        INCLUDEPATH += $${ROXEE_EXTERNAL}/Frameworks/Sparkle.framework/Headers
    }

    # Pointing to third-party include and lib dirs, in case the external dep doesn't provide them
    QMAKE_LFLAGS += -F$${PWD}/../third-party/Sparkle
    INCLUDEPATH += $${PWD}/../third-party/Sparkle/Sparkle.framework/Headers
}

