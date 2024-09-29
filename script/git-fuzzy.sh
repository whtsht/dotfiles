#!/bin/bash

# 関数: Gitの全ての変更をステージする
git_add_all() {
  git add .
  echo "All changes have been added."
}

# 関数: Gitの全ての変更をリセットする
git_reset() {
  git reset HEAD -- .
  echo "All changes have been reset."
}

# メニューを表示して選択を受け取る
while true; do
  # 選択肢と説明の配列
  options=("Git Add All" "Git Reset")

  # 説明の配列
  descriptions=(
    "Stage all changes in the current directory."
    "Unstage all changes in the current directory."
  )

  # フォーマットされた出力を作成
  formatted_options=()
  for i in "${!options[@]}"; do
    formatted_options+=("${options[i]}  \n${descriptions[i]}")
  done

  # fzfで選択
  selected=$(printf "%s\n" "${formatted_options[@]}" |
    fzf --height 40% --reverse --border \
      --preview "echo {} | sed 's/^[^ ]* //' | fold -s" \
      --preview-window=up:30%:wrap)

  # 選択に基づいて関数を呼び出す
  case $selected in
  "Git Add All"*)
    git_add_all
    break
    ;;
  "Git Reset"*)
    git_reset
    break
    ;;
  *)
    echo "Invalid option selected."
    break
    ;;
  esac
done
