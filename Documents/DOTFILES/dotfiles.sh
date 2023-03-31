#https://www.atlassian.com/git/tutorials/dotfiles
#https://news.ycombinator.com/item?id=32632533

#!/bin/bash
    set -euo pipefail # the usual stuff

    # TODO: copy the below function into your .*rc file
    function config {
        /usr/bin/git --git-dir="$HOME/.cfg/" --work-tree="$HOME" "$@"
    }

    # TODO: replace '***YOUR_GIT_REPO_ADDRESS***' below
    git clone --bare https://github.com/chd0t/.cfg.git "$HOME/.cfg"
    config config status.showUntrackedFiles no

    if config checkout; then
        # worked fine, we're done
        echo "Checked out config."
    else
        # it failed, so assume we need to move some files out of the way
        echo "Backing up pre-existing dot files."
        mkdir -p "$HOME/.conf:ig-backup"
        config checkout 2>&1 | grep -e "\s+\." | awk "{'print $1'}" | xargs -I{} mv {} "$HOME/.config-backup"/{}
        config checkout || (echo "Still cannot checkout configs; see messages and fix." && exit 1)
        echo "Checked out config."
    fi
