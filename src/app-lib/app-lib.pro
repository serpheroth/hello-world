# $Id: app-lib.pro 1395 2013-11-22 16:52:12Z Herbert.Thielen $
#
# qmake project file to build the static library app-lib

QT -= gui
TARGET = app-lib
TEMPLATE = lib
CONFIG += staticlib
CONFIG += debug

HEADERS += appVersion.h
SOURCES += appVersion.cpp

# Currently qmake (version 3.0) does not remove a library
# target if the destination directory is not the build directory,
# so we try to add this. Unfortunately it may be non-platform-portable
# as we need to guess the real filename.
# See target 'distclean' in build/app-lib/Makefile
QMAKE_DISTCLEAN += $${DESTDIR}/lib$${TARGET}.$${LIBEXT}

include(../qmake/common.pri)
include(../qmake/version.pri)
