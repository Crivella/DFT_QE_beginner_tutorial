#!/bin/bash

find . -name "*.out*" -print -exec rm {} \;
find . -name "plot.gnu" -print -exec rm {} \;
find . -name "*_script*" -print -exec rm {} \;
find . -name "*.ps*" -print -exec rm {} \;
find . -name "*.xmgr*" -print -exec rm {} \;
find . -name "*.rap*" -print -exec rm {} \;
find . -name "*.plot*" -print -exec rm {} \;
find . -name "tmp" -print -exec rm -r {} \;
find . -name "*~" -print -exec rm {} \;
find . -name "*.log" -print -exec rm {} \;

find . \( -name "*Ref*" -o -name "*Docs*" \) -prune -o -name "*.pdf" -print -exec rm {} \; 
find . \( -name "*Ref*" -o -name "*Docs*" \) -prune -o -name "*.dat" -print -exec rm {} \;
find . \( -name "*Ref*" -o -name "*Docs*" \) -prune -o -name "*.xsf" -print -exec rm {} \;


exit



