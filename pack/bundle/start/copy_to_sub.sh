#!/bin/bash

DEST=../../

cp ack/autoload/* ${DEST}/autoload/
cp ack/plugin/* ${DEST}/plugin/
cp ack/doc/* ${DEST}/doc/

cp unimpaired/plugin/* ${DEST}/plugin/
cp unimpaired/doc/* ${DEST}/doc/

cp pathogen/autoload/* ${DEST}/autoload/

cp recover/autoload/* ${DEST}/autoload/
cp recover/plugin/* ${DEST}/plugin/
cp recover/doc/* ${DEST}/doc/

cp repeat/autoload/repeat.vim ${DEST}/autoload/
