#!/bin/bash

TARGET=$1 # コンパイルの対象

docker run --rm -v "$PWD":/workdir paperist/alpine-texlive-ja uplatex "$TARGET".tex
docker run --rm -v "$PWD":/workdir paperist/alpine-texlive-ja dvipdfmx "$TARGET".dvi
rm -f "$TARGET".aux "$TARGET".dvi "$TARGET".log
if [ -e "$TARGET".pdf ]; then
    if [ ! -e build/ ]; then
        mkdir build
    fi
    mv "$TARGET".pdf build/"$TARGET".pdf
fi
