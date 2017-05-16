#sh scripts/pages/destroy.sh

#!/bin/bash
# SHOULDNT BE ABLE TO DELETE ANY PAGES UNLESS YOU MADE IT.

API="http://localhost:4741"
URL_PATH="/pages"
TOKEN="PKovx5SovaSpolfE76ado9Vu+UD2X/ihhE35BDqY3xM=--PHIllUNmbKmXmQiFh8h8JIn4ad1jKLGMnA3z0fW4syk="
ID="591b3ded212207f9bb92fab6"
curl "${API}${URL_PATH}/${ID}" \
  --include \
  --request DELETE \
  --header "Authorization: Token token=${TOKEN}"

echo
