#sh scripts/pages/getAll.sh

#!/bin/sh

API="http://localhost:4741"
URL_PATH="/blogposts"

# How should we handle this functionality? Allow all people to view?
# Replace this TOKEN with a valid one.
TOKEN="55eP/bjArMpyBvT4zZN+Y+1oW0X2KzH2QX9lKj2x5Bw=--xkBAhLkvYynbwxCRm5hPKS/nTqMj5Z2dDcG5FF89tUE="

curl "${API}${URL_PATH}" \
  --include \
  --request GET \
  --header "Authorization: Token token=$TOKEN"

echo
