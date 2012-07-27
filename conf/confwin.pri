isEmpty(ROXEE_EXTERNAL){
    LIBS += -L$${PWD}/../third-party/WinSparkle-git-20120613
    INCLUDEPATH += $${PWD}/../third-party/WinSparkle-git-20120613
}

LIBS += -lwinsparkle

win32-g++ {
    include(confwin-mingw.pri)
}

win32-msvc{
    include(confwin-msvc.pri)
}



