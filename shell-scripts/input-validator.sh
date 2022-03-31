#!/bin/bash

function validateInput() {
  debug "$1"
  local -n arr=$1
  error_count=0
  for key in "${!arr[@]}";
    do
      if [ -z "${arr[${key}]}" ]
      then
        error_count=$((error_count+1))
        error "${key} is empty." "For a list of required inputs, please check the corresponding directory in: https://github.com/GetTerminus/terminus-github-actions"
      fi
    done
  if [ "$error_count" -gt 0 ]
  then
    exit 1
  else
    success "Input validation passed!"
  fi
}
