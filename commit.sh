if [ "$1" = "fmc" ] 
then
message="fixes merge conflict"
else 
message="$1"
fi
git commit -m "$message"
git push
