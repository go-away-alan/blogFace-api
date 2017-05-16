#sh scripts/pages/create.sh

#!/bin/sh

API="http://localhost:4741"
URL_PATH="/pages"
TYPE=1
TITLE="Sample"
TOKEN="np5/wbCPMRkwM3hl+pIPx+TrQSHetZgItaatrP8gWqk=--2gkVQNh8CObgqwKOw0omTL5/K02T/YTdJVJzlq7yS1Q="
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
