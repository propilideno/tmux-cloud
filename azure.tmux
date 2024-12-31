#!/usr/bin/env bash

PROFILE_FILE="$HOME/.azure/azureProfile.json"
NOT_FOUND_MESSAGE=" no subscription"

if [ -f $PROFILE_FILE ]; then
	ACCOUNT_INFO=$(cat $PROFILE_FILE | jq '.subscriptions.[] | select(.isDefault == true)')
else
	ACCOUNT_INFO=$(az account show 2> /dev/null)
	if [[ $? -ne 0 ]]; then
		echo $NOT_FOUND_MESSAGE
		exit
	fi
fi

[[ -z $ACCOUNT_INFO ]] && { echo $NOT_FOUND_MESSAGE; exit; }

SUBSCRIPTION_ID=$(echo "$ACCOUNT_INFO" | jq ".id" -r)
SUBSCRIPTION_NAME=$(echo "$ACCOUNT_INFO" | jq ".name" -r)
USER_NAME=$(echo "$ACCOUNT_INFO" | jq ".user.name" -r)

STATUS_LINE=" $SUBSCRIPTION_NAME"

echo "$STATUS_LINE"
