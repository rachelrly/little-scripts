if [ "$1" = "fmc" ] 
then
message="fixes merge conflict"
elif [ "$1" = "r" ]
then
message="fixes for rubocop"
elif [ "$1" = "s" ]
then
message="stores changes to do stuff on another branch"
elif [ "$1" = "m" ]
then
message="stores changes to merge in new main"
else 
message="$1"
fi
git commit -m "$message" --allow-empty
git push

if [ "$1" = "m" ]
then
echo "Switching branches to merge in new main"
git checkout main
git pull
git checkout -
git merge -
fi
