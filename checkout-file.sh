GREEN='\033[0;32m'
NC='\033[0m'
RED='\033[0;31m'

branch="main"
current_branch=$(git rev-parse --abbrev-ref HEAD)

if [ "$current_branch" = "main" ]; then
    echo "\n${RED}Cannot copy and commit files onto main.${NC}\n"
    exit 1
fi

if [ $# -eq 2 ]
then
branch="$2"
fi
echo "${GREEN}Replacing $1 with version from $branch branch${NC}"
git checkout $branch -- $1
git add $1
git commit -m "replaces $1 with version from $branch"
git push
