#!/bin/sh

API="http://localhost:4741"
URL_PATH="/pages"
# How should we handle this functionality? Allow all people to view?
# Replace this TOKEN with a valid one.
# TOKEN="validTokenHere"

curl "${API}${URL_PATH}" \
  --include \
  --request GET \
  # --header "Authorization: Token token=$TOKEN"

echo
