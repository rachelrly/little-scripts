if [ "$1" = "fmc" ] 
then
message="fixes merge conflict"
elif [ "$1" = "db" ]
then
rails db:migrate:with_data
git add db/
message="fixes database merge conflict"
elif [ "$1" = "r" ]
then
message="fixes for rubocop"
elif [ "$1" = "s" ]
then
message="stores changes to do stuff on another branch"
else 
message="$1"
fi
git commit -m "$message"
git push
