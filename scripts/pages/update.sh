#sh scripts/pages/update.sh

#!/bin/bash

API="http://localhost:4741"
URL_PATH="/pages"
TYPE=1
TITLE="My blogFace Page"
HEADER="About Me"
SUBHEADER="Andy Zhong"
CONTENT="I updated my Page!"
CONTACT="@andyjz"
TOKEN="PKovx5SovaSpolfE76ado9Vu+UD2X/ihhE35BDqY3xM=--PHIllUNmbKmXmQiFh8h8JIn4ad1jKLGMnA3z0fW4syk="
ID="591b3ded212207f9bb92fab6"
curl "${API}${URL_PATH}/${ID}" \
  --include \
  --request PATCH \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=${TOKEN}" \
  --data '{
    "page": {
      "templateType": "'"${TYPE}"'",
      "pageTitle": "'"${TITLE}"'",
      "header": "'"${HEADER}"'",
      "subheader": "'"${SUBHEADER}"'",
      "pageContent": "'"${CONTENT}"'",
      "contact": "'"${CONTACT}"'"
    }
  }'

echo
