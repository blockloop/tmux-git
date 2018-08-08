#!/usr/bin/env bash
set -e

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source "$CURRENT_DIR/helpers.sh"

main() {
        cd $(tmux display -p -F "#{pane_current_path}")
        echo -n "$(print_git_branch) $(print_git_ahead) $(print_git_status)" | tr -s ' '
}
main
