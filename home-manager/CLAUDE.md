# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## プロジェクト概要

これは個人のHome-Manager設定リポジトリです。Nixを使用してユーザー環境を宣言的に管理しています。

## よく使うコマンド

### 設定の適用
```bash
# Home-Manager設定を適用
home-manager switch --flake .

# Nixフレークを更新
nix flake update
```

### 開発時のコマンド
```bash
# 設定ファイルの構文チェック
nix flake check
```

## アーキテクチャ

### ディレクトリ構造
- `home.nix`: メインの設定ファイル。パッケージ、環境変数、基本設定を定義
- `programs/`: 各プログラムの設定を格納
  - `default.nix`: 自動的に全てのプログラム設定をインポート
  - 各`.nix`ファイル: 個別のプログラム設定（git、tmux、zsh等）

## 開発ガイドライン

### 実装時のエージェント使用
- 実装タスクを行う際は、品質保証機能を持つ`programmer`エージェントを使用してください
- programmerエージェントは実装、テスト、品質チェックを一貫して行います
