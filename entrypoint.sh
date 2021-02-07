#!/usr/bin/env bash

if [[ "$GITHUB_EVENT_NAME" != "pull_request" ]]; then
  echo "This action only runs on pull_request.closed"
  echo "Found: $GITHUB_EVENT_NAME"
  exit 1
fi

ACTION=$(jq -r ".action" $GITHUB_EVENT_PATH)
if [[ "$ACTION" != " closed" ]]; then
  echo "This action only runs on pull_request.closed"
  echo "Found: $GITHUB_EVENT_NAME.$ACTION"
  exit 1
fi
