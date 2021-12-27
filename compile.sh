#!/bin/bash

TARGET=$1 # コンパイルの対象

#----------------------------------------------------------------
# 実行コマンド
#----------------------------------------------------------------
TEX=platex
# BIB=pbibtex
PDF=dvipdfmx

docker run --rm -v "$PWD":/workdir paperist/alpine-texlive-ja $TEX "$TARGET".tex
docker run --rm -v "$PWD":/workdir paperist/alpine-texlive-ja $PDF "$TARGET".tex
rm -f "$TARGET".{aux,dvi,log,out,toc}
if [ -e "$TARGET".pdf ]; then
    if [ ! -e build/ ]; then
        mkdir build
    fi
    mv "$TARGET".pdf build/"$TARGET".pdf
fi
