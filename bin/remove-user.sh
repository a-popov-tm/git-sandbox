#!/bin/bash

# This file is part of the Studio Fact package.
# For the full copyright and license information, please view the LICENSE
# file that was distributed with this source code.

if [ $EUID -ne 0 ]; then
  echo "This script should be run as root." > /dev/stderr
  exit 1
fi

USER_NAME=$1

if [ "$USER_NAME" == '' ]; then
  read -p "Enter name and press [ENTER]: " USER_NAME
fi

egrep "^$USER_NAME" /etc/passwd >/dev/null
if [ $? != 0 ]; then
  echo -e "$USER_NAME not exists. Please enter a different username."
  exit 1
fi

deluser --remove-home ${USER_NAME}
if [ $? == 0 ]; then
  echo "User '$USER_NAME' has been deleted."
else
  echo "Failed to delete a user."
fi