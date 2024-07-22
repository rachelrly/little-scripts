GREEN='\033[0;32m'
NC='\033[0m'
echo "\n${GREEN}Dropping and recreating rails database${NC}\n"
rails db:drop
rails db:create
rails db:migrate:with_data
echo "\n${GREEN}Deleting log files${NC}\n"
rm test.log development.log delayed_job.log
echo "\n${GREEN}Enabling all feature flags${NC}\n"
bash script/enable_feature_flags.sh
