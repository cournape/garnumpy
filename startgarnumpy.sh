#!/bin/sh

GARNUMPYDIR=/usr/media/src/src/dsp/garnumpy/garnumpyinstall

PYTHONPATH=$GARNUMPYDIR/lib/python2.4/site-packages:$PYTHONPATH
PATH=$GARNUMPYDIR/bin:$PATH

export PYTHONPATH
export PATH
