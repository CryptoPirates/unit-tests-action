# Unit Tests Docker Action
![Test Action Badge](https://github.com/cryptopirates/unit-tests-action/workflows/Test%20Action/badge.svg)

This action enables cloning private Cryptopirates repositories, installing TA-Lib, and running unit tests on a Go module.

## Inputs

### `gitUsername`

**Required** The username of a GitHub user with the correct access rights.

### `gitAccessToken`

**Required** The GitHub user's access token.

### `requiresTALib`

Whether or not the package depends on TA-Lib.

## Example usage

```yaml
uses: cryptopirates/unit-tests-action@master
with:
    gitUsername: ${{ secrets.GIT_USERNAME }}
    gitAccessToken: ${{ secrets.GIT_ACCESS_TOKEN }}
    requiresTALib: true
```