#!/bin/bash

parent_path=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )

. $parent_path/functions.sh

enableReadWrite
helloWorld
enableAutomaticUpdates
giveGoodPasswords
disableGuestAccount
disableRemoteLogin
setAccountPolicies
installFirewall
disableRoot


