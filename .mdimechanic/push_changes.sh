#!/bin/bash

# Exit if any command fails
set -e

# Add the Travis CI badge to README.md
git add ./.mdimechanic/ci_badge.md || true
git add ./README.md || true
git add ./report || true
echo "Committing the report"
git commit -m "Travis CI commit [ci skip]" || true
echo "Pushing the report"
git push -v > /dev/null 2>&1

echo "Finished pushing the updated report."

if [[ "${MDI_REPORT_STATUS}" -eq "0" ]] ; then
    echo "The MDI interface is working."
    exit 0
else
    echo "The MDI interface is failing."
    exit 1
fi