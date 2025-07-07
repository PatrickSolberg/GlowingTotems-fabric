#!/bin/bash
set -e
for v in 1.21.5 1.21.6 1.21.7; do
  ./gradlew buildForVersion -PtargetVersion=$v || exit 1
done 