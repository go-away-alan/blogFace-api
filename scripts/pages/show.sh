#sh scripts/pages/getOne.sh

#!/bin/sh

API="http://localhost:4741"
URL_PATH="/pages"
#ID of a Specific Page
TOKEN="ZWLGo22P6Ub0nFzM3xSaHlXggOGWeop3SdJ1thLe2YM=--ylnWIk4Dc+5W0Mvl3NtAZz1IKAWDcCURvGewUNNQtH0="
ID="591b3ded212207f9bb92fab6"
curl "${API}${URL_PATH}/${ID}" \
  --include \
  --request GET \
  --header "Authorization: Token token=$TOKEN"

echo
