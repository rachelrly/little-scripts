if [ "$1" = "fmc" ] 
then
message="fixes merge conflict"
elif [ "$1" = "r" ]
then
message="fixes for rubocop"
elif [ "$1" = "rep" ]
then
message="replaces unchanged files with ones from main"
else 
message="$1"
fi
git commit -m "$message"
git push
