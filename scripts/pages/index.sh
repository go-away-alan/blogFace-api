#sh scripts/pages/getAll.sh

#!/bin/sh

API="http://localhost:4741"
URL_PATH="/pages"
TOKEN='fErW0oZN/BgHewBB80bteeJ8+/xDpYlYGn6Rn5D8U/o=--wfLZe2TO9m7/wfsBhrnQNuykaG8KSQgarpDycp+XvWI='

# How should we handle this functionality? Allow all people to view?
# Replace this TOKEN with a valid one.
# TOKEN="validTokenHere"

curl "${API}${URL_PATH}" \
  --include \
  --request GET \
  --header "Authorization: Token token=$TOKEN"

echo
