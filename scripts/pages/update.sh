#sh scripts/pages/update.sh

#!/bin/bash

API="http://localhost:4741"
URL_PATH="/pages"
TYPE=1
TITLE="Yay team"
HEADER="About Me"
SUBHEADER="Joni updates"
CONTENT="I updated my Page!"
CONTACT="@andyjz"
TOKEN="ZWLGo22P6Ub0nFzM3xSaHlXggOGWeop3SdJ1thLe2YM=--ylnWIk4Dc+5W0Mvl3NtAZz1IKAWDcCURvGewUNNQtH0="
ID="591c9499e49f211bed81612f"
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
      "subHeader": "'"${SUBHEADER}"'",
      "pageContent": "'"${CONTENT}"'",
      "contact": "'"${CONTACT}"'"
    }
  }'

echo
