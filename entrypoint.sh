u#!/bin/bash

mkdir -p ~/openQA-dev/{config,repos}
cd ~/openQA-dev/repos
git clone git://github.com/os-autoinst/openQA.git
git clone git://github.com/os-autoinst/os-autoinst.git

OPENQA_BASEDIR=$HOME/openQA-dev

echo "export OPENQA_BASEDIR=\$HOME/openQA-dev" >>~/.bashrc
echo "export OPENQA_CONFIG=\$OPENQA_BASEDIR/config" >>~/.bashrc
echo "export OPENQA_LIBPATH=\$OPENQA_BASEDIR/repos/openQA/lib" >>~/.bashrc
echo "export PERL5LIB=$OPENQA_LIBPATH:\$OPENQA_BASEDIR/repos/openQA/t/lib" >>~/.bashrc
echo "CDPATH=.:\$OPENQA_BASEDIR/repos" >>~/.bashrc

mkdir -p ~/openQA-dev/openqa/{db,share/factory/hdd}
printf "[production]\ndsn = DBI:Pg:dbname=openqa_test;host=$OPENQA_BASEDIR/db" > ~/openQA-dev/config/database.ini
printf "[127.0.0.1]\nkey=1234567890ABCDEF\nsecret=1234567890ABCDEF" > ~/openQA-dev/config/client.conf
printf "[global]\nHOST=http://127.0.0.1:9526" > ~/openQA-dev/config/workers.ini

(
cd os-autoinst
make
make check
)

while true; do sleep 30 ; done
