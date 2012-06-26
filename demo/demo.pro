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
    QMAKE_LFLAGS += -F../third-party/Sparkle/
}

SOURCES += main.cpp
