#sh scripts/pages/destroy.sh

#!/bin/bash
# SHOULDNT BE ABLE TO DELETE ANY PAGES UNLESS YOU MADE IT.
# confirmed by creating and deleting 591c8e66e49f211bed81612d  jfallon

API="http://localhost:4741"
URL_PATH="/pages"
TOKEN="ZWLGo22P6Ub0nFzM3xSaHlXggOGWeop3SdJ1thLe2YM=--ylnWIk4Dc+5W0Mvl3NtAZz1IKAWDcCURvGewUNNQtH0="
ID="591c8e66e49f211bed81612d"
curl "${API}${URL_PATH}/${ID}" \
  --include \
  --request DELETE \
  --header "Authorization: Token token=${TOKEN}"

echo
