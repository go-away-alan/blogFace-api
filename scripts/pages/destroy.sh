#sh scripts/pages/destroy.sh

#!/bin/bash
# SHOULDNT BE ABLE TO DELETE ANY PAGES UNLESS YOU MADE IT.

API="http://localhost:4741"
URL_PATH="/pages"
TOKEN="np5/wbCPMRkwM3hl+pIPx+TrQSHetZgItaatrP8gWqk=--2gkVQNh8CObgqwKOw0omTL5/K02T/YTdJVJzlq7yS1Q="
ID="validIdHere"
curl "${API}${URL_PATH}/${ID}" \
  --include \
  --request DELETE \
  --header "Authorization: Token token=${TOKEN}"

echo
