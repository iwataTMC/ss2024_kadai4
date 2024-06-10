#!/bin/bash

# テストケース1: 2と4を入力する (期待する出力: 2)
output=$(./script.sh 2 4)
if [ $? -ne 0 ] || [ "$output" != "2" ]; then
  echo "Test case 1 failed."
  exit 1
fi

# テストケース2: 3を入力する (エラーメッセージが出るはず)
output=$(./script.sh 3 2>&1)
if [ $? -eq 0 ] || [[ "$output" != "Error: 引数の数が正しくありません。"* ]]; then
  echo "Test case 2 failed."
  exit 1
fi

# テストケース3: 文字を入力する (エラーメッセージが出るはず)
output=$(./script.sh abc def 2>&1)
if [ $? -eq 0 ] || [[ "$output" != "Error: 引数は自然数である必要があります。" ]]; then
  echo "Test case 3 failed."
  exit 1
fi

echo "All test cases passed."
