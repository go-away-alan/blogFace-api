#sh scripts/auth/sign-in.sh

#!/bin/bash

API="http://localhost:4741"
URL_PATH="/sign-in"
# AZ: Added EMAIL and PASSWORD in order to speed up the curl script testing process.
EMAIL="tests"
PASSWORD="test"

curl "${API}${URL_PATH}" \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --data '{
    "credentials": {
      "email": "'"${EMAIL}"'",
      "password": "'"${PASSWORD}"'"
    }
  }'

echo
