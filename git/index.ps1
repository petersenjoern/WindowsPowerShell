function git-alias-list {
    git config --get-regexp 'alias.*'
}

function git-config-alias {
    git config --global -e
    git config --global alias.s status
    git config --global alias.ss "status -s"
    git config --global alias.d diff
    git config --global alias.diffc "diff --cached HEAD^"
    git config --global alias.co checkout
    git config --global alias.br branch
    git config --global alias.last "log -1 HEAD"
    git config --global alias.gpl "pull origin"
    git config --global alias.cmt "commit --amend --no-edit"
    git config --global alias.pr "pull --rebase"
    git config --global alias.gl "log --graph --oneline --decorate -n 20"
}

function gs { 
    git status
}
