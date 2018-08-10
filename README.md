# tmux-git

Git info for your tmux status bars (as seen in the top left of this screenshot)

![](/screenshots/screenshot.png)

# Usages

Place any of the following in your tmux status-left or status-right

* `#{git_info}`: provides a combined format of branch, changes, and ahead/behind
* `#{git_status}`: prints the changes as `? D M A` with no counts
* `#{git_ahead}`: prints `[↥1↧3]` for "ahead 1 behind 3" when you are ahead or behind the current upstream
* `#{git_branch}`: prints the current local branch name

