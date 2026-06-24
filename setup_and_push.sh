#!/bin/bash
set -e

REPO_DIR="$(cd "$(dirname "$0")" && pwd)"
GITHUB_USER="eegk"
REPO_NAME="eegk.github.io"
REMOTE_URL="https://github.com/${GITHUB_USER}/${REPO_NAME}.git"

echo "==> Checking for Homebrew..."
if ! command -v brew &>/dev/null; then
  echo "Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
  echo "Homebrew already installed."
fi

echo "==> Checking for Git..."
if ! command -v git &>/dev/null; then
  echo "Installing Git via Homebrew..."
  brew install git
else
  echo "Git already installed: $(git --version)"
fi

echo "==> Initializing git repo in: $REPO_DIR"
cd "$REPO_DIR"

if [ ! -d ".git" ]; then
  git init
  git remote add origin "$REMOTE_URL"
else
  echo "Git repo already initialized."
  # Make sure remote is set
  if ! git remote get-url origin &>/dev/null; then
    git remote add origin "$REMOTE_URL"
  fi
fi

echo "==> Staging all files..."
git add -A

echo "==> Committing..."
git commit -m "Fix remote_theme: switch to pages-themes/primer@v0.2.0" || echo "Nothing to commit."

echo "==> Pushing to GitHub (you may be prompted for credentials)..."
echo "    TIP: Use a Personal Access Token as your password."
echo "    Create one at: https://github.com/settings/tokens (scope: repo)"
echo ""

git push -u origin main 2>/dev/null || git push -u origin master

echo ""
echo "Done! Your site should rebuild at https://${GITHUB_USER}.github.io in ~1 minute."
