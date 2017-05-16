#sh scripts/auth/sign-out.sh

#!/bin/bash

API="http://localhost:4741"
URL_PATH="/sign-out"
# AZ: Added ID and TOKEN in order to speed up the curl script testing process. Be sure to pass in a valid TOKEN and ID.
TOKEN="QgjuyDgNw+o7pRdzSd/zTLLJuHLn5wFo3Bh3V48MJLc=--5RCfFS1wiwENsaTcvwMwSrlKnn+kK9m+ev935EuJbJk="
ID="591a43534eacfb88c235956e"

curl "${API}${URL_PATH}/${ID}" \
  --include \
  --request DELETE \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=$TOKEN"

echo
