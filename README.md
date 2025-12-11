# test-ssl-action

GitHub Action to check SSL/TLS ciphers, protocols, cryptographic flaws + much more using [testssl.sh](https://testssl.sh/).

## Usage

```yaml
name: Test SSL
on: [push]

jobs:
  test-ssl:
    runs-on: ubuntu-latest
    steps:
      - name: Test SSL/TLS
        uses: s01ipsist/test-ssl-action@main
        with:
          uri: 'https://expired.badssl.com/'
      
      - name: Upload results
        uses: actions/upload-artifact@v4
        with:
          name: testssl-results
          path: testssl_results_*.json
```

### Testing Multiple URIs with Matrix Strategy

You can test multiple URIs in parallel using a matrix strategy:

```yaml
name: Test SSL Matrix
on: [push]

jobs:
  test-ssl-matrix:
    runs-on: ubuntu-latest
    strategy:
      matrix:
        uri:
          - 'https://badssl.com/'
          - 'https://mozilla-old.badssl.com/'
    steps:
      - name: Test SSL/TLS for ${{ matrix.uri }}
        uses: s01ipsist/test-ssl-action@main
        with:
          uri: ${{ matrix.uri }}
      
      - name: Upload results
        uses: actions/upload-artifact@v4
        if: always()
        with:
          name: testssl-results-${{ strategy.job-index }}
          path: testssl_results_*.json
```

## Inputs

- `uri` (required): The URI to test (e.g., `https://expired.badssl.com/`)

## Outputs

The action saves JSON results to `testssl_results_<timestamp>.json`.

## About testssl.sh

This action uses the [drwetter/testssl.sh](https://hub.docker.com/r/drwetter/testssl.sh) Docker image to perform comprehensive SSL/TLS testing.
