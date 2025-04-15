#!/bin/bash

# Git aliases for CRA/Webpack app (subtree in src/component-library)
REMOTE_URL="https://github.com/kvikrambhat/component-library.git"
PREFIX="src/component-library"

echo "📦 Setting up Git subtree aliases for Webpack app..."

git config alias.subtree-push "!f() { git subtree push --prefix=$PREFIX $REMOTE_URL \$1; }; f"
git config alias.subtree-pull "!f() { git subtree pull --prefix=$PREFIX $REMOTE_URL \$1 --squash; }; f"
git config alias.subtree-add  "!f() { git subtree add --prefix=$PREFIX $REMOTE_URL \$1 --squash; }; f"

# Automatically run the subtree add if it doesn't exist
if [ ! -d "$PREFIX" ]; then
  echo "📁 '$PREFIX' not found. Adding subtree from $REMOTE_URL..."
  git subtree add --prefix=$PREFIX $REMOTE_URL main --squash
else
  echo "✅ Subtree already exists at '$PREFIX'. Skipping add."
fi

echo "✅ Git aliases set and subtree is ready!"
