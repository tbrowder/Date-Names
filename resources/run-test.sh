#!/bin/bash

TESTS=$(ls 0*.t)

for f in ${TESTS} ; do
    raku -I../lib  $f ;
done
