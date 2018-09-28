#!/usr/bin/env bash

# TODO: move to `printf`
# TODO: possible to add `diff` given that it's interactive?

# stage everything
echo -en "$(tput setaf 5)STATUS$(tput sgr0)\n"
git add -A
git status -s >&2

# show some recent commtis for context
echo -en "$(tput setaf 5)LOG$(tput sgr0)\n"
git log --graph -n 3 --oneline --all --decorate >&2

# punch in commit msg
echo -en "$(tput setaf 5)MSG$(tput sgr0)\n --> "
read msg
commit="$(git commit -m "$msg")"

# display commit and push
echo -en "$(tput setaf 5)COMMIT$(tput sgr0)\n"
echo "${commit}"
git push