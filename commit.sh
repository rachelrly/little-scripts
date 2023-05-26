if [ "$1" = "fmc" ] 
then
message="fixes merge conflict"
elif [ "$1" = "r" ]
then
message="fixes for rubocop"
else 
message="$1"
fi
git commit -m "$message"
git push
