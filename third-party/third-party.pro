TEMPLATE = subdirs

OTHER_FILES +=  $$PWD/README \
                $$PWD/bootstrap.sh

include($$PWD/../conf/conf.pri)

mac{
# XXX this is broken very badly...
#    !isEmpty(ROXEE_INTERNAL_VERSION){
#        message( -> Using internal third-party $${ROXEE_INTERNAL_VERSION})
##        system(./bootstrap.sh)
#        system(./bootstrap.sh $$ROXEE_INTERNAL_VERSION)
#        system(rm -Rf $${DESTDIR}/Frameworks/Sparkle.framework)
#        system(mkdir -p $${DESTDIR}/Frameworks)
#        # Only useful to dynamic libs at this place
#        contains(ROXEE_LINK_TYPE, dynamic){
#            system(cp -R $${PWD}/../third-party/Sparkle/Sparkle.framework $${DESTDIR}/Frameworks)
#        }
#    }
}
