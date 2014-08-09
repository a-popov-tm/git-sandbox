#!/bin/bash

# This file is part of the Studio Fact package.
# For the full copyright and license information, please view the LICENSE
# file that was distributed with this source code.

if [ $EUID -ne 0 ]; then
  echo "This script should be run as root." > /dev/stderr
  exit 1
fi