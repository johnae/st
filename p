#!/usr/bin/sh

SKIP="st-customized-hidpi.diff"
if [ ! -z "$HIDPI" ]; then
    SKIP="st-customized.diff"
fi

make clean
git reset HEAD --hard

for patch in $(ls | grep '^st-.*\.diff'); do
  if [ "$patch" = "$SKIP" ]; then
      echo "SKIPPING patch: $patch"
      continue
  fi
  echo "Applying patch: $patch"
  patch < $patch
done

rm -f config.h
rm *.orig
