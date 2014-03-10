#!/bin/bash
#
# simple "test" script - just calls the hello program
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

cd build
find . -name hello\* -ls || true

HELLO=./hello
OSTYPE=$(uname -s | tr [:upper:] [:lower:])
case "$OSTYPE" in
    cygwin*)
	HELLO=release/hello.exe
	;;
esac

$HELLO
exit $?		# just get another debug output with the exit code
