#!/bin/bash
pushd .
cd ~/Qt5.14.2/5.14.2/gcc_64/plugins/platforminputcontexts
ln -s /usr/lib/x86_64-linux-gnu/qt5/plugins/platforminputcontexts/libfcitxplatforminputcontextplugin.so libfcitxplatforminputcontextplugin.so
popd

