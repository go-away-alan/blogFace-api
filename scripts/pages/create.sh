#!/bin/sh

API="http://localhost:4741"
URL_PATH="/pages"
TYPE="Sample"
TITLE="Sample"
TOKEN="validTokenHere"
curl "${API}${URL_PATH}" \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=${TOKEN}" \
  --data '{
    "page": {
      "templateType": "'"${TYPE}"'",
      "pageTitle": "'"${TITLE}"'"
    }
  }'

echo
