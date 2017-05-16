#sh scripts/pages/getOne.sh

#!/bin/sh

API="http://localhost:4741"
URL_PATH="/pages"
#ID of a Specific Page
TOKEN="np5/wbCPMRkwM3hl+pIPx+TrQSHetZgItaatrP8gWqk=--2gkVQNh8CObgqwKOw0omTL5/K02T/YTdJVJzlq7yS1Q="
ID="validIdHere"
curl "${API}${URL_PATH}/${ID}" \
  --include \
  --request GET \
  --header "Authorization: Token token=$TOKEN"

echo
