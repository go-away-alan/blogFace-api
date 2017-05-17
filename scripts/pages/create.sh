#sh scripts/pages/create.sh

#!/bin/sh

API="http://localhost:4741"
URL_PATH="/pages"
TYPE=1
TITLE="His blogFace Page"
HEADER="What is happening to football"
SUBHEADER="Steve D"
CONTENT="Waddup peeps it's the OG Steve D and I just created a blogFace Page!"
CONTACT="@steved"
TOKEN="fErW0oZN/BgHewBB80bteeJ8+/xDpYlYGn6Rn5D8U/o=--wfLZe2TO9m7/wfsBhrnQNuykaG8KSQgarpDycp+XvWI="
curl "${API}${URL_PATH}" \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=${TOKEN}" \
  --data '{
    "page": {
      "templateType": "'"${TYPE}"'",
      "pageTitle": "'"${TITLE}"'",
      "header": "'"${HEADER}"'",
      "subHeader": "'"${SUBHEADER}"'",
      "pageContent": "'"${CONTENT}"'",
      "contact": "'"${CONTACT}"'"
    }
  }'

echo
