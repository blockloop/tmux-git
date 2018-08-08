#!/usr/bin/env bash
set -e

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source "$CURRENT_DIR/helpers.sh"

print_git_branch() {
        if branch=$(git rev-parse --abbrev-ref HEAD | xargs); then
                echo -n "$branch"
	fi
}

main() {
        print_git_branch
}
main
