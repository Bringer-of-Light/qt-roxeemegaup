#!/bin/sh

if which doxygen; then
    echo "Building documentation"
    doxygen doxygen.tpl
else
    echo "No doxygen binary - not building documentation"
fi
