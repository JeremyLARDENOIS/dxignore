# dxignore

This tool allow you to ignore syncfile of Dropbox Linux

## Documentation

<https://help.dropbox.com/files-folders/restore-delete/ignored-files>

## Pre-requisite

Please, install `attr` before (and dropbox)

## Installation

```bash
git clone https://github.com/JeremyLARDENOIS/dxignore
sudo cp -a dxignore/dxignore.sh /usr/local/bin/dxignore
```

## Usage

### Ignore a file or a repertory

```bash
dxignore [file]
```

### Know if a file or a repertory is ignored

```bash
dxignore -g [file]
```

### Stop ignore a file or a repertory

```bash
dxignore -r [file]
```

## Reporting

If you need it for MacOs, don't hesitate to let a issue.
You can let an issue, contribute, or just give feedback. It can help a lot !

Enjoy !
