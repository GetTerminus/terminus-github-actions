#!/bin/bash

source log-messages.sh

function validateInput() {
  debug "$1"
  local -n arr=$1
  error_count=0
  for key in "${!arr[@]}";
    do
      if [ -z "${arr[${key}]}" ]
      then
        error_count=$((error_count+1))
        warning "${key} is empty." "${key} is empty."
      fi
    done
  if [ "$error_count" -gt 0 ]
  then
    error "Missing Required Inputs" "Missing required inputs. For a list of required inputs, please check the corresponding directory in: https://github.com/GetTerminus/terminus-github-actions"
    exit 1
  else
    success "Input validation passed!"
  fi
}
