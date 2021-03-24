#!/bin/bash

echo -e "Some automated steps for QeeqBox projects"
date > clean-up.logs
commit="false"

if [[ "$1" == "social-analyzer" ]]; then
    echo "[X] social-analyzer"
    echo "[X] installing autopep8"
    apt-get install -y python3-autopep8
    echo "[X] installing autopep8"
    autopep8 . --recursive --in-place --max-line-length=10000 --verbose --aggressive --ignore=E402
    echo "[X] sorting websites"
    jq '.websites_entries|=sort_by(.url)' ./data/sites.json > ./data/sites.json_new
    cp -f ./data/sites.json_new ./data/sites.json
    commit="true"
fi

if [[ "$commit" == "true" ]]; then
	echo "[X] Committing to GitHub"
	git config user.name giga-a
	git config user.email gigaqeeq@gmail.com
	git add .
	git commit -m "[auto-a] clean up"
	git push
fi
