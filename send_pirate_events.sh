#!/bin/bash
if [ $1 ] && [ $2 ] && [ $3 ] && [ $4 ]; then
  timestamp() {
    date +%s%N | cut -b1-13
  }

  while true; do curl -s -X POST \
    https://$DT_ENV.live.dynatrace.com/api/v1/entity/infrastructure/custom/pirate_ship \
    -H "Authorization: Api-Token $DT_TOKEN" \
    -H "Content-Type: application/json" \
    -H "cache-control: no-cache" \
    -d "{\"displayName\":\"Pirate Tracker\",\"favicon\":\"https://www.turtleti.me/pirate.png\",
      \"type\":\"pirates\",\"properties\":{\"tracks\":\"pirates\"},\"tags\":[\"pirate\",\"tracker\",\"custom\"],
      \"series\":[{\"timeseriesId\":\"custom:num.pirates\",\"dataPoints\":[[$(timestamp),$(((RANDOM%$1)*$3))]]},
      {\"timeseriesId\":\"custom:num.pirate.attacks\",\"dataPoints\":[[$(timestamp),$(((RANDOM%$1)*$4))]]}],\"hostNames\":[\"elandsness.com\"],
      \"ipAddresses\":[\"35.235.81.79\"]}"; 
    sleep $2;
  done
else
  echo "Usage $0 max_rand_num interval_in_sec pirate_multiplier attack_multiplier"
fi
