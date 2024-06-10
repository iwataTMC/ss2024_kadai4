#!/bin/bash

# 引数の数が2つでない場合はエラー終了
if [ $# -ne 2 ]; then
  echo "Error: 引数の数が正しくありません。2つの自然数を入力してください。"
  exit 1
fi

# 引数が自然数かどうかチェック
if ! [[ "$1" =~ ^[0-9]+$ ]] || ! [[ "$2" =~ ^[0-9]+$ ]]; then
  echo "Error: 引数は自然数である必要があります。"
  exit 1
fi

# ユークリッドの互除法を使用して最大公約数を計算
gcd() {
  if [ $2 -eq 0 ]; then
    echo $1
  else
    gcd $2 $(($1 % $2))
  fi
}

result=$(gcd $1 $2)
echo $result
