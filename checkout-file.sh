GREEN='\033[0;32m'
NC='\033[0m'
branch="main"
if [ $# -eq 2 ]
then
branch="$2"
fi
echo "${GREEN}Replacing $1 with version from $branch branch${NC}"
git checkout $branch -- $1
git add $1
git commit -m "replaces $1 with version from $branch"
git push
