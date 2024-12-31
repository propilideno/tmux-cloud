#!/bin/bash

PROFILE_FILE="$HOME/.azure/azureProfile.json"

if [ -f $PROFILE_FILE ]; then
	ACCOUNT_INFO=$(cat $PROFILE_FILE | jq '.subscriptions.[] | select(.isDefault == true)')
else
	ACCOUNT_INFO=$(az account show 2> /dev/null)
	if [[ $? -ne 0 ]]; then
		echo "no subscription"
		exit
	fi
fi

SUBSCRIPTION_ID=$(echo "$ACCOUNT_INFO" | jq ".id" -r)
SUBSCRIPTION_NAME=$(echo "$ACCOUNT_INFO" | jq ".name" -r)
USER_NAME=$(echo "$ACCOUNT_INFO" | jq ".user.name" -r)

STATUS_LINE=" $SUBSCRIPTION_NAME"

echo "$STATUS_LINE"
