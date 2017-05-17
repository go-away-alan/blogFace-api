#sh scripts/pages/getAll.sh

#!/bin/sh

API="http://localhost:4741"
URL_PATH="/blogposts"

# How should we handle this functionality? Allow all people to view?
# Replace this TOKEN with a valid one.
TOKEN="gBL4J8T7/8QvDtduSysLpmSsr6xDs+/WX1Q3+HxrdIc=--iY4tNdW2GrfHM1t/I2JJw0c4SAMzouYtHN147wi/3iM="

curl "${API}${URL_PATH}" \
  --include \
  --request GET \
  --header "Authorization: Token token=$TOKEN"

echo
