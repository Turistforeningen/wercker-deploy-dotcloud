#!/bin/bash

# check if dotcloud deploy key is present
if [ -z "$WERCKER_DOTCLOUD_DEPLOY_KEY" ]; then
  fail "Please provide an SSH key"
fi

# check if dotcloud app name is present
if [ -z "$WERCKER_DOTCLOUD_DEPLOY_APPNAME" ]; then
  fail "Please provide an application name"
fi

# if no deployment name is provided use the default - default
if [ -z "$WERCKER_DOTCLOUD_DEPLOY_DEPLOYNAME" ]; then
  export WERCKER_DOTCLOUD_DEPLOY_DEPLOYNAME=default
fi

# install dotcloud cli
sudo pip install -U dotcloudng

# authenticate with dotcloud
dcuser setup

# deploy application
dcapp $WERCKER_DOTCLOUD_DEPLOY_APPNAME/$WERCKER_DOTCLOUD_DEPLOY_DEPLOYNAME push --deploy

