# A simple hello world example with version number generation
# and unit test example
include(qmake/version.pri)

TEMPLATE = app
QT -= gui
CONFIG += console
CONFIG -= app_bundle    # for Mac users

TARGET = hello
INCLUDEPATH += .

# Input
SOURCES += app/hello.cpp
