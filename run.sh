#!/bin/bash

# check if dotcloud deploy key is present
if [ -z "$WERCKER_DOTCLOUD_DEPLOY_KEYNAME" ]; then
  fail "SSH key was not found. Do not prepend the keyname with a dollar sign and do not use _PRIVATE at the end."
fi

# check if dotcloud user email is present
if [ -z "$WERCKER_DOTCLOUD_DEPLOY_DCEMAIL" ]; then
  fail "Please provide dotCloud user email"
fi

export DC_EMAIL=$WERCKER_DOTCLOUD_DEPLOY_DCEMAIL

# check if dotcloud user password is present
if [ -z "$WERCKER_DOTCLOUD_DEPLOY_DCPASSWORD" ]; then
  fail "Please provide dotCloud user password"
fi

export DC_PASSWORD=$WERCKER_DOTCLOUD_DEPLOY_DCPASSWORD

# check if dotcloud app name is present
if [ -z "$WERCKER_DOTCLOUD_DEPLOY_APPNAME" ]; then
  fail "Please provide an application name"
fi

# if no deployment name is provided use the default - default
if [ -z "$WERCKER_DOTCLOUD_DEPLOY_DEPLOYNAME" ]; then
  export WERCKER_DOTCLOUD_DEPLOY_DEPLOYNAME=default
fi

# set up ssh key
"${WERCKER_STEP_ROOT}/add_key.sh" "${HOME}" "${WERCKER_DOTCLOUD_DEPLOY_KEYNAME}"

# install dotcloud cli
sudo pip install -U dotcloudng

# authenticate with dotcloud
dcuser setup

# deploy application
dcapp "${WERCKER_DOTCLOUD_DEPLOY_APPNAME}/${WERCKER_DOTCLOUD_DEPLOY_DEPLOYNAME}" push --deploy

