!isEmpty(ADDITIONAL_DEPENDENCIES_DIR){
    QMAKE_LFLAGS += -F$${ADDITIONAL_DEPENDENCIES_DIR}
    INCLUDEPATH += $${ADDITIONAL_DEPENDENCIES_DIR}/Sparkle.framework/Headers
}

# Pointing to third-party include and lib dirs, in case the external dep doesn't provide them
QMAKE_LFLAGS += -F$${PWD}/../third-party/Sparkle
INCLUDEPATH += $${PWD}/../third-party/Sparkle/Sparkle.framework/Headers

LIBS += -framework Sparkle
LIBS += -framework AppKit
