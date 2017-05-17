#sh scripts/pages/create.sh

#!/bin/sh

API="http://localhost:4741"
URL_PATH="/blogposts"
BLOGPOSTTITLE="How you get enough sleep"
BLOGPOSTCONTENT="you work hard during the day"
TOKEN="tB3MfEGQcVW58hIleB3qJsT4K2QShjB7ahq9aQK/a/s=--jfX5KbFRu1hDg7qIE7ZFTGIGQ8wnRBzPVC2GYpvdq3k="
curl "${API}${URL_PATH}" \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=${TOKEN}" \
  --data '{
    "blogpost": {
      "blogpostTitle": "'"${BLOGPOSTTITLE}"'",
      "blogpostContent": "'"${BLOGPOSTCONTENT}"'"
    }
  }'

echo
