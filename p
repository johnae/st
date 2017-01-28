#!/usr/bin/sh

make clean
git reset HEAD --hard

for patch in $(ls | grep '^st-.*\.diff'); do
  echo "Applying patch: $patch"
  patch < $patch
done

rm -f config.h
rm *.orig
