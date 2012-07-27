TEMPLATE = subdirs

OTHER_FILES +=  $$PWD/README \
                $$PWD/bootstrap.sh

include($$PWD/../vars.pri)
include($$PWD/../conf/confbase.pri)

mac{
    contains(ROXEE_THIRD_PARTY, internal){
        message( -> Using internal third-party)
        system(./bootstrap.sh)
#        system(./bootstrap.sh head)
        system(mkdir -p $${DESTDIR}/../Frameworks)
        system(rm $${DESTDIR}/../Frameworks/Sparkle.framework)
        # Only useful to dynamic libs at this place
        system(ln -s $${PWD}/../third-party/Sparkle/Sparkle.framework $${DESTDIR}/../Frameworks)
    }
}
