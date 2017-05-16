#sh scripts/pages/update.sh

#!/bin/bash

API="http://localhost:4741"
URL_PATH="/pages"
TOKEN="np5/wbCPMRkwM3hl+pIPx+TrQSHetZgItaatrP8gWqk=--2gkVQNh8CObgqwKOw0omTL5/K02T/YTdJVJzlq7yS1Q="
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
