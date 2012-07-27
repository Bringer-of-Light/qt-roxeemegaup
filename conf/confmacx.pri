!isEmpty(ROXEE_EXTERNAL){
    QMAKE_LFLAGS += -F$${ROXEE_EXTERNAL}
    INCLUDEPATH += $${ROXEE_EXTERNAL}/Sparkle.framework/Headers
}

# Pointing to third-party include and lib dirs, in case the external dep doesn't provide them
QMAKE_LFLAGS += -F$${PWD}/../third-party/Sparkle
INCLUDEPATH += $${PWD}/../third-party/Sparkle/Sparkle.framework/Headers

LIBS += -framework Sparkle
LIBS += -framework AppKit
