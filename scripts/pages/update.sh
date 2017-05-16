#!/bin/bash

API="http://localhost:4741"
URL_PATH="/pages"
TOKEN="validTokenHere"
#ID of a Specific Page
ID="validIdHere"
TYPE="1"
TITLE="Sample"
curl "${API}${URL_PATH}/${ID}" \
  --include \
  --request PATCH \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=${TOKEN}" \
  --data '{
    "page": {
      "templateType": "'"${TYPE}"'",
      "pageTitle": "'"${TITLE}"'"
    }
  }'

echo
