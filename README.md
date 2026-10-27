# gh-fd

GitHub CLI extension to manage [fd](https://github.com/sharkdp/fd).

## Install

    gh extension install kouji-sasaya/gh-fd

## Usage

    gh fd setup        # install fd (and an `fd` symlink if only `fdfind` exists)
    gh fd cleanup      # remove the symlink created by setup
    gh fd find-is-fd   # report whether fd is available

Subcommand scripts live in `commands/`.
