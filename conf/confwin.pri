LIBS += -L$${ROXEE_DEPENDENCIES_DIR}/WinSparkle-git-20120613
INCLUDEPATH += $${ROXEE_DEPENDENCIES_DIR}/WinSparkle-git-20120613
LIBS += -lwinsparkle


win32-g++{
    include(confwin-mingw.pri)
}else{
    include(confwin-msvc.pri)
}
