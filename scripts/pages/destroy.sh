#sh scripts/pages/destroy.sh

#!/bin/bash
# SHOULDNT BE ABLE TO DELETE ANY PAGES UNLESS YOU MADE IT.
# confirmed by creating and deleting 591c8e66e49f211bed81612d  jfallon

API="http://localhost:4741"
URL_PATH="/pages"
TOKEN="elgosaPgT1E1gHxAwpZj3xFOqk5Topu5mlCEf19cNLw=--tl4rgyIfE8T0f7wYAjm7tRKAT5/JrvVoeQ7617N1Nvo="
ID="591c8e66e49f211bed81612d"
curl "${API}${URL_PATH}/${ID}" \
  --include \
  --request DELETE \
  --header "Authorization: Token token=${TOKEN}"

echo
