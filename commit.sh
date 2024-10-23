RED='\033[0;31m'
NC='\033[0m'
current_branch=$(git rev-parse --abbrev-ref HEAD)

if [ "$current_branch" = "main" ]; then
    echo "\n${RED}Stop trying to push to the main branch, Rachel${NC}\n"
    exit 1
fi

if [ "$1" = "fmc" ] 
then
message="merges in new main branch and fixes merge conflict"
elif [ "$1" = "ff" ]
then
message="removes feature flags"
elif [ "$1" = "db" ]
then
rails db:migrate:with_data
git add db/
message="fixes database merge conflict"
elif [ "$1" = "r" ]
then
message="fixes for rubocop or eslint"
elif [ "$1" = "s" ]
then
message="stores changes to do stuff on another branch"
else 
message="$1"
fi
git commit -m "$message"
git push
