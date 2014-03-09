# The application main routine.

TEMPLATE = app
QT -= gui
CONFIG += console
CONFIG -= app_bundle    # for Mac users

DEPENDENCY_LIBRARIES += \
    app-lib \

TARGET = hello
INCLUDEPATH += .

# Input
SOURCES += hello.cpp

include(../qmake/common.pri)
include(../qmake/includes.pri)
