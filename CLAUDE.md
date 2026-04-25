# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a personal dotfiles repository containing two configuration files:

- `.vimrc` — Vim configuration
- `.tmux.conf` — tmux configuration

There is no build system, test suite, or install script. Changes are deployed by manually symlinking or copying files to `$HOME`.

## Configuration Conventions

### .vimrc

- 4-space indentation (tabs expanded to spaces) for all files, with Python-specific overrides matching PEP 8
- Split navigation remapped to `Ctrl+{H,J,K,L}` (vim-style)
- Folding by indent, toggled with `<Space>`
- Backups go to `~/tmp`; swap files are disabled
- No plugins managed — plain Vimscript only

### .tmux.conf

- Window/pane indexing starts at 1
- Prefix + `_` splits vertically, `|` splits horizontally
- Pane navigation uses vi keys (`h/j/k/l`) after the prefix
- Prefix + `r` reloads the config live
- New windows prompt for a name via `c`
