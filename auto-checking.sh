#!/bin/bash

echo -e "Some automated steps for QeeqBox projects"
date > clean-up.logs

if [[ "$1" == "social-analyzer" ]]; then
    echo "[X] social-analyzer" > clean-up.logs
    echo "[X] installing autopep8 & jq" > clean-up.logs
    sudo apt-get install -y python3-autopep8 jq
    echo "[X] running autopep8" > clean-up.logs
    autopep8 . --recursive --in-place --max-line-length=10000 --verbose --aggressive --ignore=E402
    echo "[X] sorting websites" > clean-up.logs
    jq '.websites_entries|=sort_by(.url)' ./data/sites.json > ./data/sites.json_new
    cp -f ./data/sites.json_new ./data/sites.json
    echo "[X] done" > clean-up.logs
elif [[ "$1" == "honeypots" ]]; then
    echo "[X] honeypots" > clean-up.logs
    echo "[X] installing autopep8 & jq" > clean-up.logs
    sudo apt-get install -y python3-autopep8 jq
    echo "[X] running autopep8" > clean-up.logs
    autopep8 . --recursive --in-place --max-line-length=10000 --verbose --aggressive --ignore=E402
    echo "[X] done" > clean-up.logs
fi
