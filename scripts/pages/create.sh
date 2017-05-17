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
TOKEN="ZWLGo22P6Ub0nFzM3xSaHlXggOGWeop3SdJ1thLe2YM=--ylnWIk4Dc+5W0Mvl3NtAZz1IKAWDcCURvGewUNNQtH0="
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
