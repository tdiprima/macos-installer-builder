#!/usr/bin/env bash

banner() {
    echo "+------------------------------------------+"
    printf "| %-40s |\n" "$(date)"
    echo "|                                          |"
    printf "|$(tput bold) %-40s $(tput sgr0)|\n" "$@"
    echo "+------------------------------------------+"
}

banner "Installing maven"
brew install maven

banner "Installing ballerina"
brew install ballerina
