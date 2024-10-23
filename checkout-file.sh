
#!/bin/bash

GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m'

protected_branches=("main" "master")
current_branch=$(git rev-parse --abbrev-ref HEAD)

# Check if current branch is protected
for branch in "${protected_branches[@]}"; do
  if [ "$current_branch" == "$branch" ]; then
    echo "\n${RED}Cannot copy and commit files onto a protected branch: $branch.${NC}\n"
    exit 1
  fi
done

# Check if a file argument was passed
if [ -z "$1" ]; then
  echo "${RED}Error: No file specified.${NC}"
  exit 1
fi

# Set the target branch (default is 'main')
target_branch="main"
if [ $# -eq 2 ]; then
  target_branch="$2"
fi

# Check if the file exists in the current directory
if [ ! -f "$1" ]; then
  echo "${RED}Error: File '$1' not found.${NC}"
  exit 1
fi

# Check if the target branch exists
if ! git show-ref --verify --quiet "refs/heads/$target_branch"; then
  echo "${RED}Error: Branch '$target_branch' does not exist.${NC}"
  exit 1
fi

# Perform the file checkout and commit
echo "${GREEN}Replacing '$1' with version from '$target_branch' branch.${NC}"
git checkout "$target_branch" -- "$1"
git add "$1"
git commit -m "replaces '$1' with version from $target_branch"
git push
