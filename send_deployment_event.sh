#!/bin/bash
END_DATE=$(date +%s%N | cut -b1-13)
START_DATE=$(( $END_DATE - (((RANDOM%60)+5)*10000) ))
echo '{
    "eventType": "CUSTOM_DEPLOYMENT",
        "source": "Deploy-o-matic 5000",
        "deploymentName": "Deploy Pirates",
        "deploymentVersion": "2.3.1",
        "start": "'"$START_DATE"'",
        "end": "'"$END_DATE"'",
        "customProperties": {
            "Deployed By": "elandsness",
            "Release Notes": "Pushing code to ramp up the number of pirates. Works great in staging.",
            "URL": "https://deploy-o-matic.com/deploy_pirates_2_3_1"
        },
        "attachRules": {
            "tagRule": [
                {
                    "meTypes": [
                        "HOST"
                    ],
                    "tags": [
                        {
                            "context": "CONTEXTLESS",
                            "key": "pirate"
                        }
                    ]
                }
            ]
        }
    }'
curl -X POST \
  https://$DT_ENV.live.dynatrace.com/api/v1/events \
  -H "Authorization: Api-Token $DT_TOKEN" \
  -H "Content-Type: application/json" \
  -H "cache-control: no-cache" \
  -d "{
    \"eventType\": \"CUSTOM_DEPLOYMENT\",
        \"source\": \"Deploy-o-matic 5000\",
        \"deploymentName\": \"Deploy Pirates\",
        \"deploymentVersion\": \"2.3.1\",
        \"start\": \"$START_DATE\",
        \"end\": \"$END_DATE\",
        \"customProperties\": {
            \"Deployed By\": \"elandsness\",
            \"Release Notes\": \"Pushing code to ramp up the number of pirates. Works great in staging.\",
            \"URL\": \"https://deploy-o-matic.com/deploy_pirates_2_3_1\"
        },
        \"attachRules\": {
            \"tagRule\": [
                {
                    \"meTypes\": [
                        \"CUSTOM_DEVICE\"
                    ],
                    \"tags\": [
                        {
                            \"context\": \"CONTEXTLESS\",
                            \"key\": \"pirate\"
                        }
                    ]
                }
            ]
        }
    }";
