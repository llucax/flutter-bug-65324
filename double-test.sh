#!/bin/sh
set -xeu

flutter pub get
flutter test
flutter test
