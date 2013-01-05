contains(TEMPLATE, app){
    INCLUDEPATH +=  $$DESTDIR/../include
}

contains(TEMPLATE, lib){
    win32{
#        !isEmpty(ROXEE_INTERNAL_VERSION){
        LIBS += -L$${PWD}/../third-party/WinSparkle-git-20120613
        INCLUDEPATH += $${PWD}/../third-party/WinSparkle-git-20120613
#        }
    }

}

mac{
    !isEmpty(ROXEE_EXTERNAL){
        QMAKE_LFLAGS += -F$${ROXEE_EXTERNAL}
        INCLUDEPATH += $${ROXEE_EXTERNAL}/Sparkle.framework/Headers
    }

    # Pointing to third-party include and lib dirs, in case the external dep doesn't provide them
    QMAKE_LFLAGS += -F$${PWD}/../third-party/Sparkle
    INCLUDEPATH += $${PWD}/../third-party/Sparkle/Sparkle.framework/Headers
}

