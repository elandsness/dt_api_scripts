#!/bin/bash
if [ "$1" ]; then
  END_DATE=$(date +%s%N | cut -b1-13)
  START_DATE=$(( $END_DATE - (((RANDOM%60)+$1)*10000) ))

  echo 'Start '"$START_DATE"
  echo 'END '"$END_DATE"
else
  echo "Usage $0 minute_offset_for_start"
fi
