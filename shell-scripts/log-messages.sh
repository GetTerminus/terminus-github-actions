#!/bin/bash

debug () {
  if [ -n "${DEBUG+x}" ]; then
    echo -e "\033[33;1mDEBUG:\033[0m $1"
  fi
}

if [ -n "${ECHO+x}" ]; then
  set -x
fi

error () {
  echo "::error title=$1::$2"
}

warning () {
  echo "::warning title=$1::$2"
}

success () {
  echo -e "\033[32;1mSUCCESS:\033[0m $1"
}

info () {
  echo -e "\033[34;1mINFO:\033[0m $1"
}
