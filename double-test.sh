#!/bin/sh
set -xeu

# Make all read-write to avoid issues with the docker image user and the local user
sudo chmod -R a+rw .
flutter pub get
flutter test
flutter test
