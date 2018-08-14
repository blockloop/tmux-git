get_tmux_option() {
        local option="$1"
        local default_value="$2"
        local option_value="$(tmux show-option -gqv "$option")"
        if [ -z "$option_value" ]; then
                echo "$default_value"
        else
                echo "$option_value"
        fi
}

is_osx() {
        [ $(uname) == "Darwin" ]
}

is_chrome() {
        chrome="/sys/class/chromeos/cros_ec"
        if [ -d "$chrome" ]; then
                return 0
        else
                return 1
        fi
}

print_git_status() {
        if st=$(git --no-optional-locks status -s --porcelain 2>/dev/null | awk '{print $1}' | cut -c1 | sort | uniq | xargs); then
                echo -n "$st"
        fi
}


print_git_ahead() {
        if branch=$(git --no-optional-locks rev-parse --abbrev-ref HEAD | xargs); then
                git for-each-ref --format="%(push:track)" refs/heads/$branch | \
                        grep -P '(ahead|behind)' | \
                        sed 's|ahead |↥|g; s|behind |↧|g'
        fi
}

print_git_branch() {
        if branch=$(git --no-optional-locks rev-parse --abbrev-ref HEAD | xargs); then
                echo -n "$branch"
        fi
}

