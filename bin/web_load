#!/bin/bash

## Author: Glen Morgan (glen.morgan@outlook.com)
## Date: June 24th, 2014
## Usage: web_loadmy [options] ARG
##
## Options:
##   -h, --help    Display this message.
##
##   -g            Load GitHub branch in browser 
##                 arg  branch name
##                 ./web_load.sh -g topic/PROD-123
##
##   -j            Load Jira ticket
##                 arg ticket number
##                 ./web_load.sh -j PROD-123
##
##   -p            Load GitHub pull request
##                 arg pull request number
##                 ./web_load.sh -p 12

# BASE URLS
JIRA_BASE_URL="http://jira.aio-tv.com/browse/PROD-"
JIRA_AGILE_BOARD_URL="http://jira.aio-tv.com/secure/RapidBoard.jspa?rapidView=5&useStoredSettings=true"
GITHUB_PULL_BASE_URL="https://github.com/aioTV/aioTV/pull/"
GITHUB_BRANCH_BASE_URL="https://github.com/glmorgan/aioTV/tree"
GITHUB_PULLS_BASE_URL="https://github.com/aioTV/aioTV/pulls"
function usage() {
echo "Usage: $0"

echo "Options:"
echo ""
echo "   -h, --help    Display this message."
echo ""
echo "   -g            Load GitHub branch in browser "
echo "                 param: branch name"
echo "                 ./web_load.sh -g topic/PROD-123"
echo ""
echo "   -j, --jira    Load Jira ticket"
echo "                 param: ticket number"
echo "                 ./web_load.sh -j PROD-123"
echo ""
echo "   -p, --pulls   Load GitHub pull request"
echo "                 param pull request number"
echo "                 ./web_load.sh -p 12"
echo ""
echo "   -pu           Load user's GitHub pull request"
echo "                 ./web_load.sh -pu glmorgan"
echo ""
echo ""
}

function load_url() {
echo "Launching $1"
/usr/bin/open $1
}

while [[ $# -gt 0 ]]; do
    case $1 in
        -j|--jira)
            if [[ ! -z $2 ]]
            then
                load_url $JIRA_BASE_URL$2
            else
                load_url $JIRA_AGILE_BOARD_URL
            fi
            exit
            ;;
        -h|--help)
            usage
            exit
            ;;
        -p|-pn|--pull)
            if [[ ! -z $2 ]]
            then
                load_url "$GITHUB_PULL_BASE_URL$2"
            else
                load_url $GITHUB_PULLS_BASE_URL
            fi
            exit
            ;;
        -pu)
            if [[ ! -z $2 ]]
            then
                load_url "$GITHUB_PULLS_BASE_URL/$2"
            else
                load_url $GITHUB_PULLS_BASE_URL
            fi
            exit
            ;;
        -g)
            if [[ ! -z $2 ]]
            then
                load_url "$GITHUB_BRANCH_BASE_URL/$2"
            else
                usage
                echo "Branch required!"
            fi
    esac
    shift
done
