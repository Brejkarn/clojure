#!/bin/bash


if [ $# -ne 2 ]
then
  echo "Usage: ./delete-tables.sh <aws-profile> <env>"
  echo "Example: ./delete-tables.sh local-dynamodb dev"
  exit 1
fi

MY_AWS_PROFILE=$1
MY_ENV=$2

if [ "$MY_AWS_PROFILE" == "local-dynamodb" ]; then
  MY_ENDPOINT="--endpoint-url http://localhost:8000"
else
  MY_ENDPOINT=""
fi


MY_SESSION_TABLE="sseks-${MY_ENV}-session"
MY_USERS_TABLE="sseks-${MY_ENV}-users"
MY_PRODUCT_GROUP_TABLE="sseks-${MY_ENV}-product-group"
MY_PRODUCT_TABLE="sseks-${MY_ENV}-product"

echo "************  Delete tables  ************"
echo "Using AWS profile: $MY_AWS_PROFILE"

echo "************  Deleting: sseks-$MY_ENV-session  ************"

AWS_PROFILE=$MY_AWS_PROFILE aws dynamodb delete-table $MY_ENDPOINT --table-name $MY_SESSION_TABLE

echo "************  Deleting: sseks-$MY_ENV-users  ************"

AWS_PROFILE=$MY_AWS_PROFILE aws dynamodb delete-table $MY_ENDPOINT --table-name $MY_USERS_TABLE

echo "************  Deleting: sseks-$MY_ENV-product-group  ************"

AWS_PROFILE=$MY_AWS_PROFILE aws dynamodb delete-table $MY_ENDPOINT --table-name $MY_PRODUCT_GROUP_TABLE

echo "************  Deleting: sseks-$MY_ENV-product  ************"

AWS_PROFILE=$MY_AWS_PROFILE aws dynamodb delete-table $MY_ENDPOINT --table-name $MY_PRODUCT_TABLE
