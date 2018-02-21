#!/usr/bin/sh

SKIP="st-customized-hidpi.diff"
if [ ! -z "$HIDPI" ]; then
    SKIP="st-customized.diff"
fi


COLORS=${COLORS:-dark}

make clean
git reset HEAD --hard

for patch in $(ls | grep '^st-.*\.diff'); do
  if [ "$patch" = "$SKIP" ]; then
      echo "SKIPPING patch: $patch"
      continue
  fi
  if echo $patch | grep "solarized" 2>&1 > /dev/null; then
      if ! echo $patch | grep "$COLORS" 2>&1 > /dev/null; then
          echo "SKIPPING patch: $patch"
          continue
      fi
  fi
  echo "Applying patch: $patch"
  patch < $patch
done

rm -f config.h
rm *.orig
