#!/usr/bin/env bash
set -e

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source "$CURRENT_DIR/helpers.sh"

print_git_ahead() {
        if branch=$(git rev-parse --abbrev-ref HEAD | xargs); then
                git for-each-ref --format="%(push:track)" refs/heads/$branch | \
                        grep -P '(ahead|behind)'
                        # sed 's|ahead |A|g; s|behind |B|g; s,\[,,g; s,\],,g'
	fi
}

main() {
        print_git_ahead
}
main
