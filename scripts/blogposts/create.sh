#sh scripts/pages/create.sh

#!/bin/sh

API="http://localhost:4741"
URL_PATH="/blogposts"
BLOGPOSTTITLE="Why humans love TV"
BLOGPOSTCONTENT="because marky mark put them in every damn room"
TOKEN="55eP/bjArMpyBvT4zZN+Y+1oW0X2KzH2QX9lKj2x5Bw=--xkBAhLkvYynbwxCRm5hPKS/nTqMj5Z2dDcG5FF89tUE="
curl "${API}${URL_PATH}" \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=${TOKEN}" \
  --data '{
    "blogpost": {
      "blogpostTitle": "'"${BLOGPOSTTITLE}"'",
      "blogpostContent": "'"${BLOGPOSTCONTENT}"'"
    }
  }'

echo
