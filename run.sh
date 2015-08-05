if [ ! -x build-Ninja ]; then
  . update.sh
fi

cd build-Ninja && ninja && ./bin/livingbox.app/Contents/MacOS/livingbox
