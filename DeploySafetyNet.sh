#!/bin/bash
## Deploy Custom SafetyNet application
## Written by Mike Muir for CRTG
## 03/23/16

## This script will download and install a custom CrashPlan installation pre-configured for a specified CRTG Customer.
## See wiki.crtg.io for creation of custom SafetyNet installer.

###Part 1: Download installer from AWS instance to /tmp.
/usr/bin/curl [URL_of_Custom_Installer] > /tmp/Code42CrashPlan_Mac.dmg

###Part 2: Mount, install, and unmount installer.
hdiutil attach /tmp/Code42CrashPlan_Mac.dmg

/usr/sbin/installer -target / -pkg /Volumes/Code42CrashPlan/Install\ Code42\ CrashPlan.pkg

hdiutil detach /Volumes/Code42CrashPlan

###Part 3: Remove custom installer.
/bin/rm /tmp/Code42CrashPlan_Mac.dmg
