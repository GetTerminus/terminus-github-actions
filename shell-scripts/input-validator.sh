#!/bin/bash

debug () {
  if [ -n "${VALIDATOR_DEBUG+x}" ]; then
    echo -e "\033[33;1mDEBUG:\033[0m $1"
  fi
}

if [ -n "${VALIDATOR_ECHO+x}" ]; then
  set -x
fi

error () {
  echo -e "\033[31;1mERROR:\033[0m $1"
}

success () {
  echo -e "\033[32;1mSUCCESS:\033[0m $1"
}

info () {
  echo -e "\033[34;1mINFO:\033[0m $1"
}

function validateInput() {
  debug "$1"
  local -n arr=$1
  error_count=0
  for key in "${!arr[@]}";
    do
      if [ -z "${arr[${key}]}" ]
      then
        error_count=$((error_count+1))
        error "${key} is empty."
      fi
    done
  if [ "$error_count" -gt 0 ]
  then
    info "For a list of required inputs, please check the corresponding directory in: https://github.com/GetTerminus/terminus-github-actions"
    exit 1
  else
    success "Input validation passed!"
  fi
}