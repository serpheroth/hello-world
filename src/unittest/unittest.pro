# this qmake project file generates the unit test application

TARGET = unit-test
TEMPLATE = app

QT += testlib
QT -= gui

CONFIG += console
CONFIG -= app_bundle    # for Mac users
CONFIG += debug
CONFIG += testcase      # adds make target for 'make check'

HEADERS += \
    AutoTest.h

SOURCES += \
    testApp.cpp \
    testmain.cpp \
    testVersion.cpp \

DEPENDENCY_LIBRARIES += \
    app-lib \

include(../qmake/includes.pri)
include(../qmake/version.pri)
