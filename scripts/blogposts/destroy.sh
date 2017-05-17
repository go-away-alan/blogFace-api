#sh scripts/pages/destroy.sh

#!/bin/bash
# SHOULDNT BE ABLE TO DELETE ANY PAGES UNLESS YOU MADE IT.

API="http://localhost:4741"
URL_PATH="/blogposts"
TOKEN="gBL4J8T7/8QvDtduSysLpmSsr6xDs+/WX1Q3+HxrdIc=--iY4tNdW2GrfHM1t/I2JJw0c4SAMzouYtHN147wi/3iM="
ID="591c71e60a65b62a24bd9166"
curl "${API}${URL_PATH}/${ID}" \
  --include \
  --request DELETE \
  --header "Authorization: Token token=${TOKEN}"

echo
