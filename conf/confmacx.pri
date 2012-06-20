QMAKE_MACOSX_DEPLOYMENT_TARGET = 10.6

# Pointing to include and lib dirs
!isEmpty(ROXEE_DEPENDENCIES_DIR){
    QMAKE_LFLAGS += -F$${ROXEE_DEPENDENCIES_DIR}/Sparkle1.5b6
    INCLUDEPATH += $${ROXEE_DEPENDENCIES_DIR}/Sparkle1.5b6/Sparkle.framework/Headers
}

!isEmpty(ADDITIONAL_DEPENDENCIES_DIR){
    QMAKE_LFLAGS += -F$${ADDITIONAL_DEPENDENCIES_DIR}
    INCLUDEPATH += $${ADDITIONAL_DEPENDENCIES_DIR}/Sparkle.framework/Headers
}




LIBS += -framework Sparkle
LIBS += -framework AppKit
LIBS += -framework Cocoa
