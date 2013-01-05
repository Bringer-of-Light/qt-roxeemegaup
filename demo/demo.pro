TEMPLATE = app

## Basic consumer variables
QT = core widgets

SOURCES +=  $$PWD/main.cpp

OTHER_FILES += $$PWD/Info.plist


# You don't "need" any "magic" of the following - just link against the produced library if you are doing it your own way
include($$PWD/../conf/conf.pri)

INCLUDEPATH += $$PWD
target.path = $$DESTDIR
INSTALLS += target

QMAKE_INFO_PLIST = $${PWD}/Info.plist

#TARGET = DemoMegaUp
#TEMPLATE = app
#QT = core gui

#include(../conf/confbase.pri)

#target.path = $$DESTDIR
#INSTALLS += target

#INCLUDEPATH += $$PWD
#INCLUDEPATH += ../src/include

#LIBS += -L$${DESTDIR}/../lib

#contains(ROXEE_LINK_TYPE, static){
#    DEFINES += LIBROXEEMEGAUP_USE_STATIC
#}

##win32{
##    !contains(ROXEE_LINK_TYPE, static){
###        win32-g++{
###            LIBS += -lroxeemegaup
###        }else{
###        }
##        LIBS += -lroxeemegaup0
##    }else{
##        LIBS += -lroxeemegaup
##    }
##}else{
##    LIBS += -lroxeemegaup
##}

#win32{
## GCC
#    win32-g++{
#        LIBS += -lroxeemegaup
#    }else{
## MSVC
#        contains(ROXEE_LINK_TYPE, static){
##            DEFINES += LIBROXEEMEGAUP_LIBRARY_STATIC
#            LIBS += -lroxeemegaup
#        }else{
#            LIBS += -lroxeemegaup0
#        }

#    }

##else{
###            LIBS += -lroxeemegaup
##    }
#}

##win32{
##    LIBS += -lroxeemegaup0
##}else{
##}

#mac{
#    contains(ROXEE_LINK_TYPE, static){
#        # If compiling statically
#        isEmpty(ROXEE_DESTDIR){
#            QMAKE_LFLAGS += -F../third-party/Sparkle/
#        }
#        !isEmpty(ROXEE_EXTERNAL){
#            QMAKE_LFLAGS += -F$${ROXEE_EXTERNAL}
#        }
#    }
#}

#SOURCES += main.cpp
