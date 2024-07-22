rails db:drop
rails db:create
rails db:migrate:with_data
echo 'Deleting log files'
rm test.log development.log delayed_job.log
bash script/enable_feature_flags.sh
