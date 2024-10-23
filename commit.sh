# Prevent pushing to main or master branch
if [[ "$current_branch" == "main" || "$current_branch" == "master" ]]; then
    echo "\n${RED}Stop trying to push to the main or master branch, Rachel!${NC}\n"
    exit 1
fi

# Check if an argument is passed
if [ -z "$1" ]; then
    echo "${RED}Please provide a commit message or shortcut!${NC}"
    exit 1
fi

# Set commit message based on the argument
case "$1" in
  fmc)
    message="merges in new main branch and fixes merge conflict"
    ;;
  ff)
    message="removes feature flags"
    ;;
  db)
    rails db:migrate:with_data
    git add db/
    message="fixes database merge conflict"
    ;;
  r)
    message="fixes for rubocop or eslint"
    ;;
  s)
    message="stores changes to do stuff on another branch"
    ;;
  *)
    message="$1"
    ;;
esac

git commit -m "$message"
git push
