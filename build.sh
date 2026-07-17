#!/bin/bash
set -e

DIR="$(cd "$(dirname "$0")" && pwd)"
cd "$DIR"

export PATH="/opt/homebrew/opt/ruby/bin:$PATH"
export GEM_HOME="$HOME/.gem-jekyll"
export PATH="$GEM_HOME/bin:$PATH"

jekyll build

echo ""
echo "Ferdig. Last opp INNHOLDET i _site/ (ikke selve _site-mappen) til webhotellet."
