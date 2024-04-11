GCLIENT_URL=https://src.chromium.org/svn/trunk/depot_tools/linux
CHROMIUM_URL=https://src.chromium.org/svn/trunk/src

# Checkout
svn co $GCLIENT_URL ./depot_tools
./depot_tools/gclient config $CHROMIUM_URL
./depot_tools/gclient sync

