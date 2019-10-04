# Unit Tests Docker Action
![Test Action Badge](https://github.com/cryptopirates/unit-tests-action/workflows/Test%20Action/badge.svg)

This action enables cloning private Cryptopirates repositories, installing TA-Lib, and running unit tests on a Go module.

## Inputs

### `gitHubUsername`

**Required** The username of a GitHub user with the correct access rights.

### `gitHubAccessToken`

**Required** The GitHub user's access token.

### `requiresTALib`

Whether or not the package depends on TA-Lib.

## Example usage

```yaml
uses: cryptopirates/unit-tests-action@master
with:
    username: ${{ secrets.CP_USER }}
    accessToken: ${{ secrets.CP_ACCESS_TOKEN }}
    requiresTALib: true
```