#sh scripts/auth/change-password.sh

#!/bin/bash

API="http://localhost:4741"
URL_PATH="/change-password"
# AZ: Added OLDPW, NEWPW, ID, and TOKEN in order to speed up the curl script testing process. Be sure to pass in a valid TOKEN.
OLDPW="admin"
NEWPW="admin"
TOKEN="jTJlpbfZvMk9uMsI5jnCZXmfXZ+Mt0/OSclqH0vj/68=--pFLYwVWxXhQsPKMoG9lpO8ngRVDCbi2cJk9Ofd6OihI="
ID="591a43534eacfb88c235956e"

curl "${API}${URL_PATH}/${ID}" \
  --include \
  --request PATCH \
  --header "Authorization: Token token=${TOKEN}" \
  --header "Content-Type: application/json" \
  --data '{
    "passwords": {
      "old": "'"${OLDPW}"'",
      "new": "'"${NEWPW}"'"
    }
  }'

echo
