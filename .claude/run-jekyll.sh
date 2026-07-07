#!/bin/bash
export PATH="/opt/homebrew/opt/ruby/bin:$PATH"
export GEM_HOME="$HOME/.gem-jekyll"
export PATH="$GEM_HOME/bin:$PATH"
cd "$(dirname "$0")/.."
exec jekyll serve --host 0.0.0.0 --port 4000
