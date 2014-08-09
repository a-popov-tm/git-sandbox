#!/bin/bash

# This file is part of the Studio Fact package.
# For the full copyright and license information, please view the LICENSE
# file that was distributed with this source code.

if [ $EUID -ne 0 ]; then
  echo "This script should be run as root." > /dev/stderr
  exit 1
fi

PROJECT_USER="dev"
PROJECT_PATH="/home/$PROJECT_USER"
PROJECT_NAME="$1"

if [ "$PROJECT_NAME" == '' ]; then
  read -p "Enter name project and press [ENTER]: " PROJECT_NAME
fi

if [ -d "$PROJECT_PATH/$PROJECT_NAME" ]; then
  rm -rf "$PROJECT_PATH/$PROJECT_NAME"
fi
