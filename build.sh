#!/bin/bash
set -e

DIR="$(cd "$(dirname "$0")" && pwd)"
cd "$DIR"

export PATH="/opt/homebrew/opt/ruby/bin:$PATH"
export GEM_HOME="$HOME/.gem-jekyll"
export PATH="$GEM_HOME/bin:$PATH"

# Gemfile pins the "github-pages" gem to an old Jekyll version that
# doesn't run on modern Ruby, so build with the plain jekyll gem
# instead. Move Gemfile out of the way during the build and always
# put it back afterwards, even if the build fails.
if [ -f Gemfile ]; then
  mv Gemfile .Gemfile.tmp
  trap 'mv .Gemfile.tmp Gemfile 2>/dev/null' EXIT
fi

jekyll build

echo ""
echo "Ferdig. Last opp INNHOLDET i _site/ (ikke selve _site-mappen) til webhotellet."
