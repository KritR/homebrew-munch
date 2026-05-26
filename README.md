# homebrew-munch

Homebrew tap for the macOS cask of [`munch`](https://github.com/KritR/munch).

## Install

```sh
brew install --cask KritR/munch/munch
```

Equivalent explicit tap flow:

```sh
brew tap KritR/munch https://github.com/KritR/homebrew-munch
brew install --cask munch
```

## Upgrade

```sh
brew update
brew upgrade munch
```

## How this repo is updated

This tap is intended to be updated automatically by the `munch` release workflow through GoReleaser `homebrew_casks`.

Tagged releases in `KritR/munch` should:

1. build a signed and notarized universal macOS binary archive
2. publish that artifact to GitHub Releases
3. update `Casks/munch.rb` in this repository
