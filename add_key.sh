#!/bin/bash

if [ ! -d "$1/.ssh" ]; then
  echo "Creating $1/.ssh.."
  mkdir -p "$1/.ssh"
  chmod 700 "$1/.ssh"
fi

private_key=$(eval echo "\$$2_PRIVATE")
public_key=$(eval echo "\$$2_PUBLIC")

echo "Creating $1/.ssh/id_rsa..."
echo -e "${private_key}" > "$1/.ssh/id_rsa"
chmod 600 "$1/.ssh/id_rsa"

echo "Creating $1/.ssh/id_rsa.pub..."
echo -e "${public_key}" > "$1/.ssh/id_rsa.pub"
chmod 600 "$1/.ssh/id_rsa.pub"

ls -la "$1/.ssh"

