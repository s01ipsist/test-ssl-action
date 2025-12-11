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
      - name: Checkout code
        uses: actions/checkout@v3
      
      - name: Test SSL/TLS
        uses: s01ipsist/test-ssl-action@main
        with:
          uri: 'https://example.com'
      
      - name: Upload results
        uses: actions/upload-artifact@v3
        with:
          name: testssl-results
          path: testssl_results_*.json
```

## Inputs

- `uri` (required): The URI to test (e.g., `https://example.com`)

## Outputs

The action saves JSON results to `/github/workspace/testssl_results_<timestamp>.json`.

## About testssl.sh

This action uses the [drwetter/testssl.sh](https://hub.docker.com/r/drwetter/testssl.sh) Docker image to perform comprehensive SSL/TLS testing.
