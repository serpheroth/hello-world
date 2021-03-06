#!/bin/bash
#
# Generate header with version information

ME=${0##*/}

[ $# -eq 1 ] || \
    { echo >&2 "Usage: $ME target-file"; exit 1; }
TARGET=$1
TMPFILE=$TARGET.$$.tmp

REPO_VERSION=$(git describe --tags --always --dirty)

# if built from jenkins/hudson, BUILD_TAG is set already
if [ -z "$BUILD_TAG" ]; then
	BUILD_TAG="manual build by $(id -un) on $(date +%F) version $REPO_VERSION"
fi

cat > "$TMPFILE" <<-EOF
	// automatically generated by $ME on $(date +%F) - do not edit
	const char * BUILDTAG = "${BUILD_TAG}";
	const char * GITVERSION = "${REPO_VERSION}";
EOF

# if nothing changed, we keep the old file
if cmp -s -- "$TARGET" "$TMPFILE"
then
    echo "nothing changed"
    rm -- "$TMPFILE"
else
    echo "new version $SCM_REVISION"
    mv -- "$TMPFILE" "$TARGET"
fi
