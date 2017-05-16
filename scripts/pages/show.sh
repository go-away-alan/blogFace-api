#!/bin/sh

API="http://localhost:4741"
URL_PATH="/pages"
TOKEN="validTokenHere"
ID="validIdHere"

curl "${API}${URL_PATH}/${ID}" \
  --include \
  --request GET \
  --header "Authorization: Token token=$TOKEN"

echo

# Have not changed this yet.
