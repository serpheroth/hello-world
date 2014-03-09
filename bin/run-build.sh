#!/bin/bash
#
# simple build script
set -x
set -e

# Warning: PATH could miss /usr/bin etc. (especially on Windows with Cygwin!)
addpath() {
    set +x
    local arg
    for arg; do
	[ -d "$arg" -a -x "$arg" ] || continue
	# assume bash here
	if ! [[ $PATH =~ "$arg" ]]; then
		PATH="$arg:$PATH"
	fi
    done
    set -x
}
addpath /bin /usr/bin /usr/local/bin /opt/local/bin
which qmake >/dev/null || \
	# on some systems, Qt installation may be $HOME
	# Linux: usually installed in /opt/Qt ....
	# Windows: usually installed in /c/Qt resp. /cygdrive/c/Qt
	addpath $(ls -d \
		$HOME/Qt*/*/*/bin \
		/opt/Qt/*/*/bin \
		/c/Qt/*/*/bin \
		/cygdrive/c/Qt/*/*/bin \
		2>/dev/null)
addpath $PWD/bin
echo "PATH=$PATH"

MAKE=make
QMAKE=qmake
OSTYPE=$(uname -s | tr [:upper:] [:lower:])
case "$OSTYPE" in
    darwin)
	QMAKE="qmake -spec macx-g++"
	# qmake defaults to use
	# /Applications/Xcode.app/Contents/Developer/usr/bin/g++ which
	# might be too old; we have a newer one installed in /opt/local/bin
	MAKE="make CC=/opt/local/bin/gcc CXX=/opt/local/bin/g++ LINK=/opt/local/bin/g++"
	;;
    cygwin*)
	MAKE="mingw32-make" 
	;;
esac

cd build
$QMAKE ../src/hello.pro
$MAKE
