#!/usr/bin/sh

make clean
git reset HEAD --hard

COLORS=${COLORS:-dark}

if [ ! -z "$PIXELSIZE" ]; then
    sed -i "s|Pro:pixelsize\=[0-9]*|Pro:pixelsize=$PIXELSIZE|g" st-customized.diff
fi

for patch in $(ls | grep '^st-.*\.diff'); do
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
