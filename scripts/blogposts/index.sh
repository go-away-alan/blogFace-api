#sh scripts/pages/getAll.sh

#!/bin/sh

API="http://localhost:4741"
URL_PATH="/blogposts"

# How should we handle this functionality? Allow all people to view?
# Replace this TOKEN with a valid one.
TOKEN="akzzHGB7bEY8U5fyoWYubFViul3GJkIknZZByZOph/o=--FVW3ijZbypxmjhoVDabnlIPT7syWhPdeTO2t+t/yRc8="

curl "${API}${URL_PATH}" \
  --include \
  --request GET \
  --header "Authorization: Token token=$TOKEN"

echo
