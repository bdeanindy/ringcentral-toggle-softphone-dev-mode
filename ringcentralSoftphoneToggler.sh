#!/bin/sh
# Author: Benjamin Dean
# RingCentral Softphone Development Mode Switch
#
# Operation summary: This script merely renames the config.ini file in place to switch the mode of the softphone between dev-prod
#
# Location of config.ini file on MacOSX: /Applications/RingCentral for Mac.app/Contents/MacOS/config.ini
#
# Format of config.ini file to configure RingCentral softphone on Mac to work with Developer's Sandbox Account
# HttpRegServer = "http://agentconnect.devtest.ringcentral.com"
# PlatformServer = "https://platform.devtest.ringcentral.com"
#
# Params:
  # 1. mode           - String, either `sandbox` or `production`, DEFAULT: `sandbox`
#
# Assumptions
# User is in a *nix type terminal with BASH

########################
# Utility Methods
########################
# WORKAROUND FOR OLD/NEW MAC OSX AND NEWLINES
if [ "`echo -n`" = "-n" ]; then
  n="";
  c="\c";
else
  n="-n";
  c="";
fi

# Set options to zero-length strings if not provided
function optionProvided() {
  if [ -n $1 ]; then
    echo $1;
  else
    echo '';
  fi
}

# File locator
function locateConfigFile() {
  if [ -e /Applications/RingCentral\ for\ Mac\.app/Contents/MacOS/config.ini ]
  then
    echo "config.ini"
  elif [ -e /Applications/RingCentral\ for\ Mac\.app/Contents/MacOS/configTMP.ini ]
  then
    echo "configTMP.ini"
  else
    echo ""
  fi
}

# Create config.ini (in sandbox mode)
function createConfigFile() {
  echo "$SANDBOX_CONFIG" > /Applications/RingCentral\ for\ Mac\.app/Contents/MacOS/config.ini 
  echo "config.ini file written to /Applications/RingCentral\ for\ Mac.app/Contents/MacOS/config.ini"
}

# Switch between sandbox and production modes (empty string param === sandbox mode)
# configTMP.ini   === production mode
# config.ini      === sandbox mode
function switchMode() {
  if [ -z "$1" ]
  then
    mv /Applications/RingCentral\ for\ Mac\.app/Contents/MacOS/configTMP.ini /Applications/RingCentral\ for\ Mac\.app/Contents/MacOS/config.ini
  else
    mv /Applications/RingCentral\ for\ Mac\.app/Contents/MacOS/config.ini /Applications/RingCentral\ for\ Mac\.app/Contents/MacOS/configTMP.ini
  fi
}

########################
# Variables
########################
SANDBOX_CONFIG="HttpRegServer = \"http://agentconnect.devtest.ringcentral.com\"\nPlatformServer = \"https://platform.devtest.ringcentral.com\"";

# Named parameters from CLI options
MODE=$(optionProvided $1);

# Cache the existing filename
FILENAME=;

########################
# Script
########################

FILENAME="$(locateConfigFile)"
#echo "$FILENAME"

# Create sandbox file
if [ "$MODE" = "" ] && [ "$FILENAME" = "" ]
then
  createConfigFile
  echo "config.ini file created. Upon next restart, your RingCentral desktop softphone will be in Sandbox Mode"
  echo "To switch back to production mode, just execute this file with the command line parameter 'production' (without quotes)."
  exit 0
fi

# Toggle Mode 
if [ "$MODE" = "production" ]
then
  switchMode "$MODE"
  echo "Upon next restart, your RingCentral desktop softphone will be in Production Mode"
  echo "To switch back to production mode, just execute this file with the command line parameter 'production' (without quotes)."
  exit 0
else
  switchMode
  echo "Upon next restart, your RingCentral desktop softphone will be in Sandbox Mode"
  echo "To switch back to sandbox mode, just execute this file optionally with the command line parameter 'sandbox' (without quotes)."
  exit 0
fi

