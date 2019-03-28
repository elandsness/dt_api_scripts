#!/bin/bash
if [ "$1" ]; then

echo '{
        "title": "Pirates Overload!!!",
        "source": "External Monitoring",
        "description": "There are way too many pirates right now",
        "eventType": "AVAILABILITY_EVENT",
        "timeoutMinutes": "1",
        "attachRules": {
            "tagRule": [
                {
                    "meTypes": [
                        "CUSTOM_DEVICE"
                    ],
                    "tags": [
                        {
                            "context": "CONTEXTLESS",
                            "key": "pirate"
                        }
                    ]
                }
            ]
        },
        "customProperties": {
            "Link": "https://pirate.monitoring.com/way_too_many_pirates"
        }
    }'

  while true; do curl -s -X POST \
    https://$DT_ENV.live.dynatrace.com/api/v1/events \
    -H "Authorization: Api-Token $DT_TOKEN" \
    -H "Content-Type: application/json" \
    -H "cache-control: no-cache" \
    -d "{
        \"title\": \"Pirates Overload!!!\",
        \"source\": \"External Monitoring\",
        \"description\": \"There are way too many pirates right now\",
        \"eventType\": \"AVAILABILITY_EVENT\",
        \"timeoutMinutes\": \"1\",
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
        },
        \"customProperties\": {
            \"Link\": \"https://pirate.monitoring.com/way_too_many_pirates\"
        }
    }"; sleep $1;
  done
else
  echo \"Usage $0 interval\"
fi
