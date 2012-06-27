include(../vars.pri)

TARGET = DemoMegaUp
TEMPLATE = app
QT = core gui

include(../conf/confbase.pri)

target.path = $$DESTDIR
INSTALLS += target

INCLUDEPATH += $$PWD
INCLUDEPATH += ../src/include

LIBS += -L$${DESTDIR}/../lib
LIBS += -lroxeemegaup

contains(ROXEE_LINK_TYPE, static){
    # If compiling statically
    isEmpty(ROXEE_DESTDIR){
        QMAKE_LFLAGS += -F../third-party/Sparkle/
    }
    !isEmpty(ADDITIONAL_DEPENDENCIES_DIR){
        QMAKE_LFLAGS += -F$${ADDITIONAL_DEPENDENCIES_DIR}
    }
}

SOURCES += main.cpp
