#!/bin/bash
DIR="$(cd "$(dirname "$0")/.." && pwd)"
cd "$DIR"

export PATH="/opt/homebrew/opt/ruby/bin:$PATH"
export GEM_HOME="$HOME/.gem-jekyll"
export PATH="$GEM_HOME/bin:$PATH"

jekyll serve --host 0.0.0.0 --port 4000
