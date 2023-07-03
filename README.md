# loglint-action
[![ci](https://github.com/ScottG489/loglint-action/actions/workflows/ci.yaml/badge.svg)](https://github.com/ScottG489/loglint-action/actions/workflows/ci.yaml)

This action runs [`loglint`](https://github.com/ScottG489/loglint) on logs generated from a workflow.

## Usage
Add the following workflow to your project. Replace `CHANGE_ME` with the workflow whose logs you'd like to lint.
```yaml
name: loglint

on:
  workflow_run:
    workflows: ["CHANGE_ME"]
    types:
      - completed
jobs:
  loglint:
    name: loglint
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - uses: scottg489/loglint-action@v0.1.0
        with:
          repo_token: ${{ github.token }}
```

## Limitations
At the moment, there's a GitHub limitation preventing you from retrieving logs against any jobs in a workflow that's still in progress.
This is why the loglint action needs to run in its own workflow. Once this limitation is lifted, the loglint action will be updated accordingly.
