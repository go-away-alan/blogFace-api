#sh scripts/auth/sign-out.sh

#!/bin/bash

API="http://localhost:4741"
URL_PATH="/sign-out"
# AZ: Added ID and TOKEN in order to speed up the curl script testing process. Be sure to pass in a valid TOKEN and ID.
TOKEN="insertValidTokenHere"
ID="insertValidIdHere"

curl "${API}${URL_PATH}/${ID}" \
  --include \
  --request DELETE \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=$TOKEN"

echo
