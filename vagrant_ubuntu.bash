#!/bin/bash
pushd .

curl -O https://releases.hashicorp.com/vagrant/2.2.14/vagrant_2.2.14_x86_64.deb
if [ "$?" != "0" ]; then
	echo "Cannot download vagrant.deb" 1>&2
	popd
	exit 1
fi

sudo apt install ./vagrant_2.2.14_x86_64.deb
rm ./vagrant_2.2.14_x86_64.deb

popd

