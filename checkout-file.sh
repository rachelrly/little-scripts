branch="main"
if [ $# -eq 2 ]
branch="$2"
fi
git checkout $branch -- $1
git add $1
git commit -m "replacing $1 with version from $branch"
git push