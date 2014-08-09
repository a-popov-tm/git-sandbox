#!/bin/bash

# This file is part of the Studio Fact package.
# For the full copyright and license information, please view the LICENSE
# file that was distributed with this source code.

if [ $EUID -ne 0 ]; then
  echo "This script should be run as root." > /dev/stderr
  exit 1
fi

USER_NAME=$1
USER_PASSWORD=$2

if [ "$USER_NAME" == '' ] || [ "$USER_PASSWORD" == '' ]; then
  read -p "Enter name and press [ENTER]: " USER_NAME
  read -s -p "Enter password and press [ENTER]: " USER_PASSWORD
fi

egrep "^$USER_NAME" /etc/passwd >/dev/null
if [ $? -eq 0 ]; then
  echo -e "$USER_NAME already exists. Please enter a different username."
  exit 1
fi

useradd -m -p ${USER_PASSWORD} ${USER_NAME}
if [ $? == 0 ]; then
  echo "User '$USER_NAME' has been added."
else
  echo "Failed to add a user."
fi

