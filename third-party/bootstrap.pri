isEmpty(ADDITIONAL_DEPENDENCIES_DIR){
    message( -> Using internal third-party)
    mac{
        message( Building third-party )
#        system(./bootstrap.sh)
        system(./bootstrap.sh head)
        system(mkdir -p $${DESTDIR}/../Frameworks)
        system(rm $${DESTDIR}/../Frameworks/Sparkle.framework)
        # Only useful to dynamic libs at this place
        system(ln -s $${PWD}/../third-party/Sparkle/Sparkle.framework $${DESTDIR}/../Frameworks)
    }
}
