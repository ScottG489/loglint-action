#!/bin/sh
set -e

export GH_TOKEN=${INPUT_REPO_TOKEN}
export WORKFLOW_RUN_ID=$(cat /github/workflow/event.json | jq '.workflow_run.id')

git config --global --add safe.directory /github/workspace

gh run view $WORKFLOW_RUN_ID --log > logs.txt

# Strip name of workflow, job, and timestamp from beginning of line. GitHub actions adds this and it isn't part of the raw log output.
sed -i 's/^[^\t]*\t[^\t]*\t\S* //' logs.txt

loglint logs.txt
