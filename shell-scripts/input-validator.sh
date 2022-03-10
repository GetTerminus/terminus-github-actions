#!/bin/bash

error () {
  echo -e "\033[31;1mERROR:\033[0m $1"
}

info () {
  echo -e "\033[34;1mINFO:\033[0m $1"
}

function validateInput() {
   arr=("$@")
   error_count=0
   for i in "${arr[@]}";
      do
          if [ ! -z "$i" ]
          then
            error_count=$((error_count+1))
            error "$i is empty."
          fi
      done
  if [ "$error_count" -gt 0 ]
  then
    exit 1
  fi
}