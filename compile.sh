#!/bin/bash

TARGET=$1 # コンパイルの対象

#----------------------------------------------------------------
# 実行コマンド
#----------------------------------------------------------------
TEX=platex
BIB=pbibtex
PDF=dvipdfmx

docker run --rm -v "$PWD":/workdir paperist/alpine-texlive-ja $TEX "$TARGET".tex
docker run --rm -v "$PWD":/workdir paperist/alpine-texlive-ja $BIB "$TARGET".aux
docker run --rm -v "$PWD":/workdir paperist/alpine-texlive-ja $PDF "$TARGET".dvi

rm -f *.{aux,dvi,log,out,toc,bbl,blg}

# PDFファイルをbuildフォルダに移動
if [ -e "$TARGET".pdf ]; then
    if [ ! -e build/ ]; then
        mkdir build
    fi
    mv "$TARGET".pdf build/"$TARGET".pdf
fi
