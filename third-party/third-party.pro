TEMPLATE = subdirs

OTHER_FILES +=  $$PWD/README \
                $$PWD/bootstrap.sh

include($$PWD/../config/common.pri)

mac{
    !isEmpty(ROXEE_INTERNAL){
        system(./bootstrap.sh $$ROXEE_INTERNAL_VERSION)
    }
}
