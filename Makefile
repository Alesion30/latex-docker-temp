#----------------------------------------------------------------
# コンパイル対象（.tex）
#----------------------------------------------------------------
TARGET = main
ABST = resume


# dockerイメージを取得
.PHONY: pull
pull:
	docker pull paperist/alpine-texlive-ja

# コンパイル
.PHONY: compile
compile:
	./compile.sh $(TARGET)
