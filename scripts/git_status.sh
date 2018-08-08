#!/usr/bin/env bash
set -e

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source "$CURRENT_DIR/helpers.sh"

print_git_status() {
        if st=$(git status -s --porcelain 2>/dev/null | awk '{print $1}' | cut -c1 | sort | uniq | xargs); then
                echo -n "$st"
	fi
}

main() {
        cd $(tmux display -p -F "#{pane_current_path}")
        print_git_status
}
main
