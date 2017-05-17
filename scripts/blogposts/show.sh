#sh scripts/pages/getOne.sh

#!/bin/sh

API="http://localhost:4741"
URL_PATH="/pages"
#ID of a Specific Page
TOKEN="PKovx5SovaSpolfE76ado9Vu+UD2X/ihhE35BDqY3xM=--PHIllUNmbKmXmQiFh8h8JIn4ad1jKLGMnA3z0fW4syk="
ID="591b3ded212207f9bb92fab6"
curl "${API}${URL_PATH}/${ID}" \
  --include \
  --request GET \
  --header "Authorization: Token token=$TOKEN"

echo
