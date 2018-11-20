#!/bin/bash

REPO="$1"
TAG="$2"                       # tag name or the word "latest"
FILE="$3-$TAG.zip"      # the name of your tag asset file, e.g. build.tar.gz
TOKEN="$4"
GITHUB="https://api.github.com"

function Github_api_auth() {
    curl -s -H "Authorization: token $TOKEN" $GITHUB/repos/${REPO}$@ 
}

function Get_tags() {
    Github_api_auth /tags | jq -r .[].name
}

function Get_id() {
    Github_api_auth /releases | jq "map(select(.tag_name == \"$TAG\"))[0].assets" | jq -r "map(select(.name == \"$FILE\"))[0].id"
}

function Get_file() {
    asset_id="$1"
    wget -q --auth-no-challenge --header='Accept:application/octet-stream' https://$TOKEN:@api.github.com/repos/$REPO/releases/assets/$asset_id -O $FILE
}

function TagExists() {
    tags=`Get_tags`
    for i in $tags
    do
        if [ $i == $TAG ];then
            echo 1
        fi
    done
}

if [ -z `TagExists` ];then
    echo "Tag does not exists"
    exit 1
fi
id=`Get_id`
Get_file $id