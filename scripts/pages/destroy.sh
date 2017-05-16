#!/bin/bash
# SHOULDNT BE ABLE TO DELETE ANY PAGES UNLESS YOU MADE IT.

API="http://localhost:4741"
URL_PATH="/pages"
TOKEN="validTokenHere"
ID="validIdHere"
curl "${API}${URL_PATH}/${ID}" \
  --include \
  --request DELETE \
  --header "Authorization: Token token=${TOKEN}"

echo
