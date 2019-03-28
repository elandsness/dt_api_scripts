#!/bin/bash
if [ "$1" ]; then
  END_DATE=$(date +%s%N | cut -b1-13)
  START_DATE=$(( $END_DATE - (((RANDOM%60)+5)*10000) ))
  echo '{
        "eventType": "CUSTOM_ANNOTATION",
        "source": "'"$1"'",
        "start": "'"$START_DATE"'",
        "end": "'"$END_DATE"'",
        "annotationType": "change",
        "annotationDescription": "'"$1"': MORE PIRATES!!!",
        "customProperties":{
            "Performed By": "elandsness",
            "Notes": "How rad would it be to have even more pirates? This is going to be a lot of pirates! I hope this thing can handle it...",
            "URL": "https://my.change-system.com/'"$1"'"
        },
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
        }
    }'

  curl -s -X POST \
    https://$DT_ENV.live.dynatrace.com/api/v1/events \
    -H "Authorization: Api-Token $DT_TOKEN" \
    -H "Content-Type: application/json" \
    -H "cache-control: no-cache" \
    -d "{
        \"eventType\": \"CUSTOM_ANNOTATION\",
        \"source\": \"$1\",
        \"start\": \"$START_DATE\",
        \"end\": \"$END_DATE\",
        \"annotationType\": \"change\",
        \"annotationDescription\": \"$1: MORE PIRATES!!!\",
        \"customProperties\":{
            \"Performed By\": \"elandsness\",
            \"Notes\": \"How rad would it be to have even more pirates? This is going to be a lot of pirates! I hope this thing can handle it...\",
            \"URL\": \"https://my.change-system.com/$1\"
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
else
  echo "Usage $0 change_ticket"
fi
