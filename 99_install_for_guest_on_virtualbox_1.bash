#!/bin/bash
# for guest machine

pushd .

bash default_ubuntu.bash
if [ "$?" != "0" ]; then
	echo "Failed to install default_ubuntu" 1>&2
	popd
	exit 1
fi

echo 1. run language pack, configure fcitx, hangul and keyboard
echo 2. reboot

popd
