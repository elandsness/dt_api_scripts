#!/bin/bash
if [ "$1" ]; then
  echo "{
          \"displayName\": \"$1\",
          \"unit\": \"Count\",
          \"types\": [
            \"$1\"
          ]
        }
    }";

  curl -s -X PUT \
    https://$DT_ENV.live.dynatrace.com/api/v1/timeseries/custom:$1 \
    -H "Authorization: Api-Token $DT_TOKEN" \
    -H "Content-Type: application/json" \
    -H "cache-control: no-cache" \
    -d "{
          \"displayName\": \"$1\",
          \"unit\": \"Count\",
          \"types\": [
            \"$1\"
          ]
        }
    }";
else
  echo "Usage $0 metric_name"
fi

