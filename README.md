# dotfiles

Personal development environment configuration files for Vim, tmux, and ZSH.

## Contents

| File | Description |
|---|---|
| `.vimrc` | Vim configuration with Vundle plugin manager |
| `.tmux.conf` | tmux configuration with TPM plugin manager |
| `.zshrc` | ZSH configuration with Oh My Zsh |
| `dev-env-setup.sh` | Automated install script for all tools and plugins |

## Quick Start

```sh
git clone https://github.com/RobertBrodie/dotfiles.git ~/Documents/code/dotfiles.git
cd ~/Documents/code/dotfiles.git
./dev-env-setup.sh
source ~/.zshrc
```

The setup script will:
- Create symlinks for `.tmux.conf`, `.vimrc`, and `.zshrc` in `$HOME` (backing up any existing files)
- Install TPM and all tmux plugins
- Install Vundle and all Vim plugins
- Install all oh-my-zsh custom plugins

## Vim

**Plugin manager:** [Vundle](https://github.com/VundleVim/Vundle.vim)

**Plugins:**
| Plugin | Purpose |
|---|---|
| [NERDTree](https://github.com/preservim/nerdtree) | File explorer tree |

**Key bindings:**
| Binding | Action |
|---|---|
| `\r` | Reload `.vimrc` |
| `\n` | Toggle NERDTree |
| `Space` | Toggle fold |
| `Ctrl+H/J/K/L` | Navigate splits |

**Filetype support:**

| Language | Indent | Line limit | Notable settings |
|---|---|---|---|
| Python 3 | 4 spaces (PEP 8) | 79 chars | `python_highlight_all`, colorcolumn at 80 |
| Golang | Tabs (gofmt) | 120 chars | go highlight groups enabled |
| Shell | 4 spaces | 80 chars | bash syntax, heredoc folding, colorcolumn at 81 |

## tmux

**Plugin manager:** [TPM](https://github.com/tmux-plugins/tpm)

**Plugins:**
| Plugin | Purpose | Key binding |
|---|---|---|
| [tmux-sensible](https://github.com/tmux-plugins/tmux-sensible) | Sensible defaults | — |
| [tmux-logging](https://github.com/tmux-plugins/tmux-logging) | Pane logging | `prefix + shift-p` toggle, `prefix + alt-p` save |
| [tmux-cowboy](https://github.com/tmux-plugins/tmux-cowboy) | Kill hanging processes | `prefix + ctrl-f` |
| [tmux-resurrect](https://github.com/tmux-plugins/tmux-resurrect) | Save and restore sessions | `prefix + ctrl-s` save, `prefix + ctrl-r` restore |

**Key bindings:**
| Binding | Action |
|---|---|
| `prefix + r` | Reload `.tmux.conf` |
| `prefix + \|` | Split pane horizontally |
| `prefix + _` | Split pane vertically |
| `prefix + h/j/k/l` | Navigate panes |
| `prefix + c` | New named window |

## ZSH

**Framework:** [Oh My Zsh](https://ohmyz.sh/) with the `bira` theme

**Plugins:**
| Plugin | Purpose |
|---|---|
| [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions) | Fish-style command suggestions |
| [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting) | Command syntax highlighting |
| [zsh-you-should-use](https://github.com/MichaelAquilina/zsh-you-should-use) | Reminds you to use existing aliases |
| [zsh-bat](https://github.com/fdellwing/zsh-bat) | `bat` integration as a `cat` replacement |

## Manual Steps

After running `dev-env-setup.sh`, open tmux and press `prefix + I` to finalise TPM plugin installation. Open Vim and run `:PluginInstall` if any Vim plugins need a first-time initialisation.
