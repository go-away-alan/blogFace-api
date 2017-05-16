#sh scripts/pages/create.sh

#!/bin/sh

API="http://localhost:4741"
URL_PATH="/pages"
TYPE=1
TITLE="My blogFace Page"
HEADER="About Me"
SUBHEADER="Andy Zhong"
CONTENT="Waddup peeps it's the OG Andy Z and I just created a blogFace Page!"
CONTACT="@andyjz"
TOKEN="PKovx5SovaSpolfE76ado9Vu+UD2X/ihhE35BDqY3xM=--PHIllUNmbKmXmQiFh8h8JIn4ad1jKLGMnA3z0fW4syk="
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
      "subheader": "'"${SUBHEADER}"'",
      "pageContent": "'"${CONTENT}"'",
      "contact": "'"${CONTACT}"'"
    }
  }'

echo
