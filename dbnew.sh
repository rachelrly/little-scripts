#!/bin/bash

GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m'

set -e  # Exit if any command fails

# Drop and recreate the database
echo -e "\n${GREEN}Dropping and recreating Rails database${NC}\n"
rails db:drop
rails db:create
rails db:migrate:with_data

# Define log files to be deleted
log_files=("test.log" "development.log" "delayed_job.log")

# Delete log files if they exist
echo -e "\n${GREEN}Deleting log files${NC}\n"
for log_file in "${log_files[@]}"; do
  if [ -f "$log_file" ]; then
    rm "$log_file"
    echo -e "${GREEN}Deleted $log_file${NC}"
  else
    echo -e "${RED}Warning: $log_file not found${NC}"
  fi
done

# Enable all feature flags
echo -e "\n${GREEN}Enabling all feature flags${NC}\n"
bash script/enable_feature_flags.sh

# Success message
echo -e "\n${GREEN}Database reset and feature flags enabled successfully.${NC}\n"