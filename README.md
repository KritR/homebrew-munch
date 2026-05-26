# homebrew-munch

Homebrew tap for [`munch`](https://github.com/KritR/munch).

## Install

```sh
brew tap KritR/munch https://github.com/KritR/homebrew-munch
brew install munch
```

Or in one command:

```sh
brew install KritR/munch/munch
```

## Upgrade

```sh
brew update
brew upgrade munch
```

## HEAD build

To install the latest `main` branch build instead of the latest tagged release:

```sh
brew install --HEAD KritR/munch/munch
```

## Updating the formula

When `munch` ships a new GitHub release:

1. Update `version` in `Formula/munch.rb`.
2. Replace the four platform `sha256` values with the contents of the new `checksums.txt`.
3. Push the change to this tap repository.
