#!/bin/bash

# Your Mastodon instance URL
instance_url=$1

# Your access token
access_token=$2

# Your status message
status_message=$3

# Visibility of the status message
visibility=$4

# Escape single and double quotes in the status message
status_message=$(echo $status_message | sed "s/'/\\\\'/g" | sed 's/"/\\"/g')

# fail if any parameter is empty
if [ -z "$instance_url" ] || [ -z "$access_token" ] || [ -z "$status_message" ] || [ -z "$visibility" ]; then
  echo "Usage: $0 <instance_url> <access_token> <status_message> <visibility>"
  exit 1
fi

echo "Posting status message: '$status_message' to '$instance_url' with visibility '$visibility'."

# Send the POST request
http_response="$(curl -X POST -Ss -w "%{response_code}" -o result.json \
  -H "Idempotency-Key: $(date +%s)" \
  -H "Authorization: Bearer $access_token" \
  -H "Content-Type: application/json" \
  -d "{\"status\":\"$status_message\",\"visibility\":\"$visibility\"}" \
  "$instance_url/api/v1/statuses")"

if [ $http_response != "200" ]; then
    echo "Error: HTTP response code $http_response"
    cat result.json
    exit 1
else
    echo "Success! $http_response"
    cat result.json
fi
