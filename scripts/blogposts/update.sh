#sh scripts/pages/update.sh

#!/bin/bash

API="http://localhost:4741"
URL_PATH="/blogposts"
BLOGPOSTTITLE="Why you SHOULDNT follow me"
BLOGPOSTCONTENT="I dont know what im doing"
ID="591c71e60a65b62a24bd9166"
TOKEN="gBL4J8T7/8QvDtduSysLpmSsr6xDs+/WX1Q3+HxrdIc=--iY4tNdW2GrfHM1t/I2JJw0c4SAMzouYtHN147wi/3iM="
curl "${API}${URL_PATH}/${ID}" \
  --include \
  --request PATCH \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=${TOKEN}" \
  --data '{
    "blogpost": {
      "blogpostTitle": "'"${BLOGPOSTTITLE}"'",
      "blogpostContent": "'"${BLOGPOSTCONTENT}"'"
    }
  }'

echo
