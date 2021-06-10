#!/bin/bash

cd $OPENQA_BASEDIR/repos/openQA
rm -Rf $OPENQA_BASEDIR/db # to clear an existing db
t/test_postgresql $OPENQA_BASEDIR/db 1>/dev/null
