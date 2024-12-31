# Tmux Cloud

<img src="./img/statusbar.png" style="margin: 0 auto" />

## Requirements

jq - Command-line JSON processor
```bash
sudo apt install jq
sudo pacman -S jq
```

## Supported CSP

| CSP | File | Requirements |
| -- | -- | -- |
| Azure | azure.tmux | azcli |
| AWS | - | - |
| GCP | - | - |
| Alibaba | - | - |

## Installation

### With TPM

.tmux.conf
```bash
set -g @plugin 'propilideno/tmux-cloud'
```

## Usage

.tmux.conf
```bash
set -g status-right ""
# .
# .
# append azure status to the right of the status bar
set -ga status-right " #(/bin/bash ~/.tmux/plugins/tmux-cloud/azure.tmux) "
```
